
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

select * from peynirler;

-- Peynir Mayası Tablosu Oluşturma

CREATE TABLE peynir_mayalari (
  id INT PRIMARY KEY AUTO_INCREMENT,
  isim VARCHAR(30) UNIQUE NOT NULL,
  turu VARCHAR(20) NOT NULL,
  marka VARCHAR(30) NOT NULL,
  üretim_yeri VARCHAR(30) NOT NULL,
  fiyat DECIMAL(5,2) NOT NULL,
  peynir_tipi VARCHAR(30) NOT NULL,
  miktar DECIMAL(5,2) NOT NULL
);

-- Peynir Mayası Verisi Ekleme

INSERT INTO peynir_mayalari (isim, turu, marka, uretim_yeri, fiyat, peynir_tipi, miktar) VALUES
  ('Yöresel Beyaz Peynir Mayası', 'Sıcak', 'Yerli Marka', 'Ankara', 12.50, 'Beyaz Peynir', 100),
  ('Kaşar Peyniri Mayası', 'Sıcak', 'Lezzetli Marka', 'İzmir', 18.00, 'Kaşar Peyniri', 50),
  ('Cheddar Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', 'İstanbul', 25.00, 'Cheddar Peyniri', 25),
  ('Mozzarella Peyniri Mayası', 'Sıcak', 'Yerli Marka', 'Ankara', 15.00, 'Mozzarella Peyniri', 100),
  ('Gouda Peyniri Mayası', 'Sıcak', 'Lezzetli Marka', 'İzmir', 20.00, 'Gouda Peyniri', 50),
  ('Parmesan Peyniri Mayası', 'Soğuk', 'Uluslararası Marka', 'İstanbul', 30.00, 'Parmesan Peyniri', 25);


-- Peynirler Tablosuna Foreign Key Ekleme

ALTER TABLE peynirler
ADD COLUMN peynir_mayasi_id INT NOT NULL,
ADD CONSTRAINT FK_peynirler_peynir_mayalari
FOREIGN KEY (peynir_mayasi_id)
REFERENCES peynir_mayalari(id);
