CREATE DATABASE chinook;
USE chinook;
USE Chinook;
SHOW TABLES;
SELECT * FROM track
LIMIT 10;
SELECT 
    t.Name AS Track_Name,
    SUM(il.Quantity) AS Total_Units_Sold
FROM invoiceline il
JOIN track t ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY Total_Units_Sold DESC
LIMIT 10;
SELECT 
    BillingCountry AS Region,
    ROUND(SUM(Total), 2) AS Total_Revenue
FROM invoice
GROUP BY BillingCountry
ORDER BY Total_Revenue DESC;
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    ROUND(SUM(Total), 2) AS Monthly_Revenue
FROM invoice
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;
SELECT
    BillingCountry AS Region,
    ROUND(SUM(Total), 2) AS Total_Revenue,
    RANK() OVER (ORDER BY SUM(Total) DESC) AS Revenue_Rank
FROM invoice
GROUP BY BillingCountry
ORDER BY Revenue_Rank;