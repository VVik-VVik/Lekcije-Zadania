Wyświetl wszystkich pracowników zatrudnionych po 1 stycznia 2021 roku.
1 SELECT * FROM pracownicy WHERE data_zatrudnienia > '2021-01-01';
Wyświetl wszystkich pracowników z działu "IT".
2.0 SELECT * FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu=dzialy.id_dzialu WHERE dzialy.nazwa_dzialu = 'IT';
2.1 SELECT * FROM pracownicy WHERE id_dzialu = 1;
Wyświetl imiona i nazwiska wszystkich pracowników, którzy zarabiają więcej niż 8000.
3 SELECT imie, nazwisko, pensja FROM pracownicy WHERE pensja > 8000;
Wyświetl średnią pensję w firmie.
4.0 SELECT AVG(pensja) AS srednia_pensja FROM pracownicy;
4.1 SELECT FORMAT(AVG(pensja),2) AS srednia_pensja FROM pracownicy;
Wyświetl wszystkich pracowników, którzy pracują dłużej niż 2 lata.
5 SELECT * FROM pracownicy WHERE data_zatrudnienia <= CURDATE() -INTERVAL 2 YEAR;
Znajdź pracowników, którzy pracują w dziale "Marketing" i zarabiają więcej niż 7000.
7  SELECT * FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu=dzialy.id_dzialu WHERE dzialy.nazwa_dzialu = 'Marketing' AND pensja > 7000;
Wyświetl pracowników, którzy zakończyli pracę nad projektem "Projekt A".
8.0 SELECT * FROM pracownicy JOIN projekty ON pracownicy.id_pracownika=projekty.id_projektu WHERE projekty.nazwa_projektu = 'Projekt A';
8.1 SELECT * FROM pracownicy JOIN projekty ON pracownicy.id_pracownika=projekty.id_projektu WHERE projekty.data_zakonczania IS NOT NULL AND projekty.nazwa_projektu='Projekt A';
Wyświetl wszystkie projekty, które nie zostały jeszcze zakończone.
9 SELECT * FROM pracownicy JOIN projekty ON pracownicy.id_pracownika=projekty.id_projektu WHERE projekty.data_zakonczania IS NULL;
Wyświetl najstarszego stażem w firmie pracownika.
10 SELECT imie, nazwisko, data_zatrudnienia FROM pracownicy ORDER BY data_zatrudnienia LIMIT 1;
Wyświetl dane o pracownikach z działu "IT", którzy zarabiają więcej niż 9000.
11 SELECT * FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu=dzialy.id_dzialu WHERE dzialy.nazwa_dzialu = 'IT' AND pensja > 9000;
Policz pracowników w firmie.
12.0 SELECT COUNT(*) FROM pracownicy;
12.1 SELECT COUNT(*) AS ilosc FROM pracownicy;
Policz łączną pensję wszystkich pracowników w dziale "Księgowość".
13 SELECT SUM(pracownicy.pensja) FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu=dzialy.id_dzialu WHERE dzialy.nazwa_dzialu = 'Księgowość';
Wyświetl pracowników, którzy mają pensję w przedziale od 7000 do 9000.
14 SELECT * FROM pracownicy WHERE pensja BETWEEN 7000 AND 9000;
Wyświetl średnią pensję w każdym dziale.
15.0 SELECT dzialy.nazwa_dzialu, FORMAT(AVG(pracownicy.pensja),2) AS srednie FROM pracownicy JOIN dzialy ON pracownicy.id_dzialu=dzialy.id_dzialu GROUP BY dzialy.nazwa_dzialu;
15.1 SELECT dzialy.nazwa_dzialu, FORMAT(AVG(pracownicy.pensja),2) AS srednie FROM dzialy JOIN pracownicy ON dzialy.id_dzialu=pracownicy.id_dzialu GROUP BY pracownicy.id_dzialu;

inf_03_2024_01_04_SG.pdf
terminarz
1.0 SELECT DISTINCT wpis FROM zadania WHERE dataZadania BETWEEN '2020-07-01' AND '2020-07-07';
1.1 SELECT DISTINCT wpis FROM zadania WHERE dataZadania BETWEEN '2020-07-01' AND '2020-07-07' AND wpis != '';
1.2 SELECT DISTINCT wpis FROM zadania WHERE dataZadania BETWEEN '2020-07-01' AND '2020-07-07' AND wpis IS NOT NULL;
2.0 SELECT dataZadania, wpis FROM zadania WHERE miesiac = 'lipiec';
2.1 SELECT dataZadania, wpis FROM zadania WHERE MONTH(dataZadania) = 7;
3 SELECT miesiac, wpis FROM zadania WHERE wpis LIKE 'S%';
4 UPDATE zadania SET wpis = 'Wycieczka nad morze' WHERE dataZadania = '2020-07-18';

inf03_2024_06_01_SG
motory
1 SELECT nazwa FROM wycieczki WHERE poczatek ='Muszyna' OR poczatek ='Wieliczka';
2.0 SELECT wycieczki.nazwa, wycieczki.opis, wycieczki.poczatek FROM wycieczki JOIN zdjecia ON wycieczki.zdjecia_id=zdjecia.id;
2.1 SELECT wycieczki.nazwa, wycieczki.opis, wycieczki.poczatek, zdjecia.zrodlo FROM wycieczki JOIN zdjecia ON zdjecia_id = zdjecia.id;
3 SELECT COUNT(*) AS liczbe FROM wycieczki;
4 ALTER TABLE wycieczki ADD COLUMN ocena INT;

