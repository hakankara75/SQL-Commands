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

select * from benzin_istasyonu_verileri;

--2024 mayıs ayında hangi araçlar benzin almıştır
select plaka, yakit_turu from benzin_istasyonu_verileri
where yakit_turu LIKE '%Benzin%'
AND tarih BETWEEN '2024-05-01' AND '2024-05-31';

--2024 mayıs ayında yapılan işlemlerde plakası 34 ile başlayan kaç araç var
select COUNT(*) from benzin_istasyonu_verileri
where tarih BETWEEN '2024-05-01' AND '2024-05-31'
AND plaka LIKE '34%';

--en son yakıt alan 75 plakalı araç hangisidir
select * from benzin_istasyonu_verileri
where plaka LIKE '75%'
ORDER BY tarih DESC
LIMIT 1;

--ödeme şekli kredi kartı olan işlem detayların listele
select * from benzin_istasyonu_verileri
where odeme_sekli LIKE '%Kredi Kartı%';

--8. ayda yakıt alan araçları ve yakıtlarını listele
select plaka, yakit_turu, tarih from benzin_istasyonu_verileri
where EXTRACT(MONTH from tarih)=8;

--en fazla dizel yakıt alan aracın ödeme şeklini ve plakasını listele
select plaka,odeme_sekli,yakit_turu from benzin_istasyonu_verileri
where yakit_turu LIKE '%Dizel%'
GROUP BY plaka,odeme_sekli,yakit_turu
ORDER BY SUM(litre) DESC
LIMIT 1;

--Plakasının 2. rakamı 4 olan araçları listele
select plaka from benzin_istasyonu_verileri
where plaka LIKE '_4%';

--ödeme şeklinin 3. harfi k olan plakaları listele
select plaka, odeme_sekli from benzin_istasyonu_verileri
where odeme_sekli LIKE '__k%';

--aldığı benzin litresi 3 ile başlayan plakaları listele
select plaka, litre from benzin_istasyonu_verileri
where litre LIKE '3%';
--sayısal sütunlarda LIKE çalışmaz, hata verir

--plakasında A ile H arasında olan araçları büyük küçük harf gözetmeksizin listele
select plaka from benzin_istasyonu_verileri
where plaka ~*'[a-h]';

--plakasında A ile H arasaında olan araçları listele
select plaka from benzin_istasyonu_verileri
where REGEXP_LIKE(plaka, '[A-H]');

--aldığı yakıt son harfi A ile L arasındaki harfler olan araçları ve yakıtları listele
select plaka, yakit_turu from benzin_istasyonu_verileri
where yakit_turu ~*'[A-L]$';



