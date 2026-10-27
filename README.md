# 🌾 Dashboard Analisis Konsumsi Pangan Nasional (Multi-DBMS Data Pipeline)

Aplikasi web interaktif berbasis Streamlit untuk menganalisis rata-rata konsumsi per jenis pangan penduduk Indonesia secara nasional tahun 2025. Proyek ini mengintegrasikan *data pipeline* dari dua sistem basis data yang berbeda (Multi-DBMS hibrida).

---

## 🏗️ Arsitektur Data & Multi-DBMS Pipeline

Proyek ini menggabungkan dua sumber data melalui proses *joining* di tingkat aplikasi menggunakan Python (Pandas):

1. **SQLite (`pangan_fact.db`)**: Berfungsi sebagai *Fact Table* yang menyimpan data historis transaksi/tahunan rata-rata konsumsi pangan.
2. **Supabase PostgreSQL (AWS Pooler)**: Berfungsi sebagai *Master Table* (`master_komoditas`) yang menyimpan metadata komoditas dan pengelompokan jenis pangan.

---

## 🚀 Fitur Utama

- **Integrasi Hibrida Multi-DBMS**: *Merging* data secara *real-time* dari SQLite dan PostgreSQL (Supabase).
- **Filter Interaktif**: Pemilihan kelompok pangan (multiselect) dan filter rentang tahun (slider).
- **KPI & Visualisasi**: 
  - Metrik utama (Total Records, Jumlah Komoditas, Rata-rata Konsumsi).
  - Grafik batang konsumsi per kelompok pangan (Seaborn/Matplotlib).
  - Grafik tren konsumsi tahunan.
- **Ekspor Data**: Fitur unduh tabel data terfilter dalam format CSV.

---

## 🛠️ Teknologi & Pustaka

- **Bahasa**: Python 3.x
- **Framework Web**: Streamlit
- **Basis Data**: SQLite3 & PostgreSQL (psycopg2)
- **Manipulasi Data**: Pandas
- **Visualisasi**: Matplotlib & Seaborn

---

## 🔗 Tautan Aplikasi Cloud

- **Live Application**: [Streamlit Cloud App](https://tugasvisdatpangandashboard-g66ww9twkmbksqgjytmag3.streamlit.app)