--------------- tworzenie tabel i relacji ------------------------

create table pw_faktura_detale (
    nr_faktury  		varchar2(10) 	not null,
    id_lodki    		number(5) 		not null
);

alter table pw_faktura_detale 
add constraint baza_faktura_detale_pk primary key (nr_faktury );

create table pw_faktura_naglowek (
    nr_faktury               	varchar2(10) 	not null,
    data_sprzedazy           	date 			not null,
    id_klienta 	                number(7) 		not null
);

comment on column pw_faktura_naglowek.data_sprzedazy is 'sysdate';

alter table pw_faktura_naglowek add constraint baza_faktura_naglowek_pk 
primary key ( nr_faktury );

create table pw_klienci (
    id_klienta         	number(7)       not null,
    imie_klienta       	varchar2(20),
    nazwisko_klienta    varchar2(40)    not null,
    tel_klient         	number(9),
    stopien_zeglarski   varchar2(1)
);

comment on column pw_klienci.stopien_zeglarski is
           'null - bez patentu
Z - ¯eglarz Jachtowy (I stopieñ)
S - Sternik Morski  (II stopieñ)
K - Kapitan Jachtowy (III stopieñ)';

alter table pw_klienci 
add constraint baza_klienci_pk 
primary key ( id_klienta );

create table pw_kluby (
    id_klubu    	number(3)       not null,
    nazwa_klubu  	varchar2(30)    not null
);

alter table pw_kluby add constraint baza_kluby_pk 
primary key ( id_klubu );

create table pw_lodki (
    id_lodki				        number(5) 		not null,
    nazwa_lodki 			        varchar2(50) 	not null,
    id_wlasciciela           		number(6)		not null,
    model_id                   		number(5) 		not null,
    id_producenta            		number(5) 		not null,
    rok_produkcji_lodki      		number(4) 		not null,
    stan_wypozyczenia_lodki 		varchar2(1),
    cena_lodki               		number(10)
);

comment on column pw_lodki.stan_wypozyczenia_lodki is
'Z - zajeta
N - w naprawie
W - wolna';

comment on column pw_lodki.cena_lodki is
    'je¿eli null - nie jest na sprzedaz';

alter table pw_lodki add constraint baza_lodki_pk 
primary key ( id_lodki );

create table pw_modele (
    model_id           		number(5) 		not null,
    nazwa_modelu       		varchar2(30)	not null,
    cena_wypozyczenie  	    number(5) 		not null,
    dlugosc_lodki		    number(5,1)
);

comment on column pw_modele.cena_wypozyczenie is
    'Cena za 1 dzieñ wypo¿yczenia ³ódki o danym modelu';

alter table pw_modele add constraint baza_modele_pk 
primary key ( model_id );

create table pw_producenci (
    id_producenta    	number(5)       not null,
    producent_nazwa     varchar2(30)
);

alter table pw_producenci add constraint bazy_producenci_pk 
primary key ( id_producenta );

create table pw_wlasciciele (
    id_wlasciciela       	 	number(6)       not null,
    imie_wlasciciela      	    varchar2(20),
    nazwisko_wlasciciela  	    varchar2(40)    not null,
    wlasciciel_tel        		number(9),
    id_klubu             		number(3)       not null
);

alter table pw_wlasciciele add constraint baza_wlasciciele_pk 
primary key ( id_wlasciciela );

create table pw_wypozyczenia (
    nr_wypozyczenia   		number(10) 	    not null,
    id_klienta          	number(7) 		not null,
    id_lodki            	number(5) 		not null,
    data_wypozyczenia   	date,
    data_zwrocenia     		date
);

alter table pw_wypozyczenia
    add constraint relation_6_pk 
    primary key ( nr_wypozyczenia, id_klienta, id_lodki );

alter table pw_faktura_detale
    add constraint faktura_detale_lodki_fk 
    foreign key ( id_lodki ) references pw_lodki ( id_lodki );

alter table pw_faktura_detale
    add constraint faktura_detale_naglowek_fk 
    foreign key ( nr_faktury ) references pw_faktura_naglowek ( nr_faktury );

alter table pw_faktura_naglowek
    add constraint faktura_naglowek_klienci_fk 
    foreign key ( id_klienta ) references pw_klienci ( id_klienta );

alter table pw_lodki
    add constraint lodki_modele_fk foreign key ( model_id )
        references pw_modele ( model_id );

alter table pw_lodki
    add constraint lodki_producenci_fk 
    foreign key ( id_producenta ) references pw_producenci ( id_producenta );

alter table pw_lodki
    add constraint lodki_wlasciciele_fk 
    foreign key ( id_wlasciciela ) references pw_wlasciciele ( id_wlasciciela );

