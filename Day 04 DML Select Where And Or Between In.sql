create table biskuvi(
biskuvi_id INT,
	biskuvi_adi VARCHAR(50),
	biskuvi_turu  VARCHAR(50),
	biskuvi_agirligi REAL,
	bikuvi_fiyati DECIMAL(4,2),
	biskuvi_stok_miktarı INT,
	biskuvi_uretim_tarihi DATE
);

select * from biskuvi;

drop table biskuvi;

create table biskuvi(
biskuvi_id INT,
	biskuvi_adi VARCHAR(50),
	biskuvi_turu  VARCHAR(50),
	biskuvi_agirligi REAL,
	bikuvi_fiyati DECIMAL(4,2),
	biskuvi_stok_miktarı INT,
	biskuvi_uretim_tarihi DATE
);

select * from biskuvi;

insert into biskuvi(biskuvi_id,	biskuvi_adi ,	biskuvi_turu ,
	biskuvi_agirligi ,	bikuvi_fiyati ,	biskuvi_stok_miktarı ,
	biskuvi_uretim_tarihi ) values
	(001, 'sütlü biskuvi','sütlü',100,12.50,100, '2024-01-02'),
	(002, 'kakaolu biskuvi','kakaolu',120,13.90,50, '2024-03-02'),
	(003, 'kremalı biskuvi','kremalı',150,17.50,25, '2024-01-02'),
	(004, 'sütlü biskuvi','sütlü',250,20.50,25, '2024-02-02'),
	(005, 'sütlü biskuvi','sütlü',175,18.98,75, '2024-01-02');
	
	select * from biskuvi;
	
--fiyatı 13 liradan fazla olan ürünleri listeleyin
select * from biskuvi WHERE bikuvi_fiyati>13;

--TÜRÜ SÜTLÜ ürünleri listeleyin
select * from biskuvi WHERE biskuvi_turu='sütlü';

--biskuvi_id si 2 den büyük olan ve biskuvi_stok_miktarı 50'den fazla olan ürünleri listele
select * from biskuvi WHERE biskuvi_id>2 AND biskuvi_stok_miktarı>50;

--biskuvi_agirligi 100 veya 175 olan ürünleri listele
select * from biskuvi WHERE biskuvi_agirligi=100 OR biskuvi_agirligi=175;
select * from biskuvi WHERE biskuvi_agirligi IN(100,175);

--biskuvi_stok_miktarı 25 olmayan tüm ürünleri listele
select * from biskuvi WHERE biskuvi_stok_miktarı NOT IN(25);

--biskuvi_id si 2 ile 4 arasındaki ürünleri listele
select * from biskuvi WHERE biskuvi_id>=2 AND biskuvi_id<=4;
select * from biskuvi WHERE biskuvi_id BETWEEN 2 AND 4;

--biskuvi_stok_miktarı 40 ile 80 arasında olmayan ürünlerin biskuvi_adi ve biskuvi_uretim_tarihi listele
select biskuvi_adi,biskuvi_uretim_tarihi from biskuvi WHERE biskuvi_stok_miktarı NOT BETWEEN 40 AND 80;






