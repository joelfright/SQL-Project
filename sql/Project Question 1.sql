--1.1
SELECT c.CustomerID, c.CompanyName, c.Address, CONCAT(c.City, ', ',c.Country) AS "City & Country", c.PostalCode, c.Region
FROM Customers c
WHERE c.City = 'Paris' OR c.City = 'London'

--1.2
SELECT p.ProductID, p.ProductName FROM Products p
WHERE CHARINDEX('bottles',p.QuantityPerUnit) > 0

--1.3
SELECT p.ProductID, p.ProductName , s.CompanyName AS "Supplier Name", s.Country FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE CHARINDEX('bottles',p.QuantityPerUnit) > 0

--1.4
SELECT c.CategoryName, COUNT(*) AS "Num of Products" FROM Products p 
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID, c.CategoryName ORDER BY "Num of Products"

--1.5
SELECT CONCAT(e.TitleOfCourtesy , ' ' , e.FirstName , ' ' , e.LastName) AS "Name", e.City FROM Employees e
WHERE e.Country = 'UK'

--1.6
SELECT ROUND(SUM((od.Quantity*od.UnitPrice)*(1-od.Discount)),2) AS "Sales Totals" FROM Territories t
INNER JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
INNER JOIN Employees e ON et.EmployeeID = e.EmployeeID
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
GROUP BY t.RegionID HAVING ROUND(SUM((od.Quantity*od.UnitPrice) * (1-od.Discount)),2) > 1000000

--1.7
SELECT COUNT(*) AS "Num of Orders w/ +100 Freight & from UK or USA" FROM Orders o 
WHERE o.Freight > 100 AND (o.ShipCountry = 'UK' OR o.ShipCountry = 'USA')

--1.8
SELECT TOP 1 o.OrderID,od.Discount FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
ORDER BY od.Discount DESC

SELECT * FROM Region