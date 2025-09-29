USE classicmodels;
# Part 3 Aggrigates & Grouping ________________________
#------------------------------------------------------
#1.Count how many customers each country has.
#Code---
SELECT COUNT(customerNumber),country
FROM customers
GROUP BY country
ORDER BY country ASC;

#---------------------------------------------------------
#2.Find the total sales amount for each customer.
#Code---
SELECT c.customerName,o.customerNumber,SUM(od.quantityOrdered * od.priceEach) As Total_Sales
FROM orders o
INNER JOIN
customers c
ON c.customerNumber = o.customerNumber
INNER JOIN 
orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber
ORDER BY customerNumber ASC;

#----------------------------------------------------------------------
#3.Show the average credit limit per country.
#Code---
SELECT Country,ROUND(avg(CAST(creditlimit AS FLOAT)),2) AS avg_credit_limit
FROM customers
GROUP BY country;

#----------------------------------------------------------------------
#4.Find the maximum payment amount per customer.
#Code---
SELECT DISTINCT customerNumber,max(amount) AS Max_amount
FROM payments
GROUP BY customerNumber
ORDER BY Max_amount DESC;

#----------------------------------------------------------------------
#5.Count the number of products in each product line.
#Code---
SELECT productLine,count(productLine)
 FROM products
 GROUP BY productLine;
 
 #----------------------------------------------------------------------
#6.Find which employee manages the most customers.
#Code---
SELECT DISTINCT salesRepEmployeeNumber,count(customerNumber) AS Most_handled_customer
FROM customers 
GROUP BY salesRepEmployeeNumber
ORDER BY Most_handled_customer DESC;