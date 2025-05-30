
use abhay;

select * from superstore;


desc superstore;


 # Q1:-queries for  KPI Cards: Sales, Profit, Quantity
 SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore;


# query for Sales by Sub-Category and Region
SELECT 
    `Sub-Category`,
    ROUND(SUM(CASE WHEN Region = 'Central' THEN Sales ELSE 0 END), 2) AS Central,
    ROUND(SUM(CASE WHEN Region = 'East' THEN Sales ELSE 0 END), 2) AS East,
    ROUND(SUM(CASE WHEN Region = 'South' THEN Sales ELSE 0 END), 2) AS South,
    ROUND(SUM(CASE WHEN Region = 'West' THEN Sales ELSE 0 END), 2) AS West,
    ROUND(SUM(Sales), 2) AS Total
FROM superstore
GROUP BY `Sub-Category`;
#3. query for Profit by Year and Quarter
SELECT 
    YEAR(`Order Date`) AS Year,
    QUARTER(`Order Date`) AS Quarter,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY YEAR(`Order Date`), QUARTER(`Order Date`)
ORDER BY Year, Quarter;


#query for Profit by Category (Pie)
SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category;


#query for Profit by region (Pie)

SELECT 
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region;


# Profit by Segment (Pie)
SELECT 
    Segment,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Segment;


#Profit by Sub-Category (Bar Chart)
SELECT 
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;



#Distinct States (for slicer)

SELECT DISTINCT State FROM superstore ORDER BY State;





