/*
LIKE, SQL dilinde METİN alanlarında arama yapmak için kullanılan bir operatördür. 
Joker karakterler (% ve _ ve [ ]) kullanarak arama kriterlerini belirlemenize olanak sağlar.

% ile sıfır veya daha fazla karakter temsil edilir
- ile yalnızca BİR karakter temsil edilir
[ ] ile verilen aralıktaki karakterler temsil edilir


Syntax:
SELECT column_name
FROM table_name
WHERE column_name LIKE pattern;

REGEXP_LIKE işlevi, SQL'de metin verilerinde düzenli ifadeler kullanarak karmaşık arama 
ve filtreleme işlemleri gerçekleştirmenizi sağlar.

EXTRACT fonksiyonu, bir tarih veya saat değerinden belirli bir zaman öğesini
(yıl, ay, gün, saat, dakika, saniye vb.) ayıklamak için kullanılır. 
Bu fonksiyon, tarih ve saat değerlerini analiz etmeyi ve işlemleri kolaylaştırmayı sağlar.
*/


CREATE TABLE benzin_istasyonu_verileri (
    yakit_turu VARCHAR(20) NOT NULL,
    plaka VARCHAR(10) NOT NULL,
    litre INT NOT NULL,
    tarih DATE NOT NULL,
    odeme_sekli VARCHAR(20) NOT NULL
);



INSERT INTO benzin_istasyonu_verileri VALUES
    ('Ultra Dizel', '34 ABC 123', 45, '2024-05-22', 'Nakit'),
	('Kurşunsuz Benzin', '34 ABC 123', 38, '2024-04-22', 'Kredi Kartı'),
    ('Extra Dizel', '16 XYZ 456', 52, '2024-03-21', 'Nakit'),
    ('Katkılı LPG', '06 DEF 789', 27, '2024-12-20', 'Kredi Kartı Taksitli'),
    ('Katkılı Benzin', '48 GHJ 012', 41, '2024-09-19', 'Çek Karşılığı'),
    ('Dizel', '75 KMN 345', 64, '2024-04-18', 'Senet Karşılığı'),
    ('LPG Plus', '23 LMN 678', 33, '2024-11-17', 'Veresiye'),
    ('Süper Benzin', '57 NOP 901', 58, '2024-01-16', 'Kredi Kartı'),
    ('Ultra Dizel', '81 OQR 234', 49, '2024-03-15', 'Nakit'),
    ('LPG Katkısız', '14 PRS 567', 25, '2024-08-14', 'Kredi Kartı Taksitli'),
    ('İndirimli Benzin', '42 QRT 890', 46, '2024-12-13', 'Çek Karşılığı'),
    ('Süper Benzin', '16 XYZ 456', 30, '2024-04-21', 'Kredi Kartı'),
    ('LPG Katkısız', '06 DEF 789', 20, '2024-05-20', 'Kredi Kartı Taksitli'),
    ('Bizim Dizel', '48 GHJ 012', 55, '2024-06-19', 'Çek Karşılığı'),
    ('Katkılı Benzin', '75 KMN 345', 40, '2024-05-18', 'Senet Karşılığı'),
    ('LPG Plus', '23 LMN 678', 25, '2024-06-17', 'Veresiye'),
    ('Bizim Dizel', '57 NOP 901', 50, '2024-03-16', 'Nakit'),
    ('Kurşunsuz Benzin', '81 OQR 234', 35, '2024-11-15', 'Kredi Kartı'),
    ('Katkılı LPG', '14 PRS 567', 20, '2024-08-14', 'Kredi Kartı Taksitli'),
    ('Extra Dizel', '42 QRT 890', 60, '2024-05-13', 'Çek Karşılığı');
	
	select * from benzin_istasyonu_verileri


--2024 Mayıs ayında hangi araçlar benzin almıştır?
SELECT plaka, yakit_turu
FROM benzin_istasyonu_verileri
WHERE yakit_turu LIKE '%Benzin%'
AND tarih BETWEEN '2024-05-01' AND '2024-05-31';

--2024 Mayıs ayında yapılan işlemlerde plakası 34 ile başlayan kaç araç vardır?
SELECT COUNT(*)
FROM benzin_istasyonu_verileri
WHERE tarih BETWEEN '2024-05-01' AND '2024-05-31'
AND plaka LIKE '34%';

--En son yakıt alan 75 palaklı araç hangisidir?
SELECT *
FROM benzin_istasyonu_verileri
WHERE plaka LIKE '75%'
ORDER BY tarih DESC
LIMIT 1;

--Ödeme şekli 'Kredi Kartı' olan işlemlerin detaylarını listeleyin.
SELECT * 
FROM benzin_istasyonu_verileri 
WHERE odeme_sekli LIKE '%Kredi Kartı%';

--8. ayda yakıt alan araçları ve yakıtlarını listele
SELECT * 
FROM benzin_istasyonu_verileri 
WHERE EXTRACT(MONTH FROM tarih) = 8;

--En Fazla Dizel Yakıt Alan Aracın Ödeme Şeklini ve plakasını listele
SELECT odeme_sekli, plaka
FROM benzin_istasyonu_verileri
WHERE yakit_turu LIKE '%Dizel%'
GROUP BY odeme_sekli, plaka
ORDER BY SUM(litre) DESC
LIMIT 1;

--plakasının 2. rakamı 4 olan araçları listele
SELECT plaka
FROM benzin_istasyonu_verileri
WHERE plaka LIKE'_4%'

--ödeme şeklinin 3. harfi k olan plakaları listele
SELECT plaka,odeme_sekli
FROM benzin_istasyonu_verileri
WHERE odeme_sekli LIKE '__k%';

--aldığı benzin litresi 3 ile başlayan plakaları listele
SELECT plaka,litre
FROM benzin_istasyonu_verileri
WHERE litre LIKE '3%';
--hata verir. metin değeri dışındaki sayısal değerlerde çalışmaz

--plakasında A ile H arasında olan araçları büyük küçük harf gözetmeksizin listele
SELECT plaka
FROM benzin_istasyonu_verileri
WHERE plaka ~*'[a-h]';
--burada * regex ile küçük büyük harf gözetmeden arama yaptık

--plakasında A ile H arasında olan araçları listele
SELECT plaka
FROM benzin_istasyonu_verileri
WHERE REGEXP_LIKE(plaka, '[A-H]');

--Aldığı yakıt son harfi A ile L arasındaki harfler olan araçları ve yakıtları listele
SELECT plaka, yakit_turu
FROM benzin_istasyonu_verileri
WHERE yakit_turu ~*'[A-L]$';
