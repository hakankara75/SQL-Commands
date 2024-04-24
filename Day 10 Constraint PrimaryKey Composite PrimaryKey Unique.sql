CREATE TABLE angaralilar (
  isim VARCHAR(50),
  soyisim VARCHAR(50),
  CONSTRAINT pk_isim PRIMARY KEY (isim),
	CONSTRAINT uq_soyisim UNIQUE (soyisim)
);

INSERT INTO angaralilar (isim, soyisim)
VALUES ('Hakan', 'Tanrıverdi');
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Azra', 'Can');

select * from angaralilar

-- Hakan Yılmaz'ı angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Hakan', 'Yılmaz');
--ERROR verir. çünkü isim PRIMARY KEY kısıtlamalı

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Elif', 'Yılmaz');

select * from angaralilar

-- Mert Tanrıverdi'yi angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Mert', 'Tanrıverdi');
--ERROR verir. çünkü soyisim UNIQUE kısıtlamalı

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Mert', 'Özkan');
select * from angaralilar

-- Korkmaz soyadlı kişiyi angaralilar tablosuna ekle
INSERT INTO angaralilar (isim, soyisim)
VALUES (null, 'Korkmaz');
--ERROR verir. çünkü isim PRIMARY KEY kısıtlamalı

--doğru kod
INSERT INTO angaralilar (isim, soyisim)
VALUES ('Ayşe', 'Korkmaz');
select * from angaralilar

CREATE TABLE arabalar (
  marka VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  CONSTRAINT pk_arabalar PRIMARY KEY (marka, model) --composite primary key
);
--constraint bu şekilde yazmamın avantajları:
--1) constraint ismini pk_arabalar şeklinde kendim belirleyebildim.
--2) composite primary key yapabildim

INSERT INTO arabalar (marka, model)
VALUES ('Tofaş', 'Şahin');
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş', 'Serçe');
INSERT INTO arabalar (marka, model)
VALUES ('Tofaş', 'Doğan');
select * from arabalar

--Tofaş marka Doğan model arabayı arabalar tablosuna gir
INSERT INTO arabalar VALUES ('Tofaş', 'Doğan');
--ERROR verir. çünkü pk_arabalar PRIMARY KEY kısıtlamalı. marka ve model yan yana tabloda olan bir değer olamaz.

--doğru kod
INSERT INTO arabalar VALUES ('Tofaş', 'Doğan S');

select * from arabalar

--Doğan SLX model arabayı arabalar tablosuna gir
INSERT INTO arabalar VALUES (null, 'Doğan SLX');
--ERROR verir. çünkü marka  NOT NULL kısıtlamalı

--doğru kod
INSERT INTO arabalar VALUES ('Tofaş', 'Doğan SLX');

--Tofaş marka arabayı arabalar tablosuna gir
INSERT INTO arabalar VALUES ('Tofaş',null);
--ERROR verir. çünkü model  NOT NULL kısıtlamalı

--doğru kod
INSERT INTO arabalar VALUES ('Tofaş', 'Murat 124');

--Renault marka Murat 124 model arabayı arabalar tablosuna gir
INSERT INTO arabalar VALUES ('Renault', 'Murat 124');
select * from arabalar