alter table pw_wypozyczenia
    add constraint klienci_wypozyczenia_fk 
    foreign key ( id_klienta ) references pw_klienci ( id_klienta );

alter table pw_wypozyczenia
    add constraint lodki_fk 
    foreign key ( id_lodki ) references pw_lodki ( id_lodki );

alter table pw_wlasciciele
    add constraint wlasciciele_kluby_fk 
    foreign key ( id_klubu ) references pw_kluby ( id_klubu );
    
----------------------------- sekwencje -------------------------------

create sequence  seq_id_lodki
minvalue 		1 
maxvalue 	    99999999999999999 
increment by 	10 
start with 	    1 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_id_wlasciciela
minvalue 		1 
maxvalue 	    99999999999999999 
increment by 	3 
start with 	    100 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_id_klienta
minvalue 		1 
maxvalue 	    99999999999999999 
increment by 	12 
start with 	    6 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_id_klubu
minvalue 		1 
maxvalue 	    999 
increment by 	1 
start with 	    1 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_id_producenta 
minvalue 		1 
maxvalue 	    9999999999999999 
increment by 	3 
start with 	    5 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_id_modele
minvalue 		1 
maxvalue 		9999999999999999 
increment by 	8 
start with 		1 
cache 		    20
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_nr_faktury
minvalue 		1 
maxvalue 	    99999999999999999 
increment by 	13 
start with 	    1111111111 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

create sequence  seq_nr_wypozyczenia 
minvalue 		1 
maxvalue 		99999999999999
increment by 	20 
start with 		2900 
cache 		    20 
noorder  nocycle  nokeep  noscale  global ;

commit;

----------------------- wyzwalacze ----------------------
/
create or replace trigger tr_id_klienta
before insert on pw_klienci
for each row
begin
    :new.id_klienta := seq_id_klienta.nextval;
end;
/
create or replace trigger tr_id_klubu
before insert on pw_kluby
for each row
begin
    :new.id_klubu := seq_id_klubu.nextval;
end;
/
create or replace trigger tr_id_modele 
before insert on pw_modele
for each row
begin
   :new.model_id := seq_id_modele.nextval;
end;
/
create or replace trigger tr_id_producenta
before insert on pw_producenci
for each row
begin
   :new.id_producenta := seq_id_producenta.nextval;
end;
/
create or replace trigger tr_id_wlasciciele
before insert on pw_wlasciciele
for each row
begin
   	:new.id_wlasciciela := seq_id_wlasciciela.nextval;
end;
/
create or replace trigger tr_lodki
before insert or update on pw_lodki
for each row
begin

if inserting then
    
    :new.id_lodki := seq_id_lodki.nextval;
    :new.stan_wypozyczenia_lodki := 'W';
    
