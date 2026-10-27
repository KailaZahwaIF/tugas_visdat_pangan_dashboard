-- Skema & Seed Data Master Komoditas (Supabase PostgreSQL)
CREATE TABLE IF NOT EXISTS master_komoditas (
    komoditas VARCHAR(255) PRIMARY KEY,
    kelompok_pangan VARCHAR(255),
    satuan VARCHAR(50)
);

INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Padi-padian', 'Padi-padian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Beras', 'Padi-padian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Jagung', 'Padi-padian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Terigu', 'Padi-padian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Umbi-umbian', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Singkong', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Ubi Jalar', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kentang', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Sagu', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Umbi Lainnya', 'Umbi-umbian', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Pangan Hewani', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Daging Ruminansia', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Daging Unggas', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Telur', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Susu', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Ikan', 'Pangan Hewani', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Minyak dan Lemak', 'Minyak dan Lemak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Minyak Kelapa', 'Minyak dan Lemak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Minyak Sawit', 'Minyak dan Lemak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Minyak Lainnya', 'Minyak dan Lemak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Buah/biji berminyak', 'Buah/biji berminyak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kelapa', 'Buah/biji berminyak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kemiri', 'Buah/biji berminyak', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kacang-kacangan', 'Kacang-kacangan', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kedelai', 'Kacang-kacangan', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kacang Tanah', 'Kacang-kacangan', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kacang Hijau', 'Kacang-kacangan', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Kacang Lain', 'Kacang-kacangan', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Gula', 'Gula', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Gula Pasir', 'Gula', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Gula Merah', 'Gula', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Sayuran dan buah', 'Sayuran dan buah', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Sayur', 'Sayuran dan buah', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Buah', 'Sayuran dan buah', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Lain-lain', 'Lain-lain', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Minuman', 'Lain-lain', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
INSERT INTO master_komoditas (komoditas, kelompok_pangan, satuan) VALUES ('Bumbu-Bumbuan', 'Lain-lain', 'kg/kap/tahun') ON CONFLICT DO NOTHING;
