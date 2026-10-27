import pandas as pd
import sqlite3

# 1. Membaca dataset
df = pd.read_csv('data_pangan_nasional.csv')
df.columns = df.columns.str.strip()

# -------------------------------------------------------------
# DBMS 1: SQLite (Fact Table - Data Histori Konsumsi)
# -------------------------------------------------------------
df_fact = df[['Komoditas', 'Tahun', 'konsumsi_pangan']].copy()

conn_sqlite = sqlite3.connect('pangan_fact.db')
df_fact.to_sql('konsumsi_tahunan', conn_sqlite, if_exists='replace', index=False)
conn_sqlite.close()
print("✅ DBMS 1 (SQLite) berhasil dibuat: pangan_fact.db")

# -------------------------------------------------------------
# DBMS 2: Persiapan Skrip SQL untuk Supabase PostgreSQL
# -------------------------------------------------------------
df_master = df[['Komoditas', 'Kelompok Bahan Pangan', 'Satuan']].drop_duplicates().copy()
df_master.rename(columns={'Kelompok Bahan Pangan': 'kelompok_pangan'}, inplace=True)

with open('schema_supabase.sql', 'w', encoding='utf-8') as f:
    f.write("""-- Skema & Seed Data Master Komoditas (Supabase PostgreSQL)
CREATE TABLE IF NOT EXISTS master_komoditas (
    komoditas VARCHAR(255) PRIMARY KEY,
    kelompok_pangan VARCHAR(255),
    satuan VARCHAR(50)
);\n\n""")
    for _, row in df_master.iterrows():
        kom = str(row['Komoditas']).replace("'", "''")
        kel = str(row['kelompok_pangan']).replace("'", "''")
        sat = str(row['Satuan']).replace("'", "''")
        f.write(f"INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('{kom}', '{kel}', '{sat}') ON CONFLICT DO NOTHING;\n")

print("✅ Berkas 'schema_supabase.sql' berhasil dibuat!")