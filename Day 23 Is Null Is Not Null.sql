/*
IS NULL operatörü, bir sütunun NULL değer içerip içermediğini kontrol eder.

IS NOT NULL operatörü ise, bir sütunun NULL değer içermediğini kontrol eder.
*/
CREATE TABLE bardaklar ( 
	marka VARCHAR(50) ,
	model VARCHAR(100) , 
	fiyat REAL);
	
INSERT INTO bardaklar (marka, model, fiyat)
VALUES
  ('Pasabahçe', 'Fincan', 15.99),
  ('Borcam', 'Su Bardağı', 12.50),
  (NULL, 'Atıştırmalık Kabı', 7.99),
  ('Pasabahçe', 'Kupa', 24.99),
  ('Borcam', NULL, 39.99),
  ('Namsan', 'Meyve Suyu Bardağı', 9.99),
  ('Pasabahçe', 'Şarap Kadehi', 29.99),
  ('Borcam', NULL, 19.99),
  ('Namsan', 'Smoothie Bardağı', NULL),
  ('Pasabahçe', 'Buzlu Su Bardağı', 18.99),
  ('Borcam', 'Çay Bardağı', 11.99),
  (NULL, 'Kahve Bardağı', 15.99),
  ('Namsan', 'Viski Bardağı', NULL),
  ('Pasabahçe', 'Buz Bardağı', 9.99);
  
--marka sütununda null olan verileri listele
select * from bardaklar where marka is null;

--model sütununda null olan verileri listele
select * from bardaklar where model is null;

--fiyat sütununda null olan verileri listele
select * from bardaklar where fiyat is null;

--marka sütununda null olmayan  verileri listele
select * from bardaklar where marka is not null;

--model sütununda null olmayan verileri listele
select * from bardaklar where model is not null;

--fiyat sütununda null olmayan verileri listele
select * from bardaklar where fiyat is not null;

--tabloda null verileri listele
select * from bardaklar where marka is null or model is null or fiyat is null;
