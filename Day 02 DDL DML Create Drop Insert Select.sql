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
  CREATE TABLE ogrenciler (
  ogrenci_id INT,
  ogrenci_adi VARCHAR(50),
  ogrenci_soyadi VARCHAR(50),
  ogrenci_no INT,
  ogrenci_bolumu VARCHAR(50),
  ogrenci_dogum_tarihi DATE,
  ogrenci_ortalama REAL
);
  select * from ogrenciler;
  
  INSERT INTO ogrenciler VALUES  (001,'Ayşe', 'Yılmaz', 123456789, 'Bilgisayar Mühendisliği', '2000-01-01', 3.50);
  INSERT INTO ogrenciler VALUES (002,'Mehmet', 'Kara', 987654321, 'Matematik', '2001-02-02', 2.75);
INSERT INTO ogrenciler VALUES   (003,'Fatma', 'Ak', 456789012, 'Fizik', '2002-03-03', 3.25);
  INSERT INTO ogrenciler VALUES (004,'Ahmet', 'Deniz', 321098765, 'Kimya', '2003-04-04', 2.00);

-- ogrenciler tablosundaki tum verileri listele
  select * from ogrenciler;
  
  -- ogrenciler tablosundaki ogrenci_id sütunundaki verileri listele
  select ogrenci_id from ogrenciler;
  
    -- ogrenciler tablosundaki ogrenci_adi sütunundaki verileri listele
  select ogrenci_adi from ogrenciler;
  
      -- ogrenciler tablosundaki ogrenci_bolumu ve ogrenci_dogum_tarihi sütunlarındaki verileri listele
  select ogrenci_bolumu, ogrenci_dogum_tarihi from ogrenciler;
  
        -- ogrenciler tablosundaki ogrenci_adi ve ogrenci_ortalama sütunlarındaki verileri listele
  select ogrenci_adi, ogrenci_ortalama from ogrenciler;


--------------------------------
------------------------------------
--------------------------------------
  
  CREATE TABLE biskuvi_urunleri (
  biskuvi_id INT,
  biskuvi_adi VARCHAR(50),
  biskuvi_turu VARCHAR(20),
  biskuvi_agirligi REAL,
	biskuvi_fiyati DECIMAL(4,2),
  biskuvi_stok_miktari INT,
  biskuvi_uretim_tarihi DATE
);

DROP TABLE biskuvi_urunleri;

select * from biskuvi_urunleri;


INSERT INTO biskuvi_urunleri(biskuvi_id,	biskuvi_adi,	biskuvi_turu,	biskuvi_agirligi ,
	biskuvi_fiyati,	biskuvi_stok_miktarı,	biskuvi_uretim_tarihi )
	VALUES
(1, 'Sütlü Bisküvi','Sütlü',100,12.50,100,'2024-01-01'),
(2, 'Kremalı Bisküvi','Kremalı',120,13.90,50,'2024-01-01'),
(3, 'Kakaolu Bisküvi','Kakaolu',150,17.50,25,'2024-01-01'),
(4, 'Sütlü Bisküvi','Sütlü',250,20.50,25,'2024-01-01'),
(5, 'Sütlü Bisküvi','Sütlü',175,18.98,75,'2024-01-01');
  
  select * from biskuvi_urunleri;
  


/*
WHERE şart belirterek yazılan kodlarda kullanılır.
Şartı WHERE ile belirtiriz.
Burada ekranı ikiye bölmeyi göster
*/

-- fiyatı 13 liradan fazla olan ürünleri listeleyin
select * from biskuvi_urunleri WHERE biskuvi_fiyati>13;

-- sütlü ürünleri listeleyin
select * from biskuvi_urunleri WHERE biskuvi_turu='Sütlü';

-- biskuvi_id si 2'den büyük olan ve biskuvi_stok_miktari 50'den fazla olan ürünleri listeleyin
select * from biskuvi_urunleri WHERE biskuvi_id>2 AND biskuvi_stok_miktari>50;

--biskuvi_agirligi 100 veya 175 olan ürünleri listele
select * from biskuvi_urunleri WHERE biskuvi_agirligi=100 OR biskuvi_agirligi=175;

--biskuvi_agirligi 120 veya 250 olan ürünleri listele
select * from biskuvi_urunleri WHERE biskuvi_agirligi IN(120,250);

/*
IN birden fazla ifade ile yazılabilecek bilgileri listelemede kullanılır
*/

--biskuvi_stok_miktari 25 olmayan tüm ürünleri listele
select * from biskuvi_urunleri WHERE biskuvi_stok_miktari NOT IN(25);

/*
NOT IN belirtilen veri dışında kalan verileri listelemeye yarar
*/

--biskuvi_id si 2 ile 4 arasında olan tüm ürünleri listele
select * from biskuvi_urunleri WHERE biskuvi_id>=2 AND  biskuvi_id<=4;

/*
BETWEEN verilen 2 aralık arasındaki verileri listelemey yarar
*/
select * from biskuvi_urunleri WHERE biskuvi_id BETWEEN 2 AND 4;

--biskuvi_stok_miktari 40 ile 80 arasında olmayan ürünlerin biskuvi_adi ve biskuvi_uretim_tarihi ni listeleyin
select biskuvi_adi, biskuvi_uretim_tarihi from biskuvi_urunleri WHERE biskuvi_stok_miktari NOT BETWEEN 40 AND 80;


