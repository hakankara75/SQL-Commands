/*
AGGREGATE METHODU

AGGREGATE METHODLARI: Database'de bir çok değer içinden tek bir değer elde etmek istediğimizde kullanılır.
Özet halde rapor almaya benzetilebilir. Bir bilgi yığını için özet bir rapor isteyip almak gibi.

Sum() ==> Verilerin toplamını alır.
count() ==> Verilerin sayısını alır.

min() ==> Verilerden en küçük değeri alır.
max() ==> Verilerden en büyük değeri alır.

avg() ==> Verilerin ortalamasını alır.

*/
CREATE TABLE parfumler(
urun_id INT PRIMARY KEY,
urun_adi VARCHAR (50) NOT NULL,
fiyat DECIMAL (10,2) NOT NULL,
stok_adedi INT  NOT NULL
);

select *from parfumler

INSERT INTO parfumler(urun_id,urun_adi, fiyat, stok_adedi)
VALUES
(1, 'Chanel', 420.00, 10),
(2, 'Dior Sauvage', 150.00, 5),
(3, 'Gucci Guilty', 90.40, 20),
(4, 'Armani Si', 570.60, 15),
(5, 'Versace Eros', 290.00, 8);
select *from parfumler

--Tablodaki parfumlerin toplam stok adedini listele
select sum(stok_adedi) from parfumler

--Tabloda kaç adet ürün adı olduğunu listele
select count(urun_adi) from parfumler

--Tablodaki en düşük fiyatı listele
select min(fiyat) from parfumler

--Tablodaki en yüksek fiyatı listele
select max(fiyat) from parfumler

--Tablodaki en ucuz ürün fiyatini en_dusuk_urun_fiyati olarak listele
select min(fiyat) as en_dusuk_urun_fiyati from parfumler

--Tablodaki en pahalı ürünün fiyatını en_yuksek_urun_fiyati olarak listele
select max(fiyat) as en_yuksek_urun_fiyati from parfumler

--Tablodaki ürünlerin ortalama fiyatını listele
select avg(fiyat) from parfumler
select round(avg(fiyat),2) from parfumler
select round(avg(fiyat)) from parfumler
select *from parfumler

/*
-------------------------------
*/
CREATE TABLE yogurtlar(
yogurt_id INT UNIQUE,
	marka VARCHAR (50) PRIMARY KEY,
	agirlik REAL NOT NULL,
	yasama_suresi INT  NOT NULL,
	fiyat DECIMAL(7,2)  NOT NULL
)
select *from yogurtlar

INSERT INTO yogurtlar VALUES(1, 'İçim', 250, 2, 56.00);
INSERT INTO yogurtlar VALUES(2, 'Pınar', 300, 3, 96.00);
INSERT INTO yogurtlar VALUES(3, 'Deva', 200, 2, 46.70);
INSERT INTO yogurtlar VALUES(4, 'Eker', 400, 4, 99.00);
INSERT INTO yogurtlar VALUES(5, 'İtimat', 150, 1, 36.11);
INSERT INTO yogurtlar VALUES(6, 'Sütaş', 2500, 2, 146.00);
INSERT INTO yogurtlar VALUES(7, 'Yörem', 3500, 25, 246.10);
INSERT INTO yogurtlar VALUES(8, 'Çayırova', 1000, 2, 116.05);
INSERT INTO yogurtlar VALUES(9, 'Kebir', 400, 1, 89.00);
INSERT INTO yogurtlar VALUES(10, 'Kırköy', 1500, 3, 126.00);

select *from yogurtlar 

--Tablodaki ürünlerin toplam ağırlığını listele
select sum(agirlik) from yogurtlar


--Tablodaki en düşük ağırlığı listele
select min(agirlik) from yogurtlar

--Tablodaki ürünlerin ortalama ağırlığını listele
select avg(agirlik) from yogurtlar
select round(avg(agirlik)) from yogurtlar

--Tabloda kaç adet marka bulunduğunu listele
select count(marka) from yogurtlar
select count(yogurt_id) from yogurtlar

--Tablodaki en düşük fiyatı listele
select min(fiyat) from yogurtlar

--Tablodaki en düşük fiyatı en_dusuk_urun_fiyatı olarak listele
select min(fiyat) as en_dusuk_urun_fiyatı from yogurtlar

--Tablodaki en yüksek fiyatı listele
select max(fiyat) from yogurtlar

--Tablodaki en yüksek fiyatı en_yuksek_urun_fiyatı olarak listele
select max(fiyat) as en_yuksek_urun_fiyatı from yogurtlar

--Tablodaki ürünlerin ortalama fiyatını listele
select avg(fiyat) from yogurtlar
select round(avg(fiyat)) from yogurtlar
select round(avg(fiyat),2) from yogurtlar

--Tablodaki ürünlerin ortalama yaşam süresini listele
select round(avg(yasama_suresi)) from yogurtlar

--Tablodaki en yüksek yaşam süresini listele
select max(yasama_suresi) from yogurtlar

select *from yogurtlar 


