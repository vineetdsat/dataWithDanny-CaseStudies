/*Q1 : What is the total amount each customer spent at the restaurant?*/ 
SELECT 
	customer_id, 
    sum(price)
FROM datawithdanny_casestudy.sales a JOIN datawithdanny_casestudy.menu b 
	on a.product_id = b.product_id
GROUP BY customer_id;
/*
A	76
B	74
C	36
*/

/*Q2 : How many days has each customer visited the restaurant?*/ 

SELECT 
	customer_id, 
    count(distinct order_date)
FROM datawithdanny_casestudy.sales
GROUP BY customer_id;
/*
A	4
B	6
C	2
*/

/*Q3 : What was the first item from the menu purchased by each customer?*/

SELECT 
	a.customer_id,
    a.order_date,
    b.product_name
FROM datawithdanny_casestudy.sales a JOIN datawithdanny_casestudy.menu b
	on a.product_id = b.product_id
GROUP BY a.customer_id
having a.order_date = min(a.order_date);

/*
A	2021-01-01	sushi
B	2021-01-01	curry
C	2021-01-01	ramen
*/

#Q4 : What is the most purchased item on the menu and how many times was it purchased by all customers?

CREATE TEMPORARY TABLE datawithdanny_casestudy.temp
SELECT
	b.product_name,
	count(a.product_id) AS count_p
FROM datawithdanny_casestudy.sales a JOIN datawithdanny_casestudy.menu b
	ON a.product_id = b.product_id
GROUP BY b.product_name
ORDER BY count_p DESC
LIMIT 1;


SELECT 
	a.customer_id,
    b.product_name,
    count(c.product_name) AS TimesOrdered
FROM datawithdanny_casestudy.sales a JOIN datawithdanny_casestudy.menu b JOIN datawithdanny_casestudy.temp c
	ON a.product_id = b.product_id 
    AND b.product_name = c.product_name
GROUP BY customer_id
ORDER BY TimesOrdered DESC;

/*
A	ramen	3
C	ramen	3
B	ramen	2
*/

#Q5 : Which item was the most popular for each customer?








