/*
UPPER: Sütundaki verileri büyük harfle listeler.
LOWER: Sütundaki verileri küçük harfle listeler.
INITCAP: Sütundaki verilerin ilk harfini büyük, diğer harflerini ise küçük harfle listeler.
DISTINCT: Sütundaki verileri tekrarsız listeler.
*/
CREATE TABLE cep_telefonlari (
  marka VARCHAR(50) NOT NULL,
  model VARCHAR(100) NOT NULL
);

INSERT INTO cep_telefonlari (marka, model)
VALUES
  ('Samsung', 'Galaxy S22'),
  ('Apple', 'iPhone 13 Pro Max'),
  ('Huawei', 'P50 PRO'),
  ('Xiaomi', '12S Ultra'),
  ('Oppo', 'FIND X5 Pro'),
  ('OnePlus', '10 Pro'),
  ('Google', 'Pixel 6 Pro'),
  ('Motorola', 'Edge 30 Ultra'),
  ('Realme', 'GT Neo 3'),
  ('Vivo', 'X80 Pro'),
  ('Samsung', 'GALAXY S22 Ultra'),
  ('Apple', 'iPhone 14 Pro'),
  ('Huawei', 'P60 PRO'),
  ('Xiaomi', '13 Pro'),
  ('Oppo', 'Find X6 Pro'),
  ('OnePlus', '11 Pro'),
  ('Google', 'Pixel 7 Pro'),
  ('Motorola', 'EDGE 40 Ultra'),
  ('Realme', 'GT Neo 4');
  
  select * from cep_telefonlari;

--cep telefonu markalarını büyük harfle listele
select UPPER(marka) from cep_telefonlari;

--cep telefonu modellerini küçük harfle listele
select LOWER(model) from cep_telefonlari;

--cep telefonu modellerini büyük harf, markalarını küçük harf ile listele
select LOWER(marka) as MARKA, UPPER (model ) as MODEL from cep_telefonlari;

--cep telefonu modellerinin ilk harfleri büyük sonrası küçük, markalarını küçük harf ile listele
select LOWER(marka) as MARKA, INITCAP(model ) as MODEL from cep_telefonlari;

--cep telefonu marka ve modellerini ilk harfleri büyük sonrası küçük olarak listele
select INITCAP(marka) as marka, INITCAP(model) as model from cep_telefonlari;

--cep telefonu marka ve modellerini ilk harfleri büyük sonrası küçük olarak tek sütunda listele
select INITCAP(marka)  || ' - '  || INITCAP(model) as telefonlar from cep_telefonlari;

--farklı tüm cep telefon markalarını listele
select DISTINCT marka from cep_telefonlari;

--farklı tüm cep telefonu modellerini büyük harf ile listele
select DISTINCT UPPER(model) from cep_telefonlari;
  