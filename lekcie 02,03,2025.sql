-- malarz
SELECT kolor, cena, pojemnosc FROM farby WHERE kolor='czerwony';
SELECT kolor, cena/pojemnosc AS 'cena jednostkowa' FROM farby;
SELECT farby.kolor, malowanie.liczba_puszek FROM farby JOIN malowanie ON malowanie.id_farby=farby.id_farby WHERE malowanie.id_pomieszczenia=3;
CREATE VIEW pomieszcenie1 AS SELECT id_sciany, id_farby, liczba_puszek FROM malowanie WHERE id_pomieszczenia = 1;

-- wynajem
SELECT * FROM pokoje;
SELECT id_pok, sezon FROM rezerwacje WHERE liczba_dn > 7;
-- SELECT id_pok, sezon, liczba_dn FROM rezerwacje WHERE liczba_dn > 7;
SELECT SUM(liczba_dn) AS sum_dni FROM rezerwacje WHERE sezon = 'zima';
-- poprawnie
-- SELECT SUM(liczba_dn) FROM rezerwacje WHERE sezon = 'zima';
UPDATE rezerwacje SET liczba_dn =4 WHERE liczba_dn <4;
CREATE USER 'najemca' IDENTIFIED BY 'n@JEM1@!';

-- kwiaciarnia
SELECT nazwa, ulica FROM kwiaciarnie WHERE miasto = 'Malbork';
SELECT id_kwiaciarni, COUNT(id_zam) FROM zamowienia GROUP BY id_kwiaciarni;
SELECT kwiaciarnie.nazwa, kwiaciarnie.miasto, zamowienia.kwiaty FROM zamowienia JOIN kwiaciarnie ON kwiaciarnie.id_kwiaciarni=zamowienia.id_kwiaciarni WHERE data = '2017-01-07';
-- poprawnie
SELECT kwiaciarnie.nazwa, kwiaciarnie.miasto, zamowienia.kwiaty FROM kwiaciarnie JOIN zamowienia ON kwiaciarnie.id_kwiaciarni=zamowienia.id_kwiaciarni WHERE zamowienia.data = '2017-01-07';
CREATE TABLE `klienci` (
  `id_klienci` int(10) UNSIGNED NOT NULL,
  `imie` varchar(15) DEFAULT NULL,
  `nazwisko` varchar(15) DEFAULT NULL,
  `rabat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- poprawnie 
CREATE TABLE `klienci` (
  `id` int primary key AUTO_INCREMENT NOT NULL,
  `imie` varchar(15),
  `nazwisko` varchar(15),
  `rabat` int unsigned
);

-- egzamin3
SELECT id, dataWyjazdu, cel, cena FROM wycieczki WHERE dostepna = 1;
SELECT nazwaPliku, podpis FROM zdjecia ORDER BY podpis DESC;
SELECT wycieczki.cel, wycieczki.cena, zdjecia.podpis FROM wycieczki JOIN zdjecia ON wycieczki.id=zdjecia.id WHERE wycieczki.cena > 1200; 
ALTER TABLE wycieczki ADD COLUMN liczbaDni INT UNSIGNED AFTER dataWyjazdu;

-- kalendarz
SELECT dataZadania, wpis FROM zadania WHERE miesiac = 'sierpien';
SELECT miesiac, rok FROM zadania WHERE dataZadania = '2020-08-07';
SELECT miesiac, COUNT(wpis) FROM zadania WHERE wpis LIKE 'Weterynarz%' GROUP BY miesiac;
UPDATE zadania SET wpis = 'Wycieczka: Zalew Mietkowski' WHERE dataZadania = '2020-08-09';

-- sklep
SELECT nazwa FROM towary WHERE promocja = 1;
SELECT cena FROM towary WHERE nazwa = 'Markery 4 szt.';
SELECT dostawcy.id, dostawcy.nazwa, COUNT(towary.id) AS liczba_towarow FROM dostawcy JOIN towary ON dostawcy.id=towary.idDostawcy GROUP BY towary.idDostawcy;
ALTER TABLE dostawcy ADD informacje TEXT;

-- sklep
SELECT nazwa, cena FROM towary LIMIT 4;
SELECT cena FROM towary WHERE nazwa = 'Ekierka';
UPDATE dostawcy SET nazwa='Artykuly szkolne' WHERE id = 2;
SELECT promocja, COUNT(*) AS podsumowanie FROM towary GROUP BY promocja;
