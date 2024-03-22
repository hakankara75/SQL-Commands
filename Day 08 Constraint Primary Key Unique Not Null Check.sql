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

CREATE TABLE peynirler (
  id INT PRIMARY KEY,	--uniqe ve not null
  isim VARCHAR(30) UNIQUE,
  tur VARCHAR(25) NOT NULL,
  koken VARCHAR(20),
  sertlik INT CHECK (sertlik BETWEEN 1 AND 5),
  fiyat DECIMAL(5,2)
);

INSERT INTO peynirler (id, isim, tur, koken, sertlik, fiyat) VALUES
  (1, 'Beyaz Peynir', 'Yumuşak', 'Ardahan', 3, 15.50),
  (2, 'Kaşar Peyniri', 'Yarı Sert', 'Göle', 4, 22.00),
  (3, 'Cheddar Peyniri', 'Sert', 'Kars', 5, 28.50),
  (4, 'Mozzarella Peyniri', 'Yumuşak', 'Ardahan', 2, 18.00),
  (5, 'Gouda Peyniri', 'Yarı Sert', 'Göle', 4, 25.00),
  (6, 'Parmesan Peyniri', 'Sert', 'Kars', 5, 32.00);
  
  select * from peynirler;

--id eklemedik, oysa id primarykey yani uniqe ve not null
insert into peynirler values  ('Beyaz Peynir', 'Yumuşak', 'Ardahan', 3, 15.50); 

--isim kısmına Kaşar Peyniri ekleyemedik. daha önce vardı. uniq olmalıydı
insert into peynirler values  (7, 'Kaşar Peyniri', 'Yarı Sert', 'Göle', 3, 42.00); 

--tur bos biraktik. hata verdi. tur nut null olmaliydi
insert into peynirler values  (8, 'Çeçil Peyniri', 'Ardahan', 5, 28.50);

--sertlik 1 ile 5 arasi olmali 9 giremeyiz, check var burada
insert into peynirler values  (9, 'Tuluk Peyniri', 'Yumuşak', 'Ardahan', 9, 18.00);







