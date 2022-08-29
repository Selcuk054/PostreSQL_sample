--DML --> Update 
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

select * from tedarikciler;

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from urunler;

-- SORU vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.

update tedarikciler
set firma_ismi ='Vestel' where vergi_no=102;

select * from tedarikciler;

--SORU vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
Update tedarikciler
set firma_ismi = 'Casper', irtibat_ismi ='Ali Veli' where vergi_no = 101;

-- SORU urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
Update urunler
set urun_isim = 'TELEFON' where urun_isim= 'Phone';

--SORU  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
Update urunler
set urun_id = urun_id+1 where urun_id >1004;

-- SORU urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler
set urun_id=ted_vergino+urun_id;

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
--Bu soruda tedarikciler ve urunler tablosunu yeniden olusturduk.
update urunler
set urun_isim = (select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
where musteri_isim='Ali Bak';

select*from urunler;

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from markalar;
select * from calisanlar2;

-- Soru calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada 
--calisanlarin isimlerini ve maaşlarini listeleyin.

select isim,maas, isyeri from calisanlar2
Where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);

--SORU marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim,maas,sehir from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id>101);

--SORU Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

SELECT marka_id, calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');
