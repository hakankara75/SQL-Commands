/*
ORDER BY
Bir sütunda sorgu yaparken sütunu büyükten küçüğe sıralamada kullanılır.
Bu sıralama sayısal değerler için 0-9 veya 9-0 şeklinde olur.
Bu sıralama kelime değerleri için A-Z veya Z-A şeklinde olur.

*/

CREATE TABLE otobus_firmalari(
firma_markasi VARCHAR(50),
					 koltuk_sayisi INT,
					 yolcu_sayisi INT NOT NULL, 
					 cikis_saati TIME,
					 sira_no INT

);

INSERT INTO otobus_firmalari(firma_markasi, koltuk_sayisi,  yolcu_sayisi, cikis_saati ,	 sira_no )
VALUES 
('Metro Turizm', 50, 40,'09:00:00',1),
('Pamukkkale Turizm', 45, 35,'10:30:00',2),
('Kamil Koç', 55, 45,'11:45:00',3),
('Kamil Koç', 40, 27,'22:42:05',4),
('Ulusoy Turizm', 45, 41,'13:15:54',5),
('Ulusoy Turizm', 55, 38,'21:27:44',6),
('Petrol Turizm', 48, 38,'14:45:30',7),
('Petrol Turizm', 55, 45,'17:12:11',8);


select * from otobus_firmalari

-- Tablodaki Petrol Turizm otobüslerinin çıkış saatini büyükten küçüğe doğru sıralayın
select * from otobus_firmalari where firma_markasi='Petrol Turizm' ORDER BY cikis_saati DESC

--Tablodaki koltuk sayısı 55 olan firma markalarını 'A' dan 'Z' ye doğru listele
select *from otobus_firmalari where koltuk_sayisi=55 ORDER BY firma_markasi ASC

--Tablodaki Ulusoy marka otobüsleri sıra nosuna göre listeleyin
select * from otobus_firmalari where firma_markasi='Ulusoy Turizm' ORDER BY sira_no

--Tabloya göre çıkış saati 12'den sonra olan otobüs firmalarını yolcu sayısına göre listele
select * from otobus_firmalari where cikis_saati>'12:00:00' ORDER BY yolcu_sayisi

--Tabloya göre yolcu sayısı 40'tan aşağı olan otobüslerin çıkış saatini geç saatten erken saate göre listele
select * from otobus_firmalari where yolcu_sayisi < 40 ORDER BY cikis_saati DESC


select * from otobus_firmalari

/*
LİMİT
Sorgulama işlemlerimizin sonuçlarını belirli sınırlar koyarak listelemeye yarar
*/

CREATE TABLE ogrenci(
ogrenci_id INT PRIMARY KEY,
isim VARCHAR(50),
not_ortalamasi DECIMAL (5,2),
	sinav_notu INT
);

INSERT INTO ogrenci(ogrenci_id ,isim ,not_ortalamasi ,	sinav_notu) VALUES
(1, 'Ahmet Yılmaz', 98.15,85),
(2, 'Ayşe Demir', 88.79,75),
(3, 'Mehmet Kaya', 79.12,90),
(4, 'Fatma Öztürk', 99.00,70),
(5, 'Ali Yıldız', 85.73,90),
(6, 'Zeynep Çelik', 66.99,95),
(7, 'Mustafa Kara', 71.77,85),
(8, 'Gülşen Toprak', 90.67,65),
(9, 'Canan Ateş', 87.32,88),
(10, 'Burak Demir', 89.59,92);

--Tabloda sınav notu 80'den büyük ilk 3 notu listele
select sinav_notu from ogrenci where sinav_notu>80 LIMIT 3;

--Tablodan not ortalaması 80'den büyük ilk 3 kişiyi listele
select isim from ogrenci where not_ortalamasi>80 LIMIT 3

--Tabloda not ortalaması en yüksek ilk 3 datayı listele
select * from ogrenci ORDER BY not_ortalamasi DESC LIMIT 3

-Tabloda sınav notu en düşük isimden sonraki 3 ismi listele
select isim from ogrenci ORDER BY sinav_notu ASC OFFSET 1 LIMIT 3

Tabloda öğrenci sırası en sondaki öğrencilerden ilk 2 sinden sonraki 5 datayı listele
select * from ogrenci ORDER BY ogrenci_id DESC OFFSET 2 LIMIT 5

select * from ogrenci












