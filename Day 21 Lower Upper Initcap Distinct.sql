/*
UPPER: Sütundaki verileri büyük harfle listeler.
LOWER: Sütundaki verileri küçük harfle listeler.
INITCAP: Sütundaki verilerin ilk harfini büyük, diğer harflerini ise küçük harfle listeler.
DISTINCT: Sütundaki verileri tekrarlarsız listeler.
*/

CREATE TABLE cep_telefonlari (
  marka VARCHAR(50) NOT NULL,
  model VARCHAR(100) NOT NULL
);

INSERT INTO cep_telefonlari (marka, model)
VALUES
  ('Samsung', 'Galaxy S22'),
  ('Apple', 'iPhone 13 Pro Max'),
  ('Huawei', 'P50 Pro'),
  ('Xiaomi', '12S Ultra'),
  ('Oppo', 'Find X5 Pro'),
  ('OnePlus', '10 Pro'),
  ('Google', 'Pixel 6 Pro'),
  ('Motorola', 'Edge 30 Ultra'),
  ('Realme', 'GT Neo 3'),
  ('Vivo', 'X80 Pro'),
  ('Samsung', 'Galaxy S22 Ultra'),
  ('Apple', 'iPhone 14 Pro'),
  ('Huawei', 'P60 Pro'),
  ('Xiaomi', '13 Pro'),
  ('Oppo', 'Find X6 Pro'),
  ('OnePlus', '11 Pro'),
  ('Google', 'Pixel 7 Pro'),
  ('Motorola', 'Edge 40 Ultra'),
  ('Realme', 'GT Neo 4');
  
  SELECT * FROM cep_telefonlari;

--Cep telefonu markalarını büyük harfle listeleyin.
SELECT UPPER(marka) FROM cep_telefonlari;

--Cep telefonu modellerini küçük harfle listeleyin.
SELECT LOWER(model) FROM cep_telefonlari;

--Cep telefonu modellerini büyük harflerle, markalarını ilk harfleri büyük listele
SELECT UPPER(marka), INITCAP(model) FROM cep_telefonlari;

--Cep telefonu markalarını ve modellerini ilk harfleri büyük, diğer harfleri küçük olacak şekilde aynı sütunda listeleyin.
SELECT INITCAP(marka) || ' - ' || INITCAP(model)  as telefonlar FROM cep_telefonlari;

--Farklı tüm cep telefonu markalarını listeleyin.
SELECT DISTINCT marka FROM cep_telefonlari;

--Farklı tüm cep telefonu modellerini büyük harf olarak listeleyin.
SELECT DISTINCT UPPER(model) FROM cep_telefonlari;

  
