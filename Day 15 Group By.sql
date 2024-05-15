/*
GROUP BY

GROUP BY cümleciği bir SELECT ifadesinde satırları, sütunların değerlerine göre verileri özetlemek ve analiz etmek için GRUPLAMAK için kullanılır.

GROUP BY cümleciği her grup başına bir satır döndürür.

GROUP BY genelde, AVG(), COUNT(), MAX(), MIN() ve SUM() gibi aggregate fonksiyonları ile birlikte kullanılır.

GROUP BY cümleciği, SELECT cümleciğinin FROM ve WHERE kısımlarından sonra gelir.
GROUP BY cümleciğinde, gruplama işleminin yapılacağı sütunların adları belirtilir.
Birden fazla sütuna göre gruplama yapmak için sütun adları virgülle ayrılır.
Bir sütuna göre gruplama yaparken, o sütunun değerleri benzersiz olmalıdır.
GROUP BY cümleciği ile birlikte aggregate fonksiyonları kullanılmadığında, her grup için her sütunun değeri ayrı ayrı listelenir.

*/
CREATE TABLE ogrenciler(
ingilizce_notu INT PRIMARY KEY,
	not_ortalamasi REAL not null,
	kulup_calismasi VARCHAR(50 ) not null,
	cinsiyet VARCHAR(5) not null,
	bolum VARCHAR(50 ) not null
)

