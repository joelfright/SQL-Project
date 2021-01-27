--3.1
SELECT CONCAT(e.FirstName, ' ',e.LastName) AS "Name", 
    CONCAT(e2.FirstName, ' ',e2.LastName) AS "Reports To"
FROM Employees e 
LEFT JOIN Employees e2 ON e.ReportsTo = e2.EmployeeID

--3.2
SELECT s.CompanyName AS "Suppiler Name",
    ROUND(SUM((od.Quantity*od.UnitPrice)*(1-od.Discount)),2) AS "Total Sales"
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY s.SupplierID, s.CompanyName HAVING ROUND(SUM((od.Quantity*od.UnitPrice)*(1-od.Discount)),2) > 10000
ORDER BY "Total Sales"

--3.3
SELECT TOP 10 c.CustomerID, c.CompanyName, 
    ROUND(SUM((od.Quantity*od.UnitPrice)*(1-od.Discount)),2) AS "Total Spent" 
FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE (YEAR(o.OrderDate)) = 
(SELECT TOP 1 YEAR(o2.OrderDate) FROM Orders o2 ORDER BY YEAR(o2.OrderDate) DESC)
AND o.ShippedDate IS NOT NULL
GROUP BY c.CustomerID, c.CompanyName
ORDER BY "Total Spent" DESC

--3.4
SELECT CONCAT(MONTH(o.OrderDate), '/' ,YEAR(o.OrderDate)) AS "Month", 
    AVG(DATEDIFF(dd,o.OrderDate,o.ShippedDate)) AS "Avg Ship Time By Month" 
FROM Orders o
GROUP BY MONTH(o.OrderDate), YEAR(o.OrderDate)
ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate)

SELECT * FROM Orders o