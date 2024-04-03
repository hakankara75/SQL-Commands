
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
   1- PRIMARY KEY olan tablo parent olur.
   2- FOREIGN KEY olan tablo child olur.
   3- parent tabloda olmayan PRIMARY KEY ile child tabloya veri giremeyiz. 
   örnek: PRIMARY KEY tablosunda Ahmet, Ayşe,Veli varsa bunları child tabloya girebiliriz. Bunlar 
   dışındakiler girilemez. Hakan, child tabloya girilemez çünkü PRIMARY KEY tablosunda yok.
   4- veri silmede sıra önce child tablodan başlar. ardından parent tablodaki veri silinebilir.
   Yani child tablo Hakan ismini parent tablodan foreign key ile kullanıyorsa, parent tablodan bu data
   direk silinemez. önce child tabloda Hakan silinir, sonra parent tabloda silinir.
   5- tablo silmede de yukarıdaki sıra izlenir.
   Yani önce child tablo silinir, sonra parent silinebilir.
   6- parent tabloda null değer girilemez ama child tabloya girilebilir.
*/

create table peynirim(
id int not null,
	isim varchar(50) unique,
	tur varchar(50) not null,
	koken varchar(50) primary key,
	sertlik int check(sertlik between 1 and 5),
	fiyat decimal(5,2)
)

insert into peynirim values(1,'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3,150.50);
insert into peynirim values(2,'Kaşar Peyniri', 'Yumuşak', 'Çıldır', 5,350.50);
insert into peynirim values(3,'Çeçil Peyniri', 'Sert','Göle', 4, 175.50);
insert into peynirim values(4,'Tuluk Peyniri', 'Yarı Sert','Kars', 3, 479.50);

select * from peynirim;

-- Peynir Mayası Tablosu Oluşturma

CREATE TABLE peynir_mayalari (
  id INT PRIMARY KEY,
  isim VARCHAR(30) UNIQUE NOT NULL,
  turu VARCHAR(20) NOT NULL,
  marka VARCHAR(30) NOT NULL,
  uretim_yeri VARCHAR(30),
  fiyat DECIMAL(5,2) NOT NULL,
  peynir_tipi VARCHAR(30) NOT NULL,
	CONSTRAINT yore FOREIGN KEY (uretim_yeri) REFERENCES peynirim(koken)
);
select * from peynir_mayalari;
-- Peynir Mayası Verisi Ekleme

INSERT INTO peynir_mayalari (id,isim, turu, marka, uretim_yeri, fiyat, peynir_tipi ) VALUES
  (1,'Yöresel Beyaz Peynir Mayası', 'Sıcak', 'Yerli Marka', 'Ardahan', 12.50, 'Beyaz Peynir'),
  (2,'Kaşar Peyniri Mayası', 'Sıcak', 'Lezzetli Marka', 'Göle', 18.00, 'Kaşar Peyniri'),
  (3,'Cheddar Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', 'Kars', 25.00, 'Cheddar Peyniri');

select * from peynir_mayalari;

-- peynir_mayalari Tablosuna Mozzarella Peyniri Mayası Ekle
INSERT INTO peynir_mayalari VALUES (4,'Mozzarella Peyniri Mayası', 'Sıcak', 'Yerli Marka', 'Artvin', 15.00, 'Mozzarella Peyniri');

--dogru kod
INSERT INTO peynir_mayalari VALUES (4,'Mozzarella Peyniri Mayası', 'Sıcak', 'Yerli Marka', 'Ardahan', 15.00, 'Mozzarella Peyniri');

-- peynir_mayalari Tablosuna Gouda Peyniri Mayası Ekle
INSERT INTO peynir_mayalari VALUES  (5,'Gouda Peyniri Mayası', 'Sıcak', 'Lezzetli Marka', 'Hanak', 20.00, 'Gouda Peyniri');

--dogru kod
INSERT INTO peynir_mayalari VALUES  (5,'Gouda Peyniri Mayası', 'Sıcak', 'Lezzetli Marka', 'Göle', 20.00, 'Gouda Peyniri');

-- peynir_mayalari Tablosuna Parmesan Peyniri Mayası Ekle
INSERT INTO peynir_mayalari VALUES  (6,'Parmesan Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', 'Kağızman', 30.00, 'Parmesan Peyniri');

--dogru kod NULL kabul eder
INSERT INTO peynir_mayalari VALUES  (6,'Parmesan Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', null, 30.00, 'Parmesan Peyniri');

-- peynirim tablosundan koken Ardahan olan veriyi sil
DELETE from peynirim WHERE koken='Ardahan';

-- peynir_mayalari tablosundan uretim_yeri Ardahan olan veriyi sil
DELETE from peynir_mayalari WHERE uretim_yeri='Ardahan';

-- peynirim tablosundan koken Ardahan olan veriyi sil
DELETE from peynirim WHERE koken='Ardahan';

-- peynirim tablosunu sil
DROP TABLE peynirim;

-- peynir_mayalari tablosunu sil
DROP TABLE peynir_mayalari;

-- peynirim tablosunu sil
DROP TABLE peynirim;


