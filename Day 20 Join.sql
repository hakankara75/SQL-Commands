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

--hiç sipariş vermemiş müşterilerin isimlerini ve adreslerini listele
select M.musteri_ad, M.adres from musteriler M
LEFT JOIN siparisler S ON M.musteri_id= S.musteri_id
WHERE S.musteri_id IS NULL;

select * from musteriler

--7'den fazla sipariş veren müşterinin adını ve sipariş sayısını listele
select mus.musteri_ad,mus.musteri_id, sip.siparis_adedi from musteriler AS mus
INNER JOIN siparisler AS sip ON mus.musteri_id= sip.musteri_id
WHERE siparis_adedi>7;

--2 seferden fazla sipariş veren tüm müşterileri listele
select m.musteri_ad, COUNT(*) AS siparis_sayisi from musteriler m
JOIN siparisler s ON m.musteri_id= s.musteri_id
GROUP BY m.musteri_id, m.musteri_ad
HAVING COUNt(*) >2;

-- her müşterinin adresini ve sipariş verdiği son tarihi gösteren bir sorgu yazın
select m.musteri_ad, m.adres, MAX(s.siparis_tarihi) as son_siparis_tarihi
from musteriler m
RIGHT JOIN siparisler s ON m.musteri_id= s.musteri_id
GROUP BY m.musteri_id, m.adres
order by m.musteri_id;

--her müşterinin adını, adresini, sipariş verdiği pide türünü ve sipariş tarihlerini listele
select M.musteri_ad, M.adres, S.siparis_tarihi, S.pide_cesidi
from musteriler M
FULL JOIN siparisler S ON m.musteri_id= s.musteri_id
ORDER BY M.musteri_id, S.siparis_tarihi;

select * from musteriler