INSERT INTO ogrenciler (ingilizce_notu ,not_ortalamasi ,kulup_calismasi ,
	cinsiyet ,bolum)
	VALUES
	(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
	(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
	(1595, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
	(65, 85, 'Gitar', 'Kadın', 'Matematik'),
	(74, 99, 'Gitar', 'Erkek', 'Elektrik Mühendisliği'),
	(89, 67, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
	(91, 38, 'Ebru', 'Kadın', 'Bilgisayar Mühendisliği'),
	(85, 85, 'Havacılık', 'Erkek', 'Elektrik Mühendisliği'),
	(90, 79, 'Maket', 'Kadın', 'Matematik'),
	(36, 67, 'Maket', 'Erkek', 'Elektrik Mühendisliği');

select * from ogrenciler

--öğrencilerin okudukları bölümlerin not ortalamasını listele
select bolum, AVG(not_ortalamasi) from ogrenciler GROUP BY bolum

--öğrencilerin okudukları bölümlerin ingilizce not ortalamasını listele
select bolum, round(AVG(ingilizce_notu)) AS ingilizce_not_ortalamasi from ogrenciler
GROUP BY bolum;

--öğrencilerin kulüp çalışmalarına göre ingilizce not ortalamasını listele
select kulup_calismasi, round(AVG(ingilizce_notu),2) AS ingilizce_not_ortalamasi from ogrenciler
GROUP BY kulup_calismasi;

--öğrencilerin cinsiyetlerine göre hangi bölümde kaç kişi olduğunu listele
select cinsiyet, bolum, COUNT(cinsiyet) AS kisi_sayisi from ogrenciler 
GROUP BY cinsiyet, bolum

--öğrencilerden hangi klüp çalışmalarına hangi bölüm öğrencilerinin kaç kişi olarak katıldığını cinsiyete göre listele
select kulup_calismasi, bolum, cinsiyet, COUNT (*) katilan_ogrenci_sayisi
from ogrenciler GROUP BY kulup_calismasi, bolum, cinsiyet

--KLUP çalışmasına ve bölüme göre ingilizce not ortalamasını ve not ortalamasını listele
select kulup_calismasi , bolum, round(AVG(ingilizce_notu),2) AS ingilizce_not_ortalamasi,
AVG(not_ortalamasi) AS dersler_not_ortalamasi
from ogrenciler
GROUP BY kulup_calismasi, bolum

--İngilizce notu 70'ten büyük olanların cinsiyetine göre klup çalışmalarına katılanların sayısını listele
select cinsiyet, kulup_calismasi, COUNT(cinsiyet) from ogrenciler
WHERE ingilizce_notu>70
GROUP BY  cinsiyet, kulup_calismasi

--Klup ve bölüme göre öğrencilerin not ortalaması ve ingilizce notunun ortalaması listele
select kulup_calismasi,bolum, AVG (not_ortalamasi) AS ortalama_not,
round(AVG(ingilizce_notu)) as ingilizce_not_ortalamasi from ogrenciler
GROUP BY kulup_calismasi,bolum

	
	

	
	CREATE TABLE ogrenci_bilgiler(
ingilizce_notu INT not null,
	not_ortalamasi REAL not null,
	kulup_calismasi VARCHAR(50 ) not null,
	cinsiyet VARCHAR(5) not null,
	bolum VARCHAR(50 ) not null
)

INSERT INTO ogrenci_bilgiler (ingilizce_notu ,not_ortalamasi ,kulup_calismasi ,
	cinsiyet ,bolum)
	VALUES
	(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
	(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
	(1595, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
	(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
	(1595, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik');

select * from ogrenci_bilgiler

/*
HAVING
GROUP BY yapıldıktan sonra filtrelemede şart koşulması durumunda kullanılır.
Yani WHERE komutu GROUP BY yapılmadan önce şart koşmada kullanılırken,
HAVING komutu GROUP BY yapıldıktan sonra şart koşulma durumunda kullanılır.
*/
--Ogrencileri kulüp çalışmalarına göre ingizlizce not ortalamasını bulup not ortalaması 50'nin stünde olanları listele
SELECT kulup_calismasi, AVG(ingilizce_notu) AS ortalama_ingilizce_notu
FROM ogrenci_bilgiler
GROUP BY kulup_calismasi
HAVING AVG(ingilizce_notu) > 50

--öğrencileri bölüm ve not ortalamasına göre grupladıktan sonra ingilizce notu 50 den aşağı olanları listele
SELECT bolum, not_ortalamasi, ingilizce_notu
FROM ogrenci_bilgiler
GROUP BY bolum, not_ortalamasi,ingilizce_notu
HAVING ingilizce_notu < 50;

/*
UNION ve UNION ALL
iki ya da daha fazla sorguda sonuçları birleştirmede kullanılır
UNION benzersiz verilerde kullanılır
UNION ALL benzerli verilerde de kullanılabilir
Sorgu birleştirmede veri türleri uyumlu olmalı
*/

-- not ortalaması 60'ın üstünde olan öğrencilerin cinsiyetini ve
--Not ortalaması 80'in ÜSTÜNDE olan öğrenciLERİN BÖLÜMLERİNİ tekrarsız şekilde listele
select not_ortalamasi,cinsiyet from ogrenci_bilgiler where not_ortalamasi>60
UNION
select not_ortalamasi,bolum from ogrenci_bilgiler where not_ortalamasi>80

--Elektrik Mühendisliği'NDEKİ öğrencilerin not ortalamalarını ve
--not ortalaması 70'in üstünde olanların bölümlerini tekrarsız
--büyükten küçüğe doğru sıralayan kodu yaz
select bolum,not_ortalamasi from ogrenci_bilgiler where bolum='Elektrik Mühendisliği'
UNION ALL
select bolum, not_ortalamasi from ogrenci_bilgiler where not_ortalamasi>70 
ORDER BY bolum DESC

/*
kulüp çalışmalarına katılanların Bilgisayar Mühendisliği öğrencisi olmayanların  ingilizce notu ortalaması ile
kulüp çalışmalarına katılanlardan Matematik bölümü öğrencisi olmayanların ingilizce notunu ortalamasını listeleyin
*/
select kulup_calismasi, round(avg(ingilizce_notu)) as ortalama
from ogrenci_bilgiler where bolum != 'Bilgisayar Mühendisliği'
group by kulup_calismasi
UNION ALL
select kulup_calismasi, round(avg(ingilizce_notu)) as ortalama
from ogrenci_bilgiler
where bolum != 'Matematik'
group by kulup_calismasi

/*
Kadınların not ortalaması, ingilizce notu ve bölümlerini
erkeklerin not ortalaması, ingilizce notu ve bölümlerini
tekrarsız olarak listele
*/
select cinsiyet, ingilizce_notu,bolum from ogrenci_bilgiler where cinsiyet='Kadın'
UNION
select cinsiyet, ingilizce_notu,bolum from ogrenci_bilgiler where cinsiyet='Erkek'

/*
katıldığı kulüp çalışması 'Ebru', 'Havacılık' ve 'Maket' olan öğrencilerin
ingilizce notlarını listele
*/
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler where kulup_calismasi='Ebru'
UNION ALL
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler where kulup_calismasi='Havacılık'
UNION ALL
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler where kulup_calismasi='Maket'

/* ingilizce notu 15 olan öğrencilerin cinsiyet ve bölümlerini
ingilizce notu 46 olan öğrencilerin kulüp faaliyeti ve bölümlerini listeleyin
*/
select ingilizce_notu, cinsiyet as cinsiyet_kulüp, bolum from ogrenci_bilgiler where ingilizce_notu=15
UNION ALL
select ingilizce_notu,kulup_calismasi, bolum from ogrenci_bilgiler where ingilizce_notu=46

SELECT * FROM ogrenci_bilgiler
 ogrenciler (ingilizce_notu,not_ortalamasi,kulup_calismasi, cinsiyet, bolum)
 
 
 
 