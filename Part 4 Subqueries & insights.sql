USE classicModels;
# Part 4: Subqueries & Insights--------
# 1. Find customers who made payments greater than the average payment.
#Code---
SELECT 
    c.customerName, c.customerNumber, round(p.amount) AS "More_than_AVG"
FROM
    customers c
        INNER JOIN
    payments p ON c.customerNumber = p.customerNumber
WHERE
    p.amount > (SELECT 
            AVG(amount)
        FROM
            payments);

#----------------------------------------------------------------------
# 2 List products that have never been ordered.
#Code---
SELECT 
    p.productCode, p.productName
FROM
    orderdetails o
        RIGHT JOIN
    products p ON p.productCode = o.productCode
WHERE
    p.productCode NOT IN (SELECT 
            productCode
        FROM
            orderdetails);

#-------------------------------------------------------------------------
# 3. Find the employee with the highest number of direct reports.
