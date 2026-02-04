SELECT SUM(totalSpent) AS totalSold, empNum, (SELECT firstName FROM classicmodels.employees WHERE empNum = employeeNumber) AS name_
FROM (SELECT SUM(amount) AS totalSpent, p.customerNumber, customers.salesRepEmployeeNumber AS empNum
FROM payments AS p
LEFT JOIN customers
USING (customerNumber)
GROUP BY (p.customerNumber)) AS customerWithPayment
GROUP BY empNum
ORDER BY totalSold DESC
LIMIT 1;