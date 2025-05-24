1. Wyświetl wszystkich studentów z kierunku "Informatyka".
SELECT studenci.imie, studenci.nazwisko, kierunki.nazwa FROM studenci JOIN kierunki ON studenci.kierunek_id = kierunki.id WHERE kierunki.nazwa = 'Informatyka'; 

2. Znajdź wszystkich studentów, którzy są na 1. roku studiów.
SELECT imie, nazwisko, rok_studiow FROM studenci WHERE rok_studiow = 1;
  
3. Policz ilu studentów przypisano do każdego kierunku.
SELECT kierunki.nazwa, COUNT(*) AS liczba_stu FROM studenci JOIN kierunki ON studenci.kierunek_id = kierunki.id GROUP BY kierunki.nazwa; 

4. Znajdź studentów, którzy mają ocenę 5.0.
SELECT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id WHERE ocena = 5;
SELECT DISTINCT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id WHERE oceny.ocena = 5;

5. Policz średnią ocenę z każdego przedmiotu.
SELECT AVG(ocena), przedmiot AS srednia_ocena FROM oceny GROUP BY przedmiot;
SELECT ROUND(AVG(ocena),2), przedmiot AS srednia_ocena FROM oceny GROUP BY przedmiot;

6. Wyświetl kierunki wraz z liczbą studentów i posortuj je malejąco.
SELECT kierunki.nazwa, COUNT(*) AS licba_stu FROM studenci JOIN kierunki ON kierunki.id= studenci.kierunek_id GROUP BY kierunki.nazwa ORDER BY licba_stu DESC;
  
7. Znajdź studentów ze średnią ocen powyżej 4.0.
SELECT studenci.imie, studenci.nazwisko, ROUND(AVG(oceny.ocena),2) AS srednia_ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id GROUP BY studenci.id HAVING AVG(oceny.ocena) > 4.0;
SELECT studenci.imie, studenci.nazwisko, ROUND(AVG(oceny.ocena),2) AS srednia_ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id GROUP BY studenci.id HAVING AVG(oceny.ocena) > 4.0 ORDER BY srednia_ocena DESC; 

8. Wyświetl trzech studentów z najwyższą średnią ocen.
SELECT studenci.imie, studenci.nazwisko, ROUND(AVG(oceny.ocena),2) AS srednia_ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id GROUP BY studenci.id ORDER BY srednia_ocena DESC LIMIT 3; 

9. Wyświetl średnią ocen z "Bazy danych" dla każdego kierunku.
SELECT kierunki.nazwa, ROUND(AVG(oceny.ocena),2) AS srednia_ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id JOIN kierunki ON kierunki.id=studenci.kierunek_id WHERE oceny.przedmiot='Bazy danych' GROUP BY kierunki.nazwa; 
  
10. Wyświetl studentów, którzy nigdy nie dostali oceny < 4.0.
-- SELECT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id=oceny.student_id WHERE oceny.ocena < 4 GROUP BY studenci.id;
-- SELECT studenci.id, studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id=oceny.student_id WHERE oceny.ocena NOT IN(SELECT ocena FROM oceny WHERE ocena < 4.0) GROUP BY studenci.id;
-- SELECT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id=oceny.student_id WHERE oceny.ocena NOT IN(SELECT ocena FROM oceny WHERE ocena > 4.0) GROUP BY ocena; 
-- SELECT imie, nazwisko FROM studenci WHERE NOT EXISTS (SELECT * FROM oceny WHERE oceny.student_id = studenci.id AND oceny.ocena < 4.0);
1. SELECT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id=oceny.student_id  WHERE NOT EXISTS (SELECT * FROM oceny WHERE oceny.student_id = studenci.id AND oceny.ocena > 4.0) GROUP BY studenci.id;
2. SELECT studenci.imie, studenci.nazwisko, GROUP_CONCAT(oceny.ocena ORDER BY oceny.ocena SEPARATOR ', ') AS oceny 
FROM studenci JOIN oceny 
ON oceny.student_id = studenci.id 
WHERE studenci.id NOT IN 
(SELECT oceny.student_id FROM oceny WHERE oceny.ocena < 4.0)
GROUP BY studenci.id, studenci.imie, studenci.nazwisko 
ORDER BY studenci.nazwisko, studenci.imie; 
  
