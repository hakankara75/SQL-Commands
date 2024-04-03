/* CONSTRAINT -- KISITLAMALAR 
1) UNIQUE -->  Sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Sütuna NULL değer girilmesini engeller
   (NOT NULL kısıtlaması veri türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sütunun birleşmesiyle elde edilen Primary Key'e Composite Primary Key denir.

4) CHECK --> Bir sütuna girilen verinin değer aralığını sınırlar.

5) FOREIGN KEY --> Başka bir tablodaki PRIMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
*/

create table peynirler(
id int primary key,
	isim varchar(50) unique,
	tur varchar(50) not null,
	koken varchar(50),
	sertlik int check(sertlik between 1 and 5),
	fiyat decimal(5,2)
)
select * from peynirler;

--id girmeden data giriniz
insert into peynirler(isim, tur, koken, sertlik, fiyat) values
('Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

-- dogru kod girisi
insert into peynirler(id,isim, tur, koken, sertlik, fiyat) values
(1,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

--isim kismina 'Beyaz Peynir' olan data ekleyin
insert into peynirler(id,isim, tur, koken, sertlik, fiyat) values
(2,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50)

--doğru kod
insert into peynirler(id,isim, tur, koken, sertlik, fiyat) values
(2,'Kaşar Peyniri', 'Yumuşak', 'Ardahan', 5,350.50)
select * from peynirler;

--tur kismini bos birakarak data ekleyin
insert into peynirler(id,isim, koken, sertlik, fiyat) values
(3,'Çeçil Peyniri', 'Göle', 4, 175.50)

--dogru kod
insert into peynirler(id,isim, tur,koken, sertlik, fiyat) values
(3,'Çeçil Peyniri', 'Sert','Göle', 4, 175.50)

--check kisitlamasini ihlal eden data girin
insert into peynirler(id,isim, tur,koken, sertlik, fiyat) values
(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 9, 479.50)

--dogru kod
insert into peynirler(id,isim, tur,koken, sertlik, fiyat) values
(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 3, 479.50)
select * from peynirler;

/*
--------------------------------------------
--------------------------------------------
*/
create table peynir(
id int,
	isim varchar(50) unique,
	tur varchar(50) not null,
	koken varchar(50),
	sertlik int check(sertlik between 1 and 5),
	fiyat decimal(5,2),
	constraint composite_primarykey primary key(koken,fiyat)
)
select * from peynir;

--check degerini ihlal eden data ekle
insert into peynir values(1,'Beyaz Peynir', 'Sert', 'Ardahan',8,185.20)

--dogru kod
insert into peynir values(1,'Beyaz Peynir', 'Sert', 'Ardahan',1,185.20)


--isim ayni olan data ekle
insert into peynir values(2,'Beyaz Peynir', 'Yarı Sert', 'Çıldır',3,225.10)

--dogru kod
insert into peynir values(2,'Kaşar Peyniri', 'Yarı Sert', 'Çıldır',3,225.10)

--tur not null birakip data ekle
insert into peynir values(2,'Cheddar Peyniri', 'Kars',5,125.99)

--dogru kod
insert into peynir values(2,'Cheddar Peyniri', 'Yarı Yumuşak', 'Kars',5,125.99)


--composite primary key ihlali yap. koken ve fiyat ayni deger gir
insert into peynir values(4,'Gouda Peyniri', 'Yarı Yumuşak', 'Ardahan',5,185.20)

--dogru kod
insert into peynir values(4,'Gouda Peyniri', 'Yarı Yumuşak', 'Hanak',5,185.20)

--composite primary key ihlali yap. koken ve fiyat ayni deger gir
insert into peynir values(5,'Parmesan Peyniri', 'Sert', 'Kars',5,125.99)

-- dogru kod
insert into peynir values(5,'Parmesan Peyniri', 'Sert', 'Kars',5,80.99)
select * from peynir;