if updating and :old.cena_lodki != :new.cena_lodki then
    if :new.cena_lodki is null then
        dbms_output.put_line('£ódka o nazwie'||:old.nazwa_lodki||' nie jest ju¿ na sprzeda¿');
    if :new.cena_lodki is not null then
        dbms_output.put_line('£ódka o nazwie'||:old.nazwa_lodki||' zostala 
        wystawiona na sprzeda¿ za '||:old.cena_lodki||'');
    end if;
    end if;
end if;
end if;
end;
/
create or replace trigger tr_wypozyczenia
before insert or update on pw_wypozyczenia
for each row
declare 
n_id_klienta pw_wypozyczenia.id_klienta%type := :new.id_klienta;
n_id_lodki  pw_wypozyczenia.id_lodki%type := :new.id_lodki;
begin
if inserting then
    :new.nr_wypozyczenia := seq_nr_wypozyczenia.nextval;
    
    insert into pw_faktura_naglowek
        (nr_faktury, data_sprzedazy, id_klienta)
    values (seq_nr_faktury.nextval, sysdate, n_id_klienta);
    
    insert into pw_faktura_detale
    values (seq_nr_faktury.currval, n_id_lodki);
    
if updating then    
    dbms_output.put_line('Wypozyczenie numer '||:old.nr_wypozyczenia||' zostalo zuaktualizowane');

end if;
end if;
end;
/

------------------------------------- Perspektywy ------------------------------------

-- perspektywa lodki na sprzeda¿

create or replace view view_kupno_lodki as 
  select  nazwa_modelu ||' '|| dlugosc_lodki as "Model i d³ugoœæ ³ódki",
        nazwa_lodki as "Nazwa ³ódki",
        rok_produkcji_lodki as "Rok produkcji ³ódki",
        cena_lodki as "Cena ³ódki",
        imie_wlasciciela ||' '|| nazwisko_wlasciciela as "Sprzedaj¹cy",
        wlasciciel_tel as "Numer telefonu"
from pw_lodki ldk
join pw_wlasciciele wls on wls.id_wlasciciela = ldk.id_wlasciciela
join pw_modele mdl on  mdl.model_id = ldk.model_id
where ldk.cena_lodki is not null
order by ldk.cena_lodki;

-- perspektywa dane do faktury

create or replace view view_dane_faktura as
select fn.nr_faktury, 
       nazwisko_klienta ||' '|| imie_klienta as "Klient",
       tel_klient as "Telefon kontaktowy" ,
       nazwa_lodki as "£ódka",
       mdl.cena_wypozyczenie*(data_zwrocenia-data_wypozyczenia) ||' z³' as "Koszt wypozyczenia"
from pw_faktura_naglowek fn
join pw_faktura_detale fd on fn.nr_faktury = fd.nr_faktury
join pw_klienci kl on fn.id_klienta = kl.id_klienta
join pw_lodki ldk on ldk.id_lodki = fd.id_lodki
join pw_wypozyczenia wyp on wyp.id_lodki = ldk.id_lodki
join pw_modele mdl on mdl.model_id = ldk.model_id;

-- perspektywa lodki do wypozyczenia

create or replace view view_lodki_do_wypozyczenia as
select nazwa_lodki as "Nazwa ³ódki",
       nazwa_modelu ||' - '|| mdl.dlugosc_lodki as "Model i d³ugoœæ ³ódki",
       rok_produkcji_lodki as "Rok produkcji",
       nazwa_klubu as "Klub",
       cena_wypozyczenie ||' z³' as "Koszt wypo¿yczenia 1 dzieñ"
from pw_lodki ldk
join pw_modele mdl on ldk.model_id = mdl.model_id
join pw_wlasciciele wls on wls.id_wlasciciela = ldk.id_wlasciciela
join pw_kluby kl on kl.id_klubu = wls.id_klubu
where stan_wypozyczenia_lodki = 'W';

-- perspektywa dane o wszystkich lodkach

create or replace view view_info_lodki as
select nazwa_lodki as "Nazwa £ódki",
       nazwa_modelu ||' '|| dlugosc_lodki ||' - '|| lower(producent_nazwa) as "Model producenta",
       cena_wypozyczenie as "Cena wynajêcia",
       upper(substr(imie_wlasciciela, 1, 1))  ||' '|| nazwisko_wlasciciela as "Wlasciciel",
       wlasciciel_tel as "Telefon kontaktowy"
from pw_lodki ldk
join pw_wlasciciele wls on wls.id_wlasciciela = ldk.id_wlasciciela
join pw_modele mdl on mdl.model_id = ldk.model_id
join pw_producenci prd on prd.id_producenta = ldk.id_producenta;

------------------------ Procedury ----------------------

-- dodawanie wlasciciela
/
create  or replace procedure pr_insert_wlasciciel
                (v_nazwisko     pw_wlasciciele.nazwisko_wlasciciela%type,
                 v_imie         pw_wlasciciele.imie_wlasciciela%type,
                 n_tel          pw_wlasciciele.wlasciciel_tel%type,
                 n_klub         pw_wlasciciele.id_klubu%type) as
klub    numeric;
begin
select count(*) into klub
from pw_kluby
where id_klubu = n_klub;

if klub <> 0 then
    insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu)
    values (v_imie, v_nazwisko, n_tel, n_klub);
    commit;

if klub = 0 then
    dbms_output.put_line('Brak klubu o numerze: '||n_klub);
    
end if;
end if;
end;
/

-- dodawanie lodki
create or replace procedure pr_insert_lodka
    (v_nazwa 	    pw_lodki.nazwa_lodki%type,
     n_wlasciciel	pw_lodki.id_wlasciciela%type,
     n_model	    pw_lodki.model_id%type,
     n_producent	pw_lodki.id_producenta%type,
     n_rok_pr	    pw_lodki.rok_produkcji_lodki%type,
     v_stan_wyp	    pw_lodki.stan_wypozyczenia_lodki%type,
     n_cena		    pw_lodki.cena_lodki%type) as

wlasciciel	numeric;
ile_modeli	numeric; 
producent	numeric;

begin

select count(*) into wlasciciel 
from pw_wlasciciele 
where id_wlasciciela = n_wlasciciel;

select count(*) into ile_modeli 
from pw_modele
where model_id = n_model;

select count(*) into producent
from pw_producenci
where id_producenta = n_producent;