11. Wyświetl przedmiot z najniższą średnią ocen.
SELECT przedmiot, ROUND(AVG(ocena),2) AS srednia_ocena FROM oceny GROUP BY przedmiot LIMIT 1;
-- SELECT kierunki.nazwa, ROUND(AVG(oceny.ocena),2) AS srednia_ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id JOIN kierunki ON kierunki.id=studenci.kierunek_id WHERE (SELECT MIN(ocena) FROM oceny) GROUP BY kierunki.nazwa LIMIT 1; 

12. Stwórz wiok o nazwie top_studenci, gdzie znajdą się studenci ze średnią ocen > 4.5.
CREATE VIEW top_studenci AS SELECT studenci.imie, studenci.nazwisko, ROUND(AVG(oceny.ocena),2) AS srednia FROM studenci JOIN oceny ON studenci.id=oceny.student_id GROUP BY studenci.id HAVING ROUND(AVG(oceny.ocena),2) > 4.5;

13. Wyświetl liczbę studentów na każdym roku dla danego kierunku.
SELECT kierunki.nazwa, studenci.rok_studiow, COUNT(*) AS licba FROM studenci JOIN kierunki ON studenci.kierunek_id=kierunki.id GROUP BY kierunki.nazwa, studenci.rok_studiow ORDER BY kierunki.nazwa, studenci.rok_studiow;

14. Wyświetl kierunek, rok studiów oraz średnią na danym roku z danego kierunku.
SELECT kierunki.nazwa, studenci.rok_studiow, ROUND(AVG(oceny.ocena), 2) AS srednia FROM studenci JOIN oceny ON studenci.id=oceny.student_id JOIN kierunki ON kierunki.id=studenci.kierunek_id 
GROUP BY kierunki.nazwa, studenci.rok_studiow ORDER BY kierunki.nazwa, studenci.rok_studiow;
  
15. Znajdź 5 najczęściej ocenianych przedmiotów.
SELECT przedmiot, COUNT(*) AS licba_ocen FROM oceny GROUP BY przedmiot ORDER BY licba_ocen DESC LIMIT 5;

16. Wyświetl studentów, którzy mają dokładnie 5 ocen.
SELECT studenci.imie, studenci.nazwisko, COUNT(oceny.id) AS licba_ocen FROM studenci JOIN oceny ON studenci.id=oceny.student_id GROUP BY studenci.id HAVING COUNT(oceny.id) = 5;

17. Wyświetl wszystkich studentów bez żadnej oceny.
SELECT studenci.imie, studenci.nazwisko, COUNT(oceny.id) AS licba_ocen FROM studenci JOIN oceny ON studenci.id=oceny.student_id WHERE oceny.id = NULL GROUP BY studenci.id;

18. Wyświetl przedmiot, który ma największy rozrzut ocen (MAX - MIN).
SELECT przedmiot, MAX(ocena) - MIN(ocena) AS rozrzut FROM oceny GROUP BY przedmiot ORDER BY rozrzut DESC LIMIT 1;

19. Znajdź studentów, którzy mają przynajmniej jedną ocenę z każdego przedmiotu.
SELECT studenci.imie, studenci.nazwisko, oceny.ocena FROM studenci JOIN oceny ON studenci.id = oceny.student_id GROUP BY studenci.id HAVING COUNT(DISTINCT oceny.przedmiot) = (SELECT COUNT(DISTINCT przedmiot) FROM oceny);

20. Dla każdego roku studiów podaj średnią ocenę studentów.
SELECT studenci.rok_studiow, ROUND(AVG(oceny.ocena), 2) AS licba FROM studenci JOIN oceny ON studenci.id=oceny.student_id GROUP BY studenci.rok_studiow ORDER BY studenci.rok_studiow;


