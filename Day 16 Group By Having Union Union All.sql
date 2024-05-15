/*
HAVING
GROUP BY yapıldıktan sonra filtrelemede şart koşulması durumunda kullanılır.
Yani WHERE komutu GROUP BY yapılmadan önce şart koşmada kullanılırken,
HAVING komutu GROUP BY yapıldıktan sonra şart koşulma durumunda kullanılır.
*/

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
	(95, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(15, 56, 'Havacılık', 'Erkek', 'Bilgisayar Mühendisliği'),
	(27, 67, 'Maket', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik'),
	(46, 34, 'Gitar', 'Erkek', 'Bilgisayar Mühendisliği'),
	(95, 90, 'Çini', 'Kadın', 'Elektrik Mühendisliği'),
	(39, 89, 'Ebru', 'Erkek', 'Matematik');
	
	select * from ogrenci_bilgiler

-- Öğrenci klüp çalışmalarına göre ingilizce not ortalamasını bulup ingilizce not ortalaması 50'nin üstünde olanları listele
select kulup_calismasi , AVG(ingilizce_notu) as ingilizce_not_ortalamasi
from ogrenci_bilgiler
GROUP BY kulup_calismasi
HAVING AVG(ingilizce_notu)>50

--öğrencilerin bölüm  ve not ortalamasına göre grupladıktan sonra ingilizce notu 50 den aşağıda olanları listele
select bolum,not_ortalamasi, ingilizce_notu 
from ogrenci_bilgiler
GROUP BY bolum,not_ortalamasi, ingilizce_notu 
HAVING ingilizce_notu <50

/*
UNION ve UNION ALL
iki ya da daha fazla sorguda sonuçları birleştirmede kullanılır
UNION benzersiz verilerde kullanılır
UNION ALL benzerli verilerde de kullanılabilir
Sorgu birleştirmede veri türleri uyumlu olmalı
*/

--not ortalaması 60'ın üstünde olan öğrencilerin cinsiyeti ve
--not ortalaması 80'in üstünde olan öğrencilerin bölümünü tekrarsız olarak listele
select not_ortalamasi, cinsiyet from ogrenci_bilgiler WHERE not_ortalamasi>60
UNION
select not_ortalamasi,bolum from ogrenci_bilgiler WHERE not_ortalamasi>80


--Elektrik Mühendisliği'ndeki öğrencilerin not ortalamaları ve 
--not ortalaması 70'in üstünde olan öğrencilerin bölümlerini 
--tekrarsız ve büyükten küçüğe listele
select bolum, not_ortalamasi  from ogrenci_bilgiler WHERE bolum='Elektrik Mühendisliği'
GROUP BY bolum, not_ortalamasi 
UNION
select bolum, not_ortalamasi from ogrenci_bilgiler WHERE not_ortalamasi>70
GROUP BY bolum, not_ortalamasi 
ORDER BY bolum DESC


--klüp çalışmalarına katılanların Bilgisayar Mühendisiliği öğrencisi olmayanların ingilizce notu ortalaması ile
--klüp çalışmalarına katılanların Matematik bölümü öğrencisi olmayanların ingilizce notu ortalamasını listele
select kulup_calismasi, round(AVG(ingilizce_notu)) as ortalama
from ogrenci_bilgiler WHERE bolum !='Bilgisayar Mühendisiliği'
GROUP BY kulup_calismasi
UNION ALL
select kulup_calismasi, round(AVG(ingilizce_notu)) as ortalama
from ogrenci_bilgiler WHERE bolum !='Matematik'
GROUP BY kulup_calismasi

--kadınların not ortalaması, ingilizce notu ve bölümlerini
--erkeklerin not ortalaması, ingilizce notu ve bölümlerini
--tekrarsız listele
select cinsiyet, not_ortalamasi ,ingilizce_notu, bolum from ogrenci_bilgiler 
GROUP BY cinsiyet, not_ortalamasi ,ingilizce_notu, bolum HAVING cinsiyet='Kadın'
UNION
select cinsiyet, not_ortalamasi ,ingilizce_notu, bolum from ogrenci_bilgiler
GROUP BY cinsiyet, not_ortalamasi ,ingilizce_notu, bolum HAVING cinsiyet='Erkek'


--katıldığı klüp çalışması 'Ebru', 'Havacılık', 'Maket' olan öğrencilerin ingilizce notları 85'ten büyük olanları listele
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler WHERE kulup_calismasi='Ebru'
UNION ALL
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler WHERE kulup_calismasi='Havacılık'
UNION ALL
select kulup_calismasi, ingilizce_notu from ogrenci_bilgiler WHERE kulup_calismasi='Maket'
GROUP BY kulup_calismasi, ingilizce_notu HAVING ingilizce_notu>85


--ingilizce notu 15 olan öğrencilerin cinsiyet ve bölümlerini
--ingilizce notu 46 olan öğrencilerin kulüp faaliyetleri ve bölümlerini listeleyin
select ingilizce_notu, cinsiyet AS cinsiyet_kulup, bolum from ogrenci_bilgiler WHERE ingilizce_notu=15
UNION ALL
select ingilizce_notu, kulup_calismasi AS cinsiyet_kulup, bolum from ogrenci_bilgiler WHERE ingilizce_notu=46
GROUP BY ingilizce_notu, cinsiyet_kulup,bolum

ingilizce_notu ,not_ortalamasi ,kulup_calismasi ,
	cinsiyet ,bolum
	