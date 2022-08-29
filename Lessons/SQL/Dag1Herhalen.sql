/*
DDL - Data Definition Language (Veri tanimlama dili)
Veritabani olusturma
tablolari olusturma, degistirme, silme islemleri yapilir
KOMUTLARI
create -> bir veri tabani veya tablo olusturur.
alter -> bir veri tabani veya tabloyu gunceller.
drop -> bir veritabanini veya tabloyu siler.
*/

create table ogrenci(
ogr_no int,
ogr_isim varchar (30),
notlar real,
yas int,
adress varchar (50),
kayir_tarihi Date
);

--Varolan tablodan yeni bir tablo olusturma
create table ogr_notlari
as
SELECT ogr_no, notlar from ogrenci;

select * from ogrenci;
select * from ogr_notlari;


