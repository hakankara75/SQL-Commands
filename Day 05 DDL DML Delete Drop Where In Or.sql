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

CREATE TABLE çiçekler (
  id INT,
  isim VARCHAR(255),
  renk VARCHAR(255),
  tür VARCHAR(255),
  boyut INT,
  mevsim VARCHAR(255),
  anlam VARCHAR(255)
);

select * from çiçekler;

insert into çiçekler values (1, 'Gül', 'Kırmızı', 'Çiçek', 10, 'Yaz', 'Aşk');
insert into çiçekler values (2, 'Lale', 'Sarı', 'Çiçek', 20, 'Bahar', 'Dostluk');
insert into çiçekler values (3, 'Papatya', 'Beyaz', 'Çiçek', 5, 'Yaz', 'Masumiyet');
insert into çiçekler values (4, 'Karanfil', 'Pembe', 'Çiçek', 15, 'İlkbahar', 'Anne sevgisi');
insert into çiçekler values (5, 'Orkide', 'Mor', 'Çiçek', 30, 'Tropikal', 'Zarafet');
insert into çiçekler values (6, 'Ayçiçeği', 'Sarı', 'Çiçek', 40, 'Sonbahar', 'Mutluluk');

select * from çiçekler;

--boyutu 10 olan satırı siliniz
DELETE from çiçekler WHERE boyut=10;
select * from çiçekler;

--mevsimi bahar olan satırı siliniz
DELETE from çiçekler WHERE mevsim='Bahar';
select * from çiçekler;
select * from çiçekler WHERE mevsim='Bahar';

--ismi Karanfil veya Orkide olan satırı siliniz 
--1. yol
DELETE from çiçekler WHERE isim='Karanfil' OR isim='Orkide';
select * from çiçekler;
select * from çiçekler WHERE isim='Karanfil' OR isim='Orkide';

insert into çiçekler values (4, 'Karanfil', 'Pembe', 'Çiçek', 15, 'İlkbahar', 'Anne sevgisi');
insert into çiçekler values (5, 'Orkide', 'Mor', 'Çiçek', 30, 'Tropikal', 'Zarafet');

--2. yol
DELETE from çiçekler WHERE isim IN('Karanfil','Orkide');
select * from çiçekler WHERE isim='Karanfil' OR isim='Orkide';

--boyutu 40'dan küçük olan satırları sil
DELETE from çiçekler WHERE boyut <40; 
select * from çiçekler WHERE boyut <40;

--tüm verileri siliniz
DELETE from çiçekler;
select * from çiçekler;

--çiçekler tablosunu siliniz
DROP table çiçekler;