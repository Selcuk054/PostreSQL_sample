--Personel isminde bir tablo olusturalim
create table personel(
pers_id int,
isim varchar (30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);

--Varolan personel tablosundan pers_id, sehir,adres fieldlarin asahip 
--personel_adres adinda yeni bir tablo olusturalim.
create table personel_adres
as
select pers_id, sehir, adres from personel;

select * from personel

select * from personel_adres

--DML --> Data Manuplation Language (Veri degistirme dili)
--Veri tabanna yeni kayir ekleme, mevcut kayitlari guncelleme ve silme islemleri yapilir.
--1-Insert--> Veri tababnina yeni veri ekler
--2-Update --> veri tabaninda verileri gunceller
--3-Delete --> Veritabanindaki verileri siler.

create table student(
id varchar (4),
st_name varchar(30),
age int

);
insert into student values('1001','Ali Can',25);
insert into student values('1002','Veli Can',35);
insert into student values('1003','Ayse Can',45);
insert into student values('1004','Derya Can',55);

--Tabloya parcali veri ekleme
insert into student (st_name,age) values ('Murat Can', 65);

--Tabloyu gormek icin DQL komutu vardi
--Data query language DQL
--select
select * from student; --Bu komut tum tabloyu getiriyor, 
-- sadece bir satiri istedigimizdwe ise
select st_name from student;

--mesela strundet tablosunda yaslari 35 ten buyukleri gormek istiyorsak
--SELECT komutu WHERE kosulu 
select * from student where age >35;


--TCL Transaction Control language // 

--Savepoint
--rollback
--commit 
-- Bunlari baslatmak icin mysql vs direk kabul ediyor 
--fakat Postge sql de kullanabilmek icin basina Begin konulmasini isitiyor.
/* Tarnsaction veri tabani sistemlerinde bir islem basladiginda baslar ve islem bitince de sona erer.
Bu islemler veritabani olusturma, vei silme, ve veriyi geri getirme gibi islemler olabilir.
*/

create table ogrenciler2(
id serial,
isim varchar (50),
veli_isim varchar (50),
yazili_notu real
);
Begin;
insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 values (default,'Canan Gul','Ayse Sen',90.5);
savepoint x
insert into ogrenciler2 values (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 values (default,'Ahmet','Ayse Sen',65.5);

ROLLBACK TO x

select * from ogrenciler2;

--Transaction dan cikmak icin mutlaka commit yapilmali. yoksa baska yapilan islemlerde hata alinir.
--Transactin kullaniminda serial data turu tavsiye edilmez.
--Save pointten sonra ekledigimiz veride sayac mantigi calistigi icin sayacta en son hangi sayida kaldi ise 
--oradan devam eder.
commit;
--NOT--> PostgreSql de transaction kullanimi icin BEGIN  komutu ile baslariz sonrasinda tekrar yanlis bir veriyi
--duzeltmek veya bizim icin onemli olan verilerden sonra ekleme yapabilmek icin "savepoint ve isim"
--kullaniriz. ve save pointe donebilek icin "ROLLBACK TO isim" komutunu kullaniriz.
--ve rollback calistirildiginda save point yazdigimiz satirin ustundeki verileri tabloda bize verir.
--Son olarak transaction u sonlandirmak icin mutlaka commit komutu kullaniriz.
--MySQL de transaction olmadanda kullanilir.


--DML Komutlari = Veri degistirme dili/
--insert , delete, update
--DELETE From tablo_adi --> tablonun tum icerigini isiler
--Veriyi secerek silmek icin WHERE kosulu kullanilir
--DELETE FROm tablo_adi WHERE sutun_adi => tablodaki istedigimiz veriyi siler

create table ogrenciler
(
id int,
isim varchar (50),
veli_isim varchar (50),
yazili_notu int
);

Insert into ogrenciler values (123, 'Ali Can', 'Hasan', 75);
Insert into ogrenciler values (124, 'Merve Gul', 'Ayse', 85);
Insert into ogrenciler values (125, 'Kemal Yasa', 'Hasan', 95);
Insert into ogrenciler values (126, 'Nesibe yilmaz', 'Ayse', 55);
Insert into ogrenciler values (127, 'Mustafa Bak', 'Can', 75);
Insert into ogrenciler values (128, 'Mustafa bak', 'Ali', 85);

select * from ogrenciler;

--Soru 1-) id si 124 olan ogrenciyi siliniz
delete from ogrenciler where id = 124;

--Soru 2-) Ismi kemal yasa olan satiri siliniz
delete from ogrenciler where isim = 'Kemal Yasa';

--soru 3-) ismi nesibe yilmaz veya mustafa bak olan kayitlari siliniz
delete from ogrenciler where isim= 'Nesibe yilmaz' or isim = 'Mustafa Bak';

--Soru 4-) Ismi Ali Can ve id si 125 olan kaydi siliniz
delete from ogrenciler where isim = 'Ali Can';
delete from ogrenciler where id = 125;

--tablodaki tim verileri silelim
delete from ogrenciler;

--DELETE - Trancate - 
--truncate komutu delete komutu gibi bir tablodaki verilerin tamamini siler
--Ancak , secmeli silme yapmaz

truncate table ogrenciler;

--DDL DAta definition language

--create-alter- drop
--ALTER TABLE
--ALTER TABLE tabloda tyoe, set , rename, veya (drop columns) islemleri icin kullanilir.
create table personel(
pers_id int,
isim varchar (30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);

--SORU Personel tablosuna cinsiyet varchar(20 ve yas in. seklinide yeni sutunlar ekleyin)

alter table personel add cinsiyet varchar(20), add yas int;
select * from personel

--SORU Personel tablosundan sirket field ini siliniz
alter table personel drop column sirket;

--SORU Personel tablosundaki sehir sutunun adini ulke olarak degistirin
alter table personel rename column sehir to ulke;

--SORU personel tablosunun adini isciler olarak degistirin
alter table personel rename to isciler;

--DDL -drop komutu
drop table isciler;

--CONSTRAINT -->kisitlamalar
--Primary key -- bir sitinin NULL icermemesini ve sutundaki verilerin BENZERSIZ olmasini saglar (NOT NULL- UNIQUE)
--Foreign key-->Baska bir tablodaki Primary key i referans gostermek icin kullanilir.
--Boylelikle, tablolar arasinda iliski kurmus oluruz.

--ONIQUE--> Bir sutundaki tum degerleri benzersiz yani tek olmasini saglar.
-- NOT NULL --> bir sutunun null icermemesin yani bos olmamasini saglar.
--NOT NULL kisitlamasi icin CONCTRAINT ismi tanimlanmaz. BU kisitlama veri turunden hemen sonra yerlestirilir
--CHECKK bir sutuna yerlestirilebilecek deger araligini sinrlamak icin kullanilir

Create table calisanlar
(
id char(5) primary key, --not nul+unique
isim varchar (50) unique, --UNique --> Bir sutundaki tum degerleri benzersiz yani tek olmasini saglar.
maas int not null,--NOT NULL --> bir sutunun null icermemesin yani bos olmamasini saglar.
ise_baslama date
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

select * from calisanlar;


Create table calisanlar2(
id char(5),
isim varchar (50),
maas int not null,
ise_baslama DATE,
CONSTRAINT pk_id primary key(id),
CONSTRAINT ism_unq unique(isim)		
); 

--Foreign key -->
create table adresler(
adres_id char(5),
sokak varchar (20),
cadde varchar (30),
sehir varchar (20),
constraint id_fk foreign key (adres_id) references calisanlar (id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
