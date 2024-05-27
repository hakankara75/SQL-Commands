/*
TRANSACTION: 
Birden fazla işlemi tek işlem olarak kabul eder, başarısız işlem veya silinme durumlarında veriyi korur.

BEGIN: 
Bir transaction'ı başlatan bir komuttur.

SAVEPOINT:
Bir transaction'ın içinde bir nokta belirler ve daha sonra bu noktaya geri dönme imkanı verir. 
Böylelikle hata durumlarında geriye dönüp yeniden denemek mümkündür.

ROLLBACK:
bir transaction'ı geri almak ve yapılan tüm değişiklikleri iptal etmek için kullanılan bir komuttur.

COMMIT:
bir Transaction'ı  tamamlayan ve yapılan tüm değişiklikleri kalıcı hale getiren komuttur.

*/

-- Alacaklılar tablosunu oluşturma
CREATE TABLE alacaklilar (
  borc_verilenin_adi VARCHAR(50) NOT NULL,
	borc_verilenin_urunu VARCHAR(50) NOT NULL,
  borcverilen_tarih DATE NOT NULL,
  alacak_tarihi DATE NOT NULL
);


--Transaction işlemi başladı
BEGIN; 

INSERT INTO alacaklilar (borc_verilenin_adi, borc_verilenin_urunu, borcverilen_tarih, alacak_tarihi)
VALUES
  ('Hakan Kara', 'silgi', '2024-05-10', '2024-06-15'),
  ('Ayşe Yılmaz', '0,5 uç', '2024-05-15', '2024-07-01'),
  ('Mehmet Öztürk', 'kırmızı kalem', '2024-05-20', '2024-07-15'),
  ('Fatma Demir', 'çizgisiz kağıt', '2024-05-25', '2024-08-01');
  
  SAVEPOINT baslangic;
  
 INSERT INTO alacaklilar VALUES ('Ahmet Çelik', 'kalemtraş', '2024-05-30', '2024-08-15');
   INSERT INTO alacaklilar VALUES ('Elif Şahin', 'pastel boya', '2024-06-04', '2024-08-31');

select *from alacaklilar;

--tablo silindi
delete from alacaklilar;

select *from alacaklilar;

--savepoint noktasına geri dönülecek
ROLLBACK TO baslangic;

select *from alacaklilar;
 
--Transaction sonlandırıyoruz .
COMMIT;

delete from alacaklilar;