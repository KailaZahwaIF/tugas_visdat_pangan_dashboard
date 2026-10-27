import streamlit as st
import pandas as pd
import sqlite3
import psycopg2
import matplotlib.pyplot as plt
import seaborn as sns

st.set_page_config(page_title="Dashboard Konsumsi Pangan", layout="wide", page_icon="🌾")

st.title("🌾 Dashboard Analisis Rata-rata Konsumsi per Jenis Pangan Penduduk Indonesia Nasional")
st.caption("Multi-DBMS Data Pipeline: SQLite (Fact Table) + Supabase PostgreSQL (Master Table)")

# 1. Integrasi Multi-DBMS (Data Pipeline)
@st.cache_data
def load_data():
    # Ambil Data dari DBMS 1 (SQLite)
    conn_sqlite = sqlite3.connect("pangan_fact.db")
    df_fact = pd.read_sql_query("SELECT * FROM konsumsi_tahunan", conn_sqlite)
    conn_sqlite.close()

    # Ambil Data dari DBMS 2 (Supabase PostgreSQL via AWS Pooler)
    db_url = "postgres://postgres.psmndoslquyulwrlcebb:VisdatPangan2026!%23DB@aws-0-ap-southeast-1.pooler.supabase.com:6543/postgres"
    conn_pg = psycopg2.connect(db_url)
    df_master = pd.read_sql_query("SELECT * FROM master_komoditas", conn_pg)
    conn_pg.close()

    # Data Joining / Data Pipeline via Pandas
    df_merged = pd.merge(df_fact, df_master, left_on="Komoditas", right_on="komoditas")
    return df_merged

try:
    df = load_data()
except Exception as e:
    st.error(f"Gagal menghubungkan ke basis data: {e}")
    st.stop()

# 2. Sidebar Filter
st.sidebar.header("🎛️ Filter Data")
kelompok_list = df['kelompok_pangan'].unique().tolist()
selected_kelompok = st.sidebar.multiselect("Pilih Kelompok Pangan:", kelompok_list, default=kelompok_list)

min_yr, max_yr = int(df['Tahun'].min()), int(df['Tahun'].max())
selected_years = st.sidebar.slider("Rentang Tahun:", min_value=min_yr, max_value=max_yr, value=(min_yr, max_yr))

# Filter Dataframe
filtered_df = df[
    (df['kelompok_pangan'].isin(selected_kelompok)) &
    (df['Tahun'] >= selected_years[0]) &
    (df['Tahun'] <= selected_years[1])
]

# 3. Metrik Utama (KPI)
col1, col2, col3 = st.columns(3)
col1.metric("Total Records", f"{len(filtered_df)}")
col2.metric("Jumlah Komoditas", f"{filtered_df['Komoditas'].nunique()}")
avg_val = filtered_df['konsumsi_pangan'].mean() if not filtered_df.empty else 0
col3.metric("Rata-rata Konsumsi", f"{avg_val:.2f} kg/kap/tahun")

st.divider()

# 4. Visualisasi Data
if not filtered_df.empty:
    col_left, col_right = st.columns(2)
    with col_left:
        st.subheader("Rata-rata Konsumsi per Kelompok Pangan")
        fig1, ax1 = plt.subplots(figsize=(8, 5))
        avg_grp = filtered_df.groupby('kelompok_pangan')['konsumsi_pangan'].mean().sort_values(ascending=False)
        sns.barplot(x=avg_grp.values, y=avg_grp.index, palette="viridis", ax=ax1)
        ax1.set_xlabel("Konsumsi (kg/kap/tahun)")
        st.pyplot(fig1)

    with col_right:
        st.subheader("Tren Konsumsi Tahunan")
        fig2, ax2 = plt.subplots(figsize=(8, 5))
        trend = filtered_df.groupby('Tahun')['konsumsi_pangan'].sum().reset_index()
        sns.lineplot(data=trend, x='Tahun', y='konsumsi_pangan', marker='o', color='green', linewidth=2, ax=ax2)
        ax2.set_ylabel("Total Konsumsi")
        ax2.grid(True, linestyle='--', alpha=0.5)
        st.pyplot(fig2)

st.divider()

# 5. Tabel & Ekspor
with st.expander("📋 Lihat Tabel & Unduh Data"):
    st.dataframe(filtered_df[['Komoditas', 'kelompok_pangan', 'Tahun', 'konsumsi_pangan', 'satuan']], use_container_width=True)
    st.download_button(
        "📥 Unduh CSV",
        data=filtered_df.to_csv(index=False).encode('utf-8'),
        file_name='konsumsi_pangan_filtered.csv',
        mime='text/csv'
    )