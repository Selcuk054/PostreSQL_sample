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

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child tabloya ekleme yapamayiz.

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep'); 

--Calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin
select * from calisanlar,adresler where calisanlar.id=adresler.adres_id;

--Patent table ortadan kaldirmaya calisalim 
Drop table calisanlar; 
-- silmek istedigimzde silmez. Once chilt tabloyu silmemiz gerekir.

delete from calisanlar where id='10002'; bu parentta oldugu icin once childdan silmemiz gerekiyor
delete from adresler where adres_id = '10002';

drop table calisanlar;