inf_03_2024_06_02_SG.pd
chat
1 INSERT INTO logowanie (id, nick, haslo) VALUES (3, 'Jeremi', 'Jer123');
2.0 SELECT ROUND(AVG(rokUr)) AS 'Średni rok urodzenia' FROM uczestnicy;
2.1 SELECT FLOOR(AVG(rokUr)) AS 'Średni rok urodzenia' FROM uczestnicy;
3.0 SELECT uczestnicy.imie, uczestnicy.nazwisko, logowanie.haslo FROM uczestnicy JOIN logowanie ON uczestnicy.logowanie_id=logowanie.id WHERE uczestnicy.imie LIKE 'J%';
3.1 SELECT imie, nazwisko, nick, haslo FROM uczestnicy JOIN logowanie ON uczestnicy.logowanie_id = logowanie.id WHERE imie LIKE "J%"
4 CREATE USER 'uczestnik'@'lokalhost' IDENTIFIED BY 'Ucz123&';
5 GRANT SELECT, UPDATE ON chat.uczestnicy TO 'uczestnik'@'lokalhost';

SELECT user FROM mysql.user;
SHOW GRANTS FOR 'uczestnik'@'lokalhost';

inf_03_2024_01_05_SG.pdf
salon
1 SELECT nazwa, cena FROM uslugi WHERE cena >= 50;
2 SELECT AVG(cena), COUNT(id) FROM uslugi WHERE rodzaj = 1 GROUP BY rodzaj;
3 CREATE USER 'kosmetyczka'@'lokalhost' IDENTIFIED BY 'Kosmet34';
4 GRANT SELECT, UPDATE ON salon.uslugi TO 'kosmetyczka'@'localhost';

inf_03_2024_01_06_SG.pdf

1 SELECT nazwaPliku, podpis FROM zdjecia ORDER BY podpis ASC;
2 SELECT cel, dataWyjazdu FROM wycieczki WHERE dostepna IS NOT TRUE; 
3 SELECT wycieczki.cel, wycieczki.cena, zdjecia.podpis FROM wycieczki JOIN zdjecia ON wycieczki.zdjecia_id = zdjecia.id WHERE wycieczki.cena > 1300;
4 DROP TABLE uzytkownik;

inf_03_2024_01_08_SG
fryzjer
1 SELECT imie, nazwisko, stanowisko FROM kadra WHERE stanowisko ='fryzjer' OR stanowisko = 'stylista';
2.0 SELECT COUNT(id) AS liczba, MAX(cena) AS cena FROM uslugi WHERE rodzaj = 2;
2.1 SELECT COUNT(*) AS liczba, MAX(cena) AS cena FROM uslugi WHERE rodzaj = 2;
3.0 SELECT uslugi.nazwa, kadra.imie FROM uslugi JOIN kadra ON uslugi.kadra_id=kadra.id WHERE uslugi.rodzaj =2;
3.1 SELECT uslugi.nazwa, kadra.imie FROM uslugi JOIN kadra ON uslugi.kadra_id = kadra.id WHERE uslugi.rodzaj IN(2,3);
4 ALTER TABLE uslugi ADD COLUMN opinia TEXT;

inf_03_2024_06_03_SG.pdf
rzeki
1 SELECT nazwa, rzeka, stanAlarmowy, stanOstrzegawczy FROM wodowskazy;
2 SELECT wodowskazy.nazwa, wodowskazy.rzeka, wodowskazy.stanOstrzegawczy, wodowskazy.stanAlarmowy, pomiary.stanWody FROM wodowskazy JOIN pomiary ON wodowskazy.id=pomiary.wodowskazy_id WHERE pomiary.dataPomiaru = '2022-05-05';
3 SELECT wodowskazy.nazwa, wodowskazy.rzeka, wodowskazy.stanOstrzegawczy, wodowskazy.stanAlarmowy, pomiary.stanWody FROM wodowskazy JOIN pomiary ON wodowskazy.id=pomiary.wodowskazy_id WHERE pomiary.dataPomiaru = '2022-05-05' AND pomiary.stanWody > wodowskazy.stanOstrzegawczy;
4 SELECT dataPomiaru, AVG(stanWody) FROM pomiary GROUP BY dataPomiaru;

inf_03_2024_06_06_SG
konferencja
1 SELECT imie, nazwisko, koszt FROM uczestnicy WHERE zaplacono = 0;
2 SELECT AVG(koszt) AS 'Sredni koszt', SUM(koszt) AS 'Calkowity koszt', COUNT(*) AS 'Liczba uczestnikow' FROM uczestnicy;
3 SELECT wyklady.nazwa, uczestnicy.nazwisko, uczestnicy.email FROM uczestnicy JOIN wyklady ON uczestnicy.wyklady_id=wyklady.id WHERE uczestnicy.zaplacono = 1;
4 ALTER TABLE uczestnicy DROP COLUMN haslo;









