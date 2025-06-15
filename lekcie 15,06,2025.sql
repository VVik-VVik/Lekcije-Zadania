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
SELECT DISTINCT c.first_name, c.last_name, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 1000;

Zadanie 7
Wyświetl zamówienia z datą i sumą kwoty zamówienia.
SELECT order_id, order_date, total_amount FROM orders

Zadanie 8
Pokaż wszystkie pozycje zamówień (order_items) wraz z nazwą produktu.
SELECT order_items.order_item_id, products.name FROM order_items JOIN products ON order_items.product_id = products.product_id
  
Zadanie 9
Wyświetl klientów i liczbę zamówień, jakie złożyli.
SELECT customers.first_name, customers.last_name, COUNT(orders.order_id) AS liczba FROM orders JOIN customers ON orders.customer_id = customers.customer_id GROUP BY customers.customer_id

Zadanie 10
Znajdź produkty, których cena jest poniżej średniej ceny wszystkich produktów.
SELECT name, price FROM products WHERE price < (SELECT AVG(price) FROM products)

Zadanie 1.
Pokaż zamówienia z sumą wartości pozycji w zamówieniu, a następnie porównaj z wartością total_amount w tabeli orders.
SELECT orders.order_id, orders.total_amount, SUM(order_items.price*order_items.quantity) AS suma FROM orders JOIN order_items ON order_items.order_id=orders.order_id GROUP BY orders.order_id, orders.total_amount
Zadanie 2.
Wyświetl listę zamówień z nazwiskami klientów i datą zamówienia.
SELECT customers.last_name, orders.order_date FROM customers JOIN orders ON customers.customer_id=orders.customer_id
Zadanie 3.
Znajdź klientów, którzy kupili produkty z kategorii 'Elektronika'.
SELECT DISTINCT customers.customer_id, customers.first_name, customers.last_name
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
JOIN categories ON products.category = categories.category_id
WHERE categories.category_name = 'Elektronika';
Zadanie 4.
Znajdź średnią wartość zamówienia (total_amount).
SELECT FORMAT(AVG(total_amount),2) AS srednia FROM orders
Zadanie 5.
Wypisz klientów, którzy złożyli zamówienia w czerwcu 2025 roku.
SELECT customers.first_name, customers.last_name, GROUP_CONCAT(DATE(orders.order_date) SEPARATOR ', ') AS dates FROM customers JOIN orders ON customers.customer_id=orders.customer_id WHERE orders.order_date LIKE "2025-06%" GROUP BY customers.customer_id
SELECT customers.first_name, customers.last_name, GROUP_CONCAT(DATE(orders.order_date) SEPARATOR ', ') AS dates FROM customers JOIN orders ON customers.customer_id=orders.customer_id WHERE orders.order_date BETWEEN "2025-06-01" AND "2025-06-30" GROUP BY customers.customer_id
Zadanie 6.
Znajdź 5 najdroższych produktów.
SELECT * FROM products ORDER BY price DESC LIMIT 5
Zadanie 7.
Wyświetl produkty, których stan magazynowy jest mniejszy niż 20.
SELECT * FROM products WHERE stock_quantity < 20
Zadanie 8.
Znajdź kategorię z największą liczbą produktów.
SELECT categories.category_name, COUNT(*) AS produkt_count FROM products JOIN categories ON products.category=categories.category_id GROUP BY categories.category_name ORDER BY produkt_count DESC LIMIT 1
Zadanie 9.
Wyświetl klientów i sumę wartości ich zamówień.
SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS sum_zam FROM customers JOIN orders ON customers.customer_id=orders.customer_id GROUP BY customers.customer_id
Zadanie 10.
Pokaż, ile zamówień zostało złożonych w każdym dniu.
SELECT order_date, COUNT(order_id) AS sum_zam FROM orders GROUP BY order_date
Zadanie 11.
Wyświetl listę zamówień, które mają pozycje produktów o cenie powyżej 1000 zł.
SELECT orders.*, products.name, products.price FROM orders JOIN order_items ON orders.order_id=order_items.order_id JOIN products ON order_items.product_id=products.product_id WHERE products.price > 1000 
Zadanie 12.
Wypisz klientów, których nazwisko zaczyna się na literę 'K'.
SELECT last_name FROM customers WHERE last_name LIKE "K%"
Zadanie 13.
Znajdź produkty, których nazwa zawiera słowo "Laptop".
SELECT name FROM products WHERE name LIKE "Laptop%"
Zadanie 14.
Oblicz łączną wartość zamówień złożonych przez klienta o customer_id = 2.
SELECT SUM(total_amount) AS suma FROM orders WHERE customer_id = 2
Zadanie 15. 
Znajdź 5 produktów z największym stanem magazynowym.
SELECT * FROM products ORDER BY stock_quantity DESC LIMIT 5
Zadanie 16.
Wyświetl wszystkie kategorie posortowane alfabetycznie.
SELECT * FROM categories ORDER BY category_name
Zadanie 17.
Znajdź zamówienia z datą późniejszą niż 2025-06-15 i wyświetl ich kwoty.
SELECT * FROM orders WHERE order_date > "2025-06-15"
Zadanie 18.
Wyświetl klientów, których e-mail zawiera domenę "example.com".
SELECT first_name, last_name, email FROM customers WHERE email LIKE "%example.com"
Zadanie 19.
Znajdź produkty, których cena jest pomiędzy 100 a 500.
SELECT name, price FROM products WHERE price BETWEEN 100 AND 500
Zadanie 20.
Wyświetl 10 ostatnio złożonych zamówień z datą i klientem.
SELECT customers.first_name, customers.last_name, orders.order_date AS dates FROM customers JOIN orders ON customers.customer_id=orders.customer_id ORDER BY orders.order_date DESC  LIMIT 10
