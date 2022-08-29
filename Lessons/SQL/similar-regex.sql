---- SELECT - SIMILAR TO - REGEX (REGULAR EXPRESSIONS) --
/*
Similar to : daha karmasik pattern (kalip) ile sorgulama islemi icin similar to kullanilabilir.
Buyuk kucuk harf onemlidir.


Regex : Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
kendine ait bir soz dizimi olan bir yapidir. MySQL de (REGEXP_LIKE ) olarak kullanilir 
PostgreSQL de "~" karakteri ile kullanilir.

*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler

-- SORU  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
--veya islemi icin | karakteri kullanilir

--similar to ile
select * from kelimeler where kelime similar to '%(at|ot)%';
--like ile
select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%';
select * from kelimeler where kelime ~~* '%at&' or kelime ~~* '%ot%';
--regex
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

--SORU  : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--similar to
select * from kelimeler where kelime similar to 'ho%|hi%';
--like ile
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%'
--Regex ile
select *from kelimeler where kelime ~* 'h[oi](.*)'--regexte . nokta bir karakteri temsil eder. 
--Regexte ikinci karakter koseli parantez kullanilir. * hepsi anlaminda kullanilir.

--SORU Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR to ile
select * from kelimeler where kelime similar to '%t|%m';
--regex ile
select *from kelimeler where kelime ~* '(.*)[tm]$' --$ karakteri bitisi gosterir.

--SORU h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--similar to ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
--like ile
select * from kelimeler where kelime ~~* 'h_t';
--regex ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z]t';

-- SORU İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--“kelime" değerlerini çağırın.
--similar to ile
select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t';
--REGEX ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';
--Like ile odev

--SORU İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^[say](.*)' -- ^ bu karakter baslangic i temsil eder.
--Diger cozumleri odev

-- SORU Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$';

-- SORU İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
-- SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a|i]t';
-- REGEX ILE
select * from kelimeler where kelime ~ '^h[a|i]t';

--SORU İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi 
--bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^[b-s].l(.*)'; -- b-s den sonraki nokta diger cozum seklindeki % ozelligi gibi.

-- SORU içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%';
select * from kelimeler where kelime similar to '%[o]{2}%';
--Suslu parantez icinde belirttigimiz rakam bir onceki parantez icinde kactane oldugunu belirtir.

--SORU içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select kelime from kelimeler WHERE kelime SIMILAR TO '%[o]{4}%'

--SORU 'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[asy](.*)[mf]'
