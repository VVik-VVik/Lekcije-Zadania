Zadanie 1
Pobierz wszystkich klientów z miasta Warszawa.
SELECT * FROM customers WHERE city = "Warszawa" 

Zadanie 2
Pokaż listę wszystkich produktów z ceną większą niż 100.
SELECT * FROM products WHERE price > 100

Zadanie 3
Znajdź wszystkie zamówienia klienta o customer_id = 1.
SELECT * FROM orders WHERE customer_id = 1

Zadanie 4
Wyświetl nazwy produktów oraz ich kategorię (nazwa kategorii).
SELECT products.name, categories.category_name FROM products JOIN categories ON products.category = categories.category_id
  
Zadanie 5
Policz, ile produktów jest w każdej kategorii.
SELECT categories.category_name, COUNT(products.product_id) FROM products JOIN categories ON products.category=categories.category_id GROUP BY category

Zadanie 6
Znajdź klientów, którzy złożyli zamówienia na kwotę większą niż 1000.
SELECT customers.first_name, customers.last_name, orders.order_id, orders.total_amount FROM customers JOIN orders ON customers.customer_id=orders.customer_id WHERE orders.total_amount > 1000

Zadanie 7
Wyświetl zamówienia z datą i sumą kwoty zamówienia.
SELECT order_id, order_date, total_amount FROM orders

Zadanie 8
Pokaż wszystkie pozycje zamówień (order_items) wraz z nazwą produktu.
SELECT order_items.order_item_id, products.name FROM order_items JOIN products ON order_items.product_id = products.product_id
  
Zadanie 9
Wyświetl klientów i liczbę zamówień, jakie złożyli.
SELECT customers.first_name, customers.last_name, COUNT(orders.order_id) AS liczba FROM orders JOIN customers ON orders.customer_id = customers.customer_id ?????

Zadanie 10
Znajdź produkty, których cena jest poniżej średniej ceny wszystkich produktów.
SELECT name, price FROM products WHERE price < (SELECT AVG(price) FROM products)
