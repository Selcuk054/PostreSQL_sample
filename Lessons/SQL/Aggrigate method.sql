-- AGGREGATE METHOD KULLANIMI

/*
Aggregate methodlari (SUM(Toplama), COUNT(say), MIN(en kucuk deger), MAX(en buyuk deger) AVG(ortalama))
-subquery icinde de kullanilir
Ancak sorgu tek bir deger donduruyor olmalidir
SYNTAX: sum() seklinde olmali sum ve () arasinda bosluk olmamali
*/

select * from calisanlar2

--Calisanlar iki tablosundaki en yuksek maas degerini listeleyiniz

select max(maas) from calisanlar2;

-- Calisanlar tablosundaki maaslarin toplamini listeleyin
select sum(maas) from calisanlar2;

--Calisanlar tablosundaki maas ortalamalarini listeleyiniz

select avg(maas) from calisanlar2;
select round (avg(maas)) from calisanlar2; --noktadan sonrayi kaldiriyor
select round (avg(maas),3) from calisanlar2; --noktadan sonra kac rakam istersek busekilde

--calisanlar tablosunda en dusuk maasi getirin.

select min(maas) from calisanlar2;

--SORU calisanlar tablosundan kac kisinin maas aldign=ini belitirtin
select count(maas) from calisanlar2;

select * from markalar;
-- SORU Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

Select marka_ismi ,calisan_sayisi(select sum(maas)from calisanlar2 where marka_isimisyeri) AS toplam_maas from markalar

-- SOru Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum 
--maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,(select max(maas)from calisanlar2 where marka_isim=isyeri) as max_maas,
                                 (select min(maas)from calisanlar2 where marka_isim=isyeri) as min_maas from markalar;
								 
--SORU Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim(select count(sehir)from calisanlar2 where marka_isim=isyeri) as sehir_sayisi from markalar

--Interview Question: En yüksek ikinci maas değerini çağırın.

select max(maas) as en_yuksek_ikinci_maas from calisanlar2
where maas<(select max(maas) from calisanlar2)

--Soru En yüksek üçüncü maas değerini bulun
select max(maas) as en_yuksekucuncu_maas from calisanlar2
where maas<(select max(maas) from calisanlar2 where maas <(select max(maas) from calisanlar2))

--Soru En dusuk ucuncu maas degerini bulunuz (ODEV)
