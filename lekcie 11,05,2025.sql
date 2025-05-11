inf_03_2024_06_09_SG.pdf
1. SELECT miejsce, liczbaDni FROM wycieczki WHERE cena < 1000;
2. SELECT lizbaDni, AVG(cena) AS sredniaCena FROM wycieczki GROUP BY LiczbaDni;
3. SELECT miejsce, nazwa FROM wycieczki JOIN zdjecia ON wycieczki.id=zdjecia.id WHERE cena > 500;
4. CREATE USER 'Ewa'@'localhost' IDENTIFIED BY 'Ewa!Ewa'; 

inf_03_2024_06_10_SG.pdf
1. SELECT COUNT(*), pencja FROM pracownicy GROUP BY pensja ORDER BY pencja DESC;
//
2. SELECT imie, nazwisko
3.
4.

