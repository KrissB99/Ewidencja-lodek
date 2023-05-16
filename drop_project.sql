
------------------ usuwanie tabel ------------------

DROP TABLE pw_kluby CASCADE CONSTRAINTS;
DROP TABLE pw_lodki CASCADE CONSTRAINTS;
DROP TABLE pw_modele CASCADE CONSTRAINTS;
DROP TABLE pw_producenci CASCADE CONSTRAINTS;
DROP TABLE pw_wlasciciele CASCADE CONSTRAINTS;
DROP TABLE pw_klienci CASCADE CONSTRAINTS;
DROP TABLE pw_wypozyczenia CASCADE CONSTRAINTS;
DROP TABLE pw_faktura_detale CASCADE CONSTRAINTS;
DROP TABLE pw_faktura_naglowek CASCADE CONSTRAINTS;

--------------- usuwanie wyzwalaczy ---------------

DROP TRIGGER tr_id_klienta;
DROP TRIGGER tr_id_klubu;
DROP TRIGGER tr_id_modele;
DROP TRIGGER tr_id_producenta;
DROP TRIGGER tr_id_wlasciciele;
DROP TRIGGER tr_wypozyczenia;
DROP TRIGGER tr_lodki;

---------------- usuwanie sekwencji ----------------

DROP SEQUENCE seq_id_klienta;
DROP SEQUENCE seq_id_klubu;
DROP SEQUENCE seq_id_lodki;
DROP SEQUENCE seq_id_modele;
DROP SEQUENCE seq_id_producenta;
DROP SEQUENCE seq_id_wlasciciela;
DROP SEQUENCE seq_nr_wypozyczenia;
DROP SEQUENCE seq_nr_faktury;

------------- usuwanie perspektyw -----------------

DROP VIEW view_info_lodki;
DROP VIEW view_kupno_lodki;
DROP VIEW view_lodki_do_wypozyczenia;
DROP VIEW view_dane_faktura;

------------- usuwanie procedur --------------------

DROP PROCEDURE pr_insert_wlasciciel;
DROP PROCEDURE pr_insert_lodka;
DROP PROCEDURE pr_insert_wypozyczenie;
DROP PROCEDURE pr_insert_klient;
DROP PROCEDURE pr_drop_klient;

------------- usuwanie funkcji --------------------

DROP FUNCTION func_zysk_od_dnia;
DROP FUNCTION func_zysk_lodka;
DROP FUNCTION func_ilosc_wpozyczen;