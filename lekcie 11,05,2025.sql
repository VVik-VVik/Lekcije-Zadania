inf_03_2024_06_09_SG.pdf
1. SELECT miejsce, liczbaDni FROM wycieczki WHERE cena < 1000;
2. SELECT lizbaDni, AVG(cena) AS sredniaCena FROM wycieczki GROUP BY LiczbaDni;
3. SELECT miejsce, nazwa FROM wycieczki JOIN zdjecia ON wycieczki.id=zdjecia.id WHERE cena > 500;
4. CREATE USER 'Ewa'@'localhost' IDENTIFIED BY 'Ewa!Ewa'; 

inf_03_2024_06_10_SG.pdf
1. SELECT COUNT(*), pencja FROM pracownicy GROUP BY pensja ORDER BY pencja DESC;
// SELECT COUNT(*) AS liczba_pracownikow, GROUP_CONCAT(nazwisko SEPARATOR ', ') AS nazwisko, pencja FROM pracownicy GROUP BY pensja ORDER BY pensja DESC;
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
