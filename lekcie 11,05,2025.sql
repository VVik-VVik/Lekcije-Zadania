inf_03_2024_06_09_SG.pdf
1. SELECT miejsce, liczbaDni FROM wycieczki WHERE cena < 1000;
2. SELECT lizbaDni, AVG(cena) AS sredniaCena FROM wycieczki GROUP BY LiczbaDni;
3. SELECT miejsce, nazwa FROM wycieczki JOIN zdjecia ON wycieczki.id=zdjecia.id WHERE cena > 500;
4. CREATE USER 'Ewa'@'localhost' IDENTIFIED BY 'Ewa!Ewa'; 

inf_03_2024_06_10_SG.pdf
1. SELECT COUNT(*), pencja FROM pracownicy GROUP BY pensja ORDER BY pencja DESC;
-- SELECT COUNT(*) AS liczba_pracownikow, GROUP_CONCAT(nazwisko SEPARATOR ', ') AS nazwisko, pencja FROM pracownicy GROUP BY pensja ORDER BY pensja DESC;
2. SELECT pracownicy.imie, pracownicy.nazwisko, stanowiska.nazwa FROM pracownicy JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id WHERE staz > 10;
3. SELECT nazwisko, pencja FROM pracownicy WHERE staz BETWEEN 10 AND 20;
4. ALTER TABLE stanowiska ADD minPensja INT;

inf_03_2024_06_11_SG.pdf
1. SELECT imie, miot FROM swinki WHERE data_ur LIKE '%-07-%';
2. SELECT DISTINKT swinki.data_ur, swinki.miot, rasy.rasa FROM swinki JOIN rasy ON swinki.rasy_id=rasy.id WHERE rasy_id = 1;
3. SELECT imie, cena, opis FROM swinki WHERE rasy_id = 1;
4. SELECT rasa FROM rasy;

inf_03_2024_06_12_SG.pdf
1. SELECT imie, pensja FROM pracownicy WHERE staz < 5;
2. SELECT AVG(pracownicy.pensja), stanowiska.nazwa FROM pracownicy JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id GROUP BY stanowiska.nazwa;
3. SELECT imie, nazwisko, pensja FROM pracownicy WHERE (SELECT MAX(pensja) FROM pracownicy) LIMIT 1;
4. UPDATE pracownicy SET staz = staz + 1;

 studenci.sql
Zadanie 7: Ile unikalnych nazwisk znajduje się w bazie?
  SELECT COUNT(DISTINCT nazwisko) AS unikalne_nazwisko FROM studenci;
Zadanie 8: Lista studentów, którzy mają to samo nazwisko.
  SELECT nazwisko, COUNT(*) AS licba_osob FROM studenci GROUP BY nazwisko HAVING COUNT(*) > 1;
Zadanie 9: Wybierz studentów, których imię zaczyna się na literę "M".
  SELECT * FROM studenci WHERE imie LIKE 'M%';
Zadanie 10: Znajdź 3 najrzadsze imiona.
  SELECT imie COUNT(DISTINCT imie) AS unuq FROM studenci LIMIT 3;
-- SELECT imie, COUNT(*) AS ile FROM studenci GROUP BY imie ORDER BY ile ASC LIMIT 3;
Zadanie 11: Policz liczbę studentów na każdym roku, tylko dla nazwisk zaczynających się na "K".
-- SELECT COUNT(*) AS ilosc FROM studenci WHERE nazwisko LIKE 'K%';
Zadanie 12: Sprawdź czy w bazie znajdują się studenci, którzy mają takie same nazwisko i imię, np. Adam Adam.
  SELECT * FROM studenci WHERE imie=nazwisko;
Zadanie 13: Znajdź studentów, którzy są na 2, 3 lub 4 roku i mają adres w domenie onet.pl.
  SELECT * FROM studenci WHERE rok_studiow "2,3,4" HAVING email LIKE '%onet.pl';
Zadanie 14: Dodaj kolumnę "aktywny" (typu BOOLEAN), ustaw domyślnie na 1.
  ALTER TABLE studenci ADD aktywny BOOLEAN DEFAULT 1;
Zadanie 15: Zmień "aktywny" na 0 dla studentów na 5 roku.
  UPDATE studenci SET aktywny = 0 WHERE rok_studiow = 5; 
Zadanie 16: Usuń wszystkich studentów z roku 1, których nazwisko zaczyna się na "Z".
  DELETE FROM studenci WHERE rok_studiow=1 HAVING nazwisko LIKE 'Z%';
--DELETE FROM studenci WHERE rok_studiow=1 AND nazwisko LIKE 'Z%';
Zadanie 17: Zmień wszystkie nazwiska na wielkie litery.
  UPDATE studenci SET nazwisko = UPPER(nazwisko);
Zadanie 17.1: Zmień wszystkie nazwiska na maly litery.
  UPDATE studenci SET nazwisko = LOWER(nazwisko);
Zadanie 17.2: Zmień wszystkie nazwiska zaczynaly na wielky litera.
  UPDATE studenci SET nazwisko = LOWER(nazwisko);
Zadanie 18: Dodaj kolumnę data_dodania i ustaw ją na aktualną datę.
  ALTER TABLE studenci ADD data_dodania CURRENT_DATE;
-- ALTER TABLE studenci ADD COLUMN data_dodania = CURRENT_DATE;
Zadanie 19: Wyszukaj studentów, których nazwisko kończy się na "ski" lub "ska"
  SELECT * FROM studenci WHERE nazwisko LIKE '%ski' OR nazwisko LIKE '%ska';
Zadanie 20: Usuń kolumnę aktywny z tabeli.
  ALTER TABLE studenci DROP COLUMN aktywny;
