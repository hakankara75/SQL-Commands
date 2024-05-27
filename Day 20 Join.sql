/*
JOIN 

JOIN, iki veya daha fazla tabloyu ortak bir sütuna veya başka bir bağlantı kriterine göre birleştirmek için kullanılır. 
Bu işlemler, karmaşık veritabanı sorgularında veri kümelerini birleştirmek ve analiz etmek için oldukça önemlidir.

INNER JOIN: Bu işlem, her iki tabloda da ortak bir değere sahip olan kayıtları birleştirir.
LEFT JOIN: Bu işlem, sol tablodan tüm kayıtları, sağ tablodan ise ortak değere sahip olan kayıtları birleştirir.
Eğer soldaki tabloda eşleşmeyen satırlar varsa, bu satırların yerinde NULL değerler döner.
RIGHT JOIN: Bu işlem, sağ tablodan tüm kayıtları, sol tablodan ise ortak değere sahip olan kayıtları birleştirir.
Eğer soldaki tabloda eşleşmeyen satırlar varsa, bu satırların yerinde NULL değerler döner.
FULL JOIN: Bu işlem, her iki tablodan da tüm kayıtları birleştirir, ortak değere sahip olmayan kayıtlar için boş değerler gösterir
*/

CREATE TABLE musteriler (
    musteri_id INT PRIMARY KEY,
    musteri_ad VARCHAR(50) NOT NULL,
    adres VARCHAR(255) NOT NULL
);

CREATE TABLE siparisler (
    siparis_adedi INT NOT NULL,
    siparis_tarihi DATE NOT NULL,
    musteri_id INT NOT NULL,
    pide_cesidi VARCHAR(50) NOT NULL,
    FOREIGN KEY (musteri_id) REFERENCES musteriler(musteri_id)
);

INSERT INTO musteriler (musteri_id,musteri_ad, adres) VALUES
(1,'Ali Veli', 'Karargah Sokak'),
(2,'Ayşe Yılmaz', 'Elif Sokak'),
(3,'Mehmet Kara', 'Abdülfeyyaz Sokak'),
(4,'Tunç Saldı', 'Şen Sokak');

INSERT INTO siparisler ( siparis_adedi, siparis_tarihi, musteri_id, pide_cesidi) VALUES
(4,'2024-04-01', 1, 'Kıymalı'),
(6,'2024-04-02', 2, 'Kaşarlı'),
(3,'2024-04-03', 3, 'Sucuklu'),
(7,'2024-04-04', 1, 'Kuşbaşılı'),
(12,'2024-04-05', 2, 'Kıymalı'),
(3,'2024-04-06', 3, 'Kuşbaşılı'),
(9,'2024-04-07', 1, 'Kaşarlı');

--Hiç sipariş vermemiş müşterilerin isimlerini ve adreslerini listeleyin.
--on ile ortak satırlar belirtilir
SELECT m.musteri_ad, m.adres
FROM musteriler m
LEFT JOIN siparisler s ON m.musteri_id = s.musteri_id
WHERE s.musteri_id IS NULL;

--7'den fazla sipariş veren müşterinin adını ve sipariş sayısını listeleyin.
SELECT M.musteri_ad, M.musteri_id 
FROM musteriler AS m
INNER JOIN siparisler AS s ON m.musteri_id = s.musteri_id
WHERE siparis_adedi>7

--2 seferden fazla sipariş veren tüm müşterileri listeleyin.
SELECT m.musteri_ad, m.adres, COUNT(*) AS siparis_sayisi
FROM musteriler m
JOIN siparisler s ON m.musteri_id = s.musteri_id
GROUP BY m.musteri_id, m.musteri_ad, m.adres
HAVING COUNT(*) > 2;

--Her müşterinin adresini ve sipariş verdiği son tarihi (varsa) gösteren bir sorgu yazın.
SELECT m.musteri_ad, m.adres, MAX(s.siparis_tarihi) AS son_siparis_tarihi
FROM musteriler m
RIGHT JOIN siparisler s ON m.musteri_id = s.musteri_id
GROUP BY m.musteri_id, m.adres
ORDER BY m.musteri_id;

--Her müşterinin adını, adresini, sipariş verdiği pide türlerini ve sipariş tarihlerini (varsa) gösteren bir sorgu yazın.
SELECT m.musteri_ad, m.adres, s.pide_cesidi, s.siparis_tarihi
FROM musteriler m
FULL JOIN siparisler s ON m.musteri_id = s.musteri_id
ORDER BY m.musteri_id, s.siparis_tarihi;



