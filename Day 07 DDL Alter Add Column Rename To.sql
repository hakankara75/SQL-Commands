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

CREATE TABLE tişörtler (
  id INT,
  marka VARCHAR(255),
  model VARCHAR(255),
  beden VARCHAR(25),
  fiyat DECIMAL(10,2)
);

INSERT INTO tişörtler VALUES (1, 'Nike', 'Dri-Fit', 'M', 150.25 );
INSERT INTO tişörtler VALUES (2, 'Adidas', 'Climacool',  'L', 180.50 );
INSERT INTO tişörtler VALUES (3, 'Puma', 'Active', 'XL', 200.75 );
INSERT INTO tişörtler VALUES (4, 'Under Armour', 'HeatGear',  'S', 120.10 );
INSERT INTO tişörtler VALUES(5, 'Champion', 'Reverse Weave',  'M', 130.35 );
INSERT INTO tişörtler VALUES(6, 'Hanes', 'Beefy-T',  'L', 100.60 );

select * from tişörtler;
--tişörtler tablosuna renk varchar(50) şeklinde yeni sütun ekle
ALTER table tişörtler ADD COLUMN renk varchar(50);

select * from tişörtler;

--tişörtler tablosuna id sütun ismini sıra_no olarak değiştir
ALTER table tişörtler RENAME COLUMN id TO sıra_no;

select * from tişörtler;

--tişörtler tablosuna kargo_boyutu INT şeklinde yeni sütun ekle
ALTER table tişörtler ADD COLUMN renk varchar(50);

select * from tişörtler;

--tişörtler tablosuna malzeme VARCHAR(50) şeklinde yeni sütun ekle, default degeri 'Pamuk' olsun
ALTER table tişörtler ADD COLUMN malzeme VARCHAR(50) DEFAULT 'Pamuk';

select * from tişörtler;

--tişörtler tablosunda marka sütununun ismini firma olarak değiştir
ALTER table tişörtler RENAME COLUMN marka TO firma;

select * from tişörtler;

--tişörtler tablosunun adını tshort olarak değiştir
ALTER table tişörtler RENAME TO tshort;

select * from tişörtler;
select * from tshort;