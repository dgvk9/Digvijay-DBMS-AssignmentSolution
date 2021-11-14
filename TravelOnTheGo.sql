
/* 1. Create table PASSENGER and PRICE */

CREATE TABLE PASSENGER
(
Passenger_Name varchar(20),
Category varchar(20),
Gender varchar(10),
Boarding_City varchar(20),
Destination_City  varchar(20),
Distance int,
Bus_Type varchar(20)
);

CREATE TABLE PRICE 
( 
Bus_Type varchar(20),
Distance int,
Price int
);

/* 2. Insert data into the tables */

INSERT INTO passenger VALUES ('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
INSERT INTO passenger VALUES ('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
INSERT INTO passenger VALUES ('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
INSERT INTO passenger VALUES ('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
INSERT INTO passenger VALUES ('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
INSERT INTO passenger VALUES ('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
INSERT INTO passenger VALUES ('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
INSERT INTO passenger VALUES ('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
INSERT INTO passenger VALUES ('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

INSERT INTO price VALUES ('Sleeper',350,770);
INSERT INTO price VALUES ('Sleeper',500,1100);
INSERT INTO price VALUES ('Sleeper',600,1320);
INSERT INTO price VALUES ('Sleeper',700,1540);
INSERT INTO price VALUES ('Sleeper',1000,2200);
INSERT INTO price VALUES ('Sleeper',1200,2640);
INSERT INTO price VALUES ('Sleeper',350,434);
INSERT INTO price VALUES ('Sitting',500,620);
INSERT INTO price VALUES ('Sitting',500,620);
INSERT INTO price VALUES ('Sitting',600,744);
INSERT INTO price VALUES ('Sitting',700,868);
INSERT INTO price VALUES ('Sitting',1000,1240);
INSERT INTO price VALUES ('Sitting',1200,1488);
INSERT INTO price VALUES ('Sitting',1500,1860);

/* 3. How many females and how many male passengers travelled for a minimum distance of  600 KMs? */

SELECT Gender, count(Gender) as Passenger_Count  FROM passenger where Distance > 599 group by Gender;

/* 4. Find the minimum ticket price for Sleeper Bus. */

SELECT min(price) as Minimum_Ticket_Price from price where Bus_Type = 'Sleeper';

/* 5. Select passenger names whose names start with character 'S' */

SELECT Passenger_Name from passenger where Passenger_Name like 'S%';

/* 6. Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output . */

SELECT Passenger_Name, Boarding_City, Destination_City, p.Bus_Type, m.Price
from passenger p
left join price m  on p.Bus_Type = m.Bus_Type and p.Distance = m.Distance;

/* 7. What is the passenger name and his/her ticket price who travelled in Sitting bus  for a 
distance of 1000 KMs */

SELECT Passenger_Name, Price AS Ticket_Price 
FROM passenger p, price m 
WHERE p.Bus_Type = m.Bus_Type
AND p.Distance = m.Distance
AND p.Distance >= 1000
AND p.Bus_Type = 'Sitting';

/* 8. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji? */

select Bus_Type, price from price 
where Distance = (select Distance from passenger 
where Boarding_City = 'Panaji'
and Destination_City = 'Bengaluru');

/* 9. List the distances from the "Passenger" table which are unique (non-repeated 
distances) in descending order.*/

select distinct(Distance) from passenger order by Distance desc;

/* 10. Display the passenger name and percentage of distance travelled by that passenger 
from the total distance travelled by all passengers without using user variables. */

SELECT Passenger_Name, (Distance / (select sum(Distance) from passenger)) * 100 AS 'Percentage_Distance'
FROM passenger group by Passenger_Name;

/* 11.  Display the distance, price in three categories in table Price 
a) Expensive if the cost is more than 1000 
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise
*/

SELECT Distance, Price, 
CASE
	WHEN Price > 1000 THEN 'Expensive'
    WHEN Price > 500 THEN 'Average Cost'
    ELSE 'Cheap'
END AS Price_Category
FROM Price;


