USE Sales2
--Exercise 1
SELECT AVG(Cost) AS 'Cost of the sales'
FROM sales
--WHERE sales.Sdate  LIKE '1992%';
WHERE YEAR(SDATE)=1992;

--Exercise 2
SELECT Cname
FROM sales AS s
INNER JOIN  customers AS c ON s.Ccode=c.Ccode
INNER JOIN products AS p ON s.Pcode=p.Pcode
WHERE Pdescr LIKE '%HDD%'AND  Quant  BETWEEN 3 AND 7; 
--OR
SELECT customers.Cname
FROM sales,products,customers
WHERE sales.Pcode=products.Pcode AND sales.Ccode=customers.Ccode
AND Pdescr LIKE '%HDD%' AND Quant BETWEEN 3 AND 7;

--Exercise 3
SELECT Pdescr, AVG(Quant) AS 'Average pieces being sold'
FROM sales, products
WHERE sales.Pcode=products.Pcode
GROUP BY Pdescr;
--OR 
SELECT Pdescr, AVG(Quant) AS 'Average pieces being sold'
FROM sales
INNER JOIN  products ON  sales.Pcode=products.Pcode
GROUP BY Pdescr;

--Exercise 4
SELECT Sname, Scomm
FROM salesmen
WHERE Scomm >= 0.15 AND Scomm <= 0.18 AND  Scomm<>0.165;

--Exercise 5
SELECT Sname, COUNT(Sname)
FROM salesmen
INNER JOIN family ON salesmen.Scode=family.salesman
WHERE family.frelationship LIKE 'son'
GROUP BY Sname
HAVING COUNT(Sname)>=1 ;

--Exercise 6
SELECT products.Pcode, products.Pdescr, SUM(Quant * Cost) AS 'Total profit of each product'
FROM sales INNER JOIN  products ON sales.Pcode=products.Pcode
GROUP BY products.Pcode, products.Pdescr
HAVING SUM(Quant*Cost) > 1500;
--OR
SELECT products.Pcode, products.Pdescr, SUM(Quant * Cost) AS 'Total profit of each product'
FROM sales,products 
WHERE sales.Pcode=products.Pcode
GROUP BY products.Pcode, products.Pdescr
HAVING SUM(Quant*Cost) > 1500;