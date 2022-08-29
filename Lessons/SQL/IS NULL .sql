-- IS NULL, IS NOT NULL, COALESCE --
/*
IS NULL VE IS NOT NULL Boolean operatorlridir. Bir ifadenin null olup olmadigini kontrol eder.

Coalese yani birlestirme ise bir fonksiyonudu ve icerisindeki paametrelerden NULL olmayan ilk ifadeyi dondurur.

*/

CREATE TABLE insanlar (	
ssn CHAR(9), -- Social Security Number	
isim VARCHAR(50), 	
adres VARCHAR(50) );

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');


select * from insanlar;

--isim i null olanlari sorgula
select * from insanlar where isim is null;

-- isim i null olmayanlari listeyelim

select * from insanlar where isim is not null;

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.

update insanlar 
set isim = 'no name'
where isim = null;

--Tabloyu bir onceki soruyu cozmeden onceki haline getirin

update insanlar 
set isim = null
where isim = 'no name';

select * from insanlar;

--ismi null olanlari sorgula
select * from insanlar where isim is null


--NOT : Coklu degisimde her degiim icin set.. where isim is null gibi ifade yazmamak icin
--colaesce (Birlestirme) kullanilir.

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

update insanlar set isim = null where isim = 'Henuz Isim girilmedi';
update insanlar set adres = null where adres = 'Henuz adres girilmedi';
update insanlar set ssn = null where ssn = 'NO SSN';

update insanlar set isim =coalesce (isim, 'Henuz Isim girilmedi'),
                    adres=coalesce (adres, 'Henuz adres girilmedi'),
					ssn=coalesce (ssn, 'no ssn');
					
select * from insanlar
					
					
					
					
					
					
					
					
					
					
					
					










