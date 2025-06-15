Zadanie 1
Pobierz wszystkich klientów z miasta Warszawa.
SELECT * FROM customers WHERE city "Warszawa"

Zadanie 2
Pokaż listę wszystkich produktów z ceną większą niż 100.
SELECT * FROM products WHERE price > 100

Zadanie 3
Znajdź wszystkie zamówienia klienta o customer_id = 1.
SELECT * FROM orders WHERE customer_id = 1

Zadanie 4
Wyświetl nazwy produktów oraz ich kategorię (nazwa kategorii).
SELECT name, category FROM products
  
Zadanie 5
Policz, ile produktów jest w każdej kategorii.
SELECT COUNT(*) FROM products GROUP BY category

Zadanie 6
Znajdź klientów, którzy złożyli zamówienia na kwotę większą niż 1000.
SELECT costomers.first_name, costomers.last_name, orders.order_id, orders.total_amount FROM costomers JOIN orders ON costomers.customer_id=orders.customer_id WHERE total_amound > 1000

Zadanie 7
Wyświetl zamówienia z datą i sumą kwoty zamówienia.
SELECT order_id, order_date, total_amount FROM orders

Zadanie 8
Pokaż wszystkie pozycje zamówień (order_items) wraz z nazwą produktu.
SELECT order_items.order_items_id, products.name FROM order_items JOIN products ON order_items.product_id = products.product_id

Zadanie 9
Wyświetl klientów i liczbę zamówień, jakie złożyli.
SELECT costomers.first_name, costomers.last_name, COUNT(orders.order_id) FROM costomers JOIN orders ON customers.customer_id = orders.customer_id

Zadanie 10
Znajdź produkty, których cena jest poniżej średniej ceny wszystkich produktów.
SELECT name, price FROM products WHERE price < (SELECT AVG(price) FROM products)
