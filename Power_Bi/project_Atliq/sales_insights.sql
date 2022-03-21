-- SHOW TABLES;
-- SELECT * FROM customers;
-- SELECT * FROM products;
-- SELECT * FROM date;
-- SELECT * FROM markets;
SELECT * FROM transactions;

SELECT count(*) FROM sales.transactions;
SELECT count(*) FROM sales.customers;

SELECT * FROM sales.markets;
SELECT * FROM sales.transactions LIMIT 5;
SELECT count(*) FROM sales.transactions WHERE market_code = 'Mark001';

SELECT * FROM sales.transactions having currency = 'USD';

SELECT sales.transactions.sales_amount FROM sales.transactions WHERE currency = 'USD';

SELECT 
	sales.transactions.*,
    sales.date.* 
FROM sales.transactions
INNER JOIN sales.date
	ON sales.transactions.order_date = sales.date.date
HAVING sales.transactions.currency = 'USD';

SELECT 
	sales.date.year,
    SUM(sales.transactions.sales_amount) AS total_revenue
FROM sales.transactions
INNER JOIN sales.date
	ON sales.transactions.order_date = sales.date.date
GROUP BY sales.date.year;

SELECT 
	sales.date.year,
    SUM(sales.transactions.sales_amount) AS total_revenue
FROM sales.transactions
INNER JOIN sales.date
	ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 and sales.transactions.market_code = 'Mark001';


SELECT distinct product_code FROM sales.transactions WHERE sales.transactions.market_code = 'Mark001';

SELECT count(*) FROM sales.transactions WHERE sales_amount <= 0;

SELECT distinct(transactions.currency) FROM transactions;

SELECT count(*) FROM sales.transactions WHERE transactions.currency = 'INR\r'; 
SELECT count(*) FROM sales.transactions WHERE transactions.currency = 'USD\r';
SELECT count(*) FROM sales.transactions WHERE transactions.currency = 'INR'; 
SELECT count(*) FROM sales.transactions WHERE transactions.currency = 'USD'; 

SELECT * FROM sales.transactions WHERE transactions.currency = 'USD\r' or transactions.currency = 'USD'; 

