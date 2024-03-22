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

CREATE TABLE personel (
  personel_id INT,
  ad VARCHAR(255) ,
  soyad VARCHAR(255) ,
  tc_kimlik_no CHAR(11),
  dogum_tarihi DATE ,
  cinsiyet CHAR(1) ,
  eposta VARCHAR(255) ,
  telefon_no VARCHAR(15),
  adres TEXT,
  ise_giris_tarihi DATE,
  pozisyon VARCHAR(255) ,
  maas DECIMAL(10,2),
  departman_id INT,
  yonetici_id INT
);

drop table personel;
--bunu yaptıktan sonra schemas uzerinde refresh yapinca tablo kaybolur

CREATE TABLE personel (
  personel_id INT,
  ad VARCHAR(255) ,
  soyad VARCHAR(255) ,
  tc_kimlik_no CHAR(11),
  dogum_tarihi DATE ,
  cinsiyet CHAR(1) ,
  eposta VARCHAR(255) ,
  telefon_no VARCHAR(15),
  adres TEXT,
  ise_giris_tarihi DATE,
  pozisyon VARCHAR(255) ,
  maas DECIMAL(10,2),
  departman_id INT,
  yonetici_id INT
);

--talebeler tablosundaki verileri listeleyelim
select * from personel;		--* butun sutunlar demektir.



INSERT INTO personel VALUES (1, 'Ahmet', 'Yılmaz', '12345678901', '1980-01-01', 'E', 'ahmet.yilmaz@example.com', '5551234567', 'Ankara', '2023-01-01', 'Yazılım Mühendisi', 10000, 1, NULL);
INSERT INTO personel VALUES  (2, 'Ayşe', 'Erdem', '23456789012', '1985-02-02', 'K', 'ayse.erdem@example.com', '5552345678', 'İstanbul', '2022-02-02', 'Pazarlama Uzmanı', 8000, 2, 1);



--talebeler tablosundaki verileri listeleyelim
select * from personel;		--* butun sutunlar demektir.

CREATE TABLE araba (
  araba_id INT,  -- Otomatik artan bir ID olmayacak
  marka VARCHAR(255),
  model VARCHAR(255),
  yil INT,
  renk VARCHAR(255),
  motor_hacmi DECIMAL(5,2),
  vites_tipi VARCHAR(255),
  yakit_tipi VARCHAR(255),
  fiyat DECIMAL(10,2),
  kilometre INT,
  durum VARCHAR(255),
  sahibinin_adi VARCHAR(255),
  sahibinin_telefonu VARCHAR(255)
);

select * from araba;		--* butun sutunlar demektir.

drop table araba;
--bunu yaptıktan sonra schemas uzerinde refresh yapinca tablo kaybolur

select * from araba;

CREATE TABLE araba (
  araba_id INT,  -- Otomatik artan bir ID olmayacak
  marka VARCHAR(255),
  model VARCHAR(255),
  yil INT,
  renk VARCHAR(255),
  motor_hacmi DECIMAL(5,2),
  vites_tipi VARCHAR(255),
  yakit_tipi VARCHAR(255),
  fiyat DECIMAL(10,2),
  kilometre INT,
  durum VARCHAR(255),
  sahibinin_adi VARCHAR(255),
  sahibinin_telefonu VARCHAR(255)
);

select * from araba;


INSERT INTO araba VALUES (1,'Toyota', 'Corolla', 2023, 'Beyaz', 1.6, 'Otomatik', 'Benzin', 200000, 10000, 'Yeni', 'Ahmet Yılmaz', '5551234567');
INSERT INTO araba VALUES  (2,'Renault', 'Clio', 2022, 'Siyah', 1.5, 'Manuel', 'Dizel', 150000, 50000, 'İkinci El', 'Ayşe Erdem', '5552345678');


select * from araba;
