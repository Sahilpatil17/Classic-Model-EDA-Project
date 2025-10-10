
USE classicmodels;
# Part 1 Basic Exploration---------
#1. List all Customers from USA.
#Code---
SELECT * FROM classicmodels.customers;
SELECT customerName,customerNumber,country
 FROM customers WHERE country ='USA';
#---------------------------------------------------------------

#2. Show all products where stock is less than 500 units.
#Code---
SELECT * FROM classicmodels.products;
SELECT 
    productcode,productName,quantityInStock
FROM
    products
WHERE quantityInStock <= 500;
#----------------------------------------------------

#3.Find employees working in the Paris office.
#Code---
SELECT * FROM offices;  # offices table
SELECT * FROM employees; # employees Table

SELECT 
    e.firstName, e.lastName, o.city
FROM
    employees e
        INNER JOIN
    offices o ON e.officeCode = o.officeCode
WHERE
    city = 'Paris';
#---------------------------------------------
#4. Get orders with status = 'Cancelled'.
#Code---
SELECT * FROM orders;
SELECT 
    orderNumber, status
FROM
    orders
WHERE
    status = 'Cancelled';
#-----------------------------------------------------------------
#5.List all customers whose credit limit > 100000.
#Code----
SELECT * FROM customers;
SELECT 
    customerName,contactFirstName,creditLimit
FROM
    customers
WHERE
    creditLimit > 100000
ORDER BY creditLimit DESC;
#-----------------------------------------------------------
#6.Find customers who have no assigned sales representative.
SELECT CustomerNumber,CustomerName
FROM customers
WHERE salesRepEmployeeNumber IS NULL;
