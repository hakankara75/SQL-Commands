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

CREATE TABLE ogrenciler(
ogrenci_id INT,
	ogrenci_adi VARCHAR(50),
		ogrenci_soyadi VARCHAR(50),
		ogrenci_not INT,
	ogrenci_bolumu VARCHAR(50),
	ogrenci_dogum_tarihi DATE,
	ogrenci_ortalam DECIMAL(4,2)
);

select * from ogrenciler;

INSERT INTO ogrenciler VALUES(001,'Ayşe','Kara',75,'Bilgisayar','2000-01-02', 98.45);
INSERT INTO ogrenciler VALUES(002,'Hakan','Kara',45,'Eğitim','2000-01-02', 48.15);
INSERT INTO ogrenciler VALUES(003,'Merve','Kara',85,'Hukuk','2000-01-02', 93.00);
INSERT INTO ogrenciler VALUES(004,'Orhan','Kara',35,'Gıda','2000-01-02', 88.45);

select * from ogrenciler;

--ogrenciler tablosundan ogrenci_id sütununu listele
select ogrenci_id from ogrenciler;

--ogrenciler tablosundan ogrenci_adi sütununu listele
select ogrenci_adi from ogrenciler;

--ogrenciler tablosundan ogrenci_bolumu ve  ogrenci_dogum_tarihi sütunlarını listele
select ogrenci_bolumu,ogrenci_dogum_tarihi from ogrenciler;

--ogrenciler tablosundan ogrenci_soyadi, ogrenci_not ve  ogrenci_ortalam sütunlarını listele
select ogrenci_soyadi, ogrenci_not,ogrenci_ortalam from ogrenciler;