if wlasciciel <> 0 and ile_modeli <> 0 and producent <> 0 then
	insert into pw_lodki (nazwa_lodki, id_wlasciciela, model_id, 
	id_producenta, rok_produkcji_lodki, stan_wypozyczenia_lodki, cena_lodki)
	values (v_nazwa, n_wlasciciel, n_model, n_producent, n_rok_pr, v_stan_wyp, n_cena);
	commit;

if wlasciciel = 0 then
	dbms_output.put_line('Brak wlasciciela o numerze: '||n_wlasciciel);

if ile_modeli = 0 then
	dbms_output.put_line('Brak modelu o numerze: '||n_model);

if producent = 0 then
	dbms_output.put_line('Brak producenta o numerze: '||n_producent);

end if;
end if;
end if;
end if;
end;

-- Dodawanie wypozyczenia
/
create or replace procedure pr_insert_wypozyczenie
    (n_klient   pw_klienci.id_klienta%type,
     n_lodka    pw_lodki.id_lodki%type,
     d_wyp      pw_wypozyczenia.data_wypozyczenia%type,
     d_zwr      pw_wypozyczenia.data_zwrocenia%type) as
 
klient  pw_klienci.id_klienta%type;
lodka   pw_lodki.id_lodki%type;
n_nr_wyp  pw_wypozyczenia.nr_wypozyczenia%type := seq_nr_wypozyczenia.nextval;
begin

select count(*) into klient from pw_klienci
where id_klienta = n_klient;

select count(*) into lodka from pw_lodki
where id_lodki = n_lodka;

if klient <> 0 and lodka <> 0 then
    insert into pw_wypozyczenia (nr_wypozyczenia, id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia)
    values (n_nr_wyp, n_klient, n_lodka, d_wyp, d_zwr);
    commit;

if klient = 0 then
    dbms_output.put_line('Brak klienta o numerze: '||n_klient);
    
else
    dbms_output.put_line('Brak lodki o numerze: '||n_lodka);
    
end if;
end if;
end;
/

-- dodawanie klienta
create or replace procedure pr_insert_klient
                    (v_nazwisko  pw_klienci.nazwisko_klienta%type,
                     v_imie      pw_klienci.imie_klienta%type,
                     n_tel       pw_klienci.tel_klient%type,
                     v_stopien_z pw_klienci.stopien_zeglarski%type)
as
n_id_klienta    pw_klienci.id_klienta%type   := seq_id_klienta.nextval;
begin
    insert into pw_klienci
           (id_klienta, imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski)
    values (n_id_klienta, v_nazwisko, v_imie, n_tel, v_stopien_z);
    commit;
end;
/

-- usuwanie klienta
create or replace procedure pr_drop_klient
(n_klient pw_klienci.id_klienta%type) as
begin
delete pw_klienci
    where id_klienta = n_klient;
end;
/


----------------------------------- Funkcje ---------------------------------

-- Obliczanie zysku od podanej daty do dzisiaj  
create or replace function func_zysk_od_daty
(d_od       date)
 
return numeric as
    zysk numeric;
begin
    select sum(  cena_wypozyczenie*(data_zwrocenia-data_wypozyczenia)) into zysk
    from pw_lodki ldk                          
    join pw_wypozyczenia wyp on wyp.id_lodki = ldk.id_lodki
    join pw_modele mdl on mdl.model_id = ldk.model_id
    having wyp.data_wypozyczenia > d_od;
return zysk;
end;
/

-- Obliczanie zysku uzyskanego z wypo¿yczenia pojedynczej ³ódki    
create or replace function func_zysk_lodka
(n_lodka     pw_lodki.id_lodki%type)
 
return numeric as
    zysk numeric;
begin
    select sum(  cena_wypozyczenie*(data_zwrocenia-data_wypozyczenia)) into zysk
    from pw_lodki ldk                          
    join pw_wypozyczenia wyp on wyp.id_lodki = ldk.id_lodki
    join pw_modele mdl on mdl.model_id = ldk.model_id
    having ldk.id_lodki = n_lodka;
return zysk;
end;
/

-- Obliczenie iloœci wypozyczeñ przez jednego klienta w okreœlonym okresie czasu
create or replace function func_ilosc_wypozyczen
(n_klient   pw_klienci.id_klienta%type,
 d_od       pw_wypozyczenia.data_wypozyczenia%type,
 d_do       pw_wypozyczenia.data_wypozyczenia%type)
 
return numeric as
    ilosc numeric;
begin
    select count(*) into ilosc
    from pw_wypozyczenia wyp
    having id_klienta = n_klient 
    and wyp.data_wypozyczenia between d_od and d_do;
return ilosc;
end;
/
