------------------------ Przykladowe dane ------------------------

--- KLUBY
insert into pw_kluby (nazwa_klubu) values ('Chris');
insert into pw_kluby (nazwa_klubu) values ('Nysa');
insert into pw_kluby (nazwa_klubu) values ('Ahoy Przygodo!');
insert into pw_kluby (nazwa_klubu) values ('Ferajna');
insert into pw_kluby (nazwa_klubu) values ('Bom');
insert into pw_kluby (nazwa_klubu) values ('Szanty i wanty');
insert into pw_kluby (nazwa_klubu) values ('Bialy Szkwal');

commit;

--- PRODUCENCI
insert into pw_producenci(producent_nazwa) values ('Delphia');
insert into pw_producenci(producent_nazwa) values ('Northman');
insert into pw_producenci(producent_nazwa) values ('Lamitar');
insert into pw_producenci(producent_nazwa) values ('Yachtall');

commit;

--- WLASCICIELE
insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Karolina', 'Relich', 602536271, 1);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Bartosz', 'Drobnicki', 501726381, 3);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Krzysztof', 'Sienkiewicz', 738271627, 5);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Piotr', 'Mielcarek', 506728111, 4);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Adam', 'Kowalewski', 632718272, 4);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Piotr', 'Adamski', 546372819, 7);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Amelia', 'Abacka', 782918732, 6);

insert into pw_wlasciciele
    (imie_wlasciciela, nazwisko_wlasciciela, wlasciciel_tel, id_klubu) 
values ('Wiktor', 'Sodoma', 521231329, 1);

commit;

--- KLIENCI
insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Mariusz', 'Lewandowski', 256127382, 'S');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Anna', 'Banaszek', 892823726, 'Z');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Agnieszka', 'Kowalska', 627382716, 'S');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Wojciech', 'Walicki', 738273615, 'K');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Adam', 'Mroczek', 528372629, 'Z');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Karolina', 'Bujalska', 253672817,'Z');

insert into pw_klienci
    (imie_klienta, nazwisko_klienta, tel_klient, stopien_zeglarski) 
values ('Krzysztof', 'Siekielski', 253262718, 'Z');

commit;

--- MODELE
insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Antila', 200, 22.4);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Antila', 250, 27);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Antila', 300, 30);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Maxus', 370, 27);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Maxus', 500, 33.1);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Tango', 400, 30);

insert into pw_modele 
    (nazwa_modelu, cena_wypozyczenie, dlugosc_lodki)
values ('Tes', 550, 32);

commit;

--- £ÓDKI
insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Nemo', 121, 9, 11, 1998);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki, cena_lodki) 
values ('Sheldon Cooper', 103, 17, 14, 2005, 40000);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki, cena_lodki) 
values ('Lucyfer', 109, 25, 14, 2014, 60000);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Luke Skywalker', 112, 49, 8, 1999);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Gunther', 100, 1, 5, 2000);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki, cena_lodki) 
values ('Mindhunter', 118, 33, 11, 2002, 12000);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Enola Holmes', 118, 1, 5, 2014);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Geek', 112, 25, 5, 2002);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki, cena_lodki) 
values ('Rick and Morty', 115, 49, 14, 2008, 25000);

insert into pw_lodki
    (nazwa_lodki, id_wlasciciela, model_id, id_producenta, rok_produkcji_lodki) 
values ('Baywatch', 112, 17, 5, 2006);

commit;

--- Wypozyczenia
insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 66, 11, '2020/02/02', '2020/10/02');

insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 18, 21, '2020/05/07', '2020/05/14');

insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 78, 81, '2020/06/05', '2020/06/20');

insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 18, 91, '2020/06/04', '2020/06/19');

insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 42, 31, '2020/06/12', '2020/06/15');

insert into pw_wypozyczenia
    (id_klienta, id_lodki, data_wypozyczenia, data_zwrocenia) 
values ( 6, 41, '2020/07/15', '2020/07/25');

commit;