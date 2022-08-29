/*
DDL  -DATA DEFINITION LANG.
CREATE - ALTER - DROP
*/
--CREATE table OLUSTURMA
CREATE TABLE ogrenci(
ogr_no int,
ogr_isimsoyisim varchar(30),
notlar real,
yas int,
adress varchar(50),
kayit_tarih date
);
--varolan tablodan yeni bir tablo olusturma
create table ogrenci_notlari
as
select ogr_no, notlar from ogrenci;

select * from ogrenci;
select * from ogrenci_notlari;--hello