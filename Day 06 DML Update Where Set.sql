/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  DROP: Tabloyu siler.
  ALTER: Tabloyu günceller.
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  DELETE:Tablodaki verileri siler
  UPDATE:Tablodaki verileri günceller

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

CREATE TABLE ayakkabılar (
  id INT,
  marka VARCHAR(255),
  model VARCHAR(255),
  renk VARCHAR(255),
  boyut INT,
  mevsim VARCHAR(255),
  fiyat REAL
);


INSERT INTO ayakkabılar (
  id,
  marka,
  model,
  renk,
  boyut,
  mevsim,
  fiyat
)
VALUES (5, 'New Balance', '574', 'Gri', 46, 'Spor', 1100),
(6, 'Adidas', 'Superstar', 'Beyaz', 47, 'Günlük', 900),
(7, 'Converse', 'Chuck Taylor All-Stars', 'Siyah', 48, 'Günlük', 500),
(1, 'Nike', 'Air Force 1', 'Beyaz', 42, 'Yaz', 1200.50),
(2, 'Adidas', 'Stan Smith', 'Siyah', 43, 'Bahar', 800.59),
(3, 'Puma', 'Suede', 'Kırmızı', 44, 'Sonbahar', 1050.25);
select * from ayakkabılar;

--markası Adidas olan ürünün model'ini Hadidas olarak güncelle
UPDATE ayakkabılar SET model='Hadidas' WHERE marka='Adidas';
select * from ayakkabılar WHERE marka='Adidas';

--rengi siyah olan ayakkabıları pembe olarak güncelle
UPDATE ayakkabılar SET renk='Pembe' WHERE renk='Siyah';
select * from ayakkabılar WHERE renk='Siyah';
select * from ayakkabılar;

--puma markasını ÖzHakikiPuma olarak güncelle
UPDATE ayakkabılar SET marka='ÖzHakikiPuma' WHERE marka='Puma';
select * from ayakkabılar WHERE marka='Puma';
select * from ayakkabılar;

--fiyatı 1000 liradan aşağı olan ayakkabıların fiyatını 1125.25 yap
UPDATE ayakkabılar SET fiyat=1125.25 WHERE fiyat< 1000;
select * from ayakkabılar WHERE fiyat< 1000;
select * from ayakkabılar;