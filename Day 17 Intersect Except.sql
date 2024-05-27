/*
INTERSECT
iki ayrı sorgunun kesişim değerini elde etmek istersek kullanılır

EXCEPT
ilk sorguda olan ancak ikinci sorguda olmayan değeri elde etmek için kullanılır
*/

create table ustalar(
isim varchar (30) not null,
	meslek varchar (30) not null,
	saatlik_ucret INT not null,
	ustalik_yili INT not null,
	sehir varchar (30) not null

)

INSERT INTO ustalar VALUES
('Ahmet Yorgun', 'Tesisatçı', 50, 15, 'İstanbul'),
('Vural Solgun', 'Elektrikçi', 45, 10, 'İstanbul'),
('Murat Öz', 'Marangoz', 40, 8, 'Ankara'),
('Harun Sarsılmaz', 'Marangoz', 21, 7, 'İstanbul'),
('Vural Solgun', 'Marangoz', 41, 9, 'Ankara'),
('Ahmet Yorgun', 'Motorcu', 75, 17, 'Bursa'),
('Murat Öz', 'Doğalgazcı', 40, 8, 'Ankara'),
('Ahmet Yorgun', 'Doğalgazcı', 60, 12, 'İzmir'),
('Ahmet Yorgun', 'Tesisatçı', 75, 12, 'Bursa'),
('Vural Solgun', 'Elektrikçi', 59, 34, 'Ankara'),
('Harun Sarsılmaz', 'Tesisatçı', 42, 7, 'İzmir'),
('Murat Öz', 'Doğalgazcı', 34, 5, 'İzmir'),
('Harun Sarsılmaz', 'Tesisatçı', 43, 9, 'Bursa');

select * from ustalar

/*
ismi murat öz olanların saatlik ücretlerin ve ustalık yıllarını ve
ili izmir olanların ücretlerini ve ustalık yılların bulup
iki sorgunun kesişim kümesini listele
*/
select saatlik_ucret, ustalik_yili from ustalar where isim='Murat Öz'
INTERSECT
select saatlik_ucret, ustalik_yili from ustalar where sehir='İzmir'

/*
marangozların ustalık yılları ile şehirlerini ve
saatlik ücret 39 üzerinde olanların ustalık yılları ve şehirlerini bul
iki sorgunun kesişimini listele
*/
select ustalik_yili, sehir from ustalar where meslek='Marangoz'
INTERSECT
select ustalik_yili, sehir from ustalar where saatlik_ucret> 39

/*
ustalık yılı 10 dan yukarı olanların isim ve meslekerleri ile
şehri istanbul olanların isim ve mesleklerini bul
iki sorgunun kesişimini listele
*/
select isim, meslek from ustalar where ustalik_yili>10
INTERSECT
select isim, meslek from ustalar where sehir='İstanbul'

/*
ismi Harun Sarsılmaz olanların meslek ve şehir bilgilerini
şehri Bursa olanların meslek ve şehir bilgilerini bul
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/
select meslek,sehir from ustalar where isim='Harun Sarsılmaz'
EXCEPT
select meslek,sehir from ustalar where sehir='Bursa'


/*
şehri Ankara ve İstanbul olanların isim ve meslek bilgilerini
saatlik ücreti 45'in altında olanların isim ve meslek bilgilerini
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/
select isim, meslek from ustalar where sehir='Ankara' or sehir='İstanbul'
EXCEPT
select isim, meslek from ustalar where saatlik_ucret < 45


/*
mesleği marangoz olanların isim ve ustalık yılları
şehri Ankara ve İzmir olanların isim ve ustalık yılları
ilk sorguda olup ikinci sorguda olmayacak şekilde listele
*/

select isim, ustalik_yili,sehir from ustalar where meslek='Marangoz'
EXCEPT
select isim, ustalik_yili,sehir from ustalar where sehir='Ankara' or sehir='İzmir'










