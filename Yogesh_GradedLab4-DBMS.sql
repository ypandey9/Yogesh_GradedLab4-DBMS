
-- Note :- Created orders table in place of order becasue getting some issue to create with order name.


create database ecom_DB;
use ecom_DB;

create table supplier (
SUPP_ID int primary key,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50) not null
);

create table customer (
CUS_ID int primary key,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char
);

create table category(
CAT_ID int primary key,
CAT_NAME varchar(20) not null
);

create table product (
PRO_ID int primary key,
PRO_NAME varchar(20) not null default 'Dummy',
PRO_DESC varchar(60),
CAT_ID int ,
CONSTRAINT fk_category FOREIGN KEY (CAT_ID)  
REFERENCES category(CAT_ID)  
);


create table supplier_pricing (
PRICING_ID int primary key,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int default 0,
CONSTRAINT fk_product FOREIGN KEY (PRO_ID)  
REFERENCES product(PRO_ID) ,
CONSTRAINT fk_supplier FOREIGN KEY (SUPP_ID)  
REFERENCES supplier(SUPP_ID) 
);

create table orders (
ORD_ID int primary key,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
PRICING_ID int,
CONSTRAINT fk_customer FOREIGN KEY (CUS_ID)  
REFERENCES customer(CUS_ID) ,
CONSTRAINT fk_supplier_pricing FOREIGN KEY (PRICING_ID)  
REFERENCES supplier_pricing(PRICING_ID) 
);

create table rating
(
RAT_ID int primary key,
ORD_ID int ,
RAT_RATSTARS int not null,
CONSTRAINT fk_orders FOREIGN KEY (ORD_ID)  
REFERENCES orders(ORD_ID) 
);

insert into supplier(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE) values(1,		'Rajesh Retails',		'Delhi',		'1234567890');
insert into supplier(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE) values(2,		'Appario Ltd',		'Mumbai',	'2589631470');
insert into supplier(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE) values(3,		'Knome products',	'Banglore',	'9785462315');
insert into supplier(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE) values(4,		'Bansal Retails',		'Kochi',		'8975463285');
insert into supplier(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE) values(5,		'Mittal Ltd.',		'Lucknow',	'7898456532');



insert into customer(CUS_ID,	CUS_NAME,	CUS_PHONE,	CUS_CITY,	CUS_GENDER) values
(2,		'AMAN',		'9785463215',	'NOIDA',		'M'),
(3,		'NEHA',		'9999999999',	'MUMBAI',		'F'),
(4,		'MEGHA',	'9994562399',	'KOLKATA',		'F'),
(5,		'PULKIT',	'7895999999',	'LUCKNOW',		'M');



insert into category(CAT_ID,	CAT_NAME) values
(1,		'BOOKS'),
(2,		'GAMES'),
(3,		'GROCERIES'),
(4,		'ELECTRONICS'),
(5,		'CLOTHES');


insert into product(PRO_ID,	PRO_NAME,		PRO_DESC,								CAT_ID) values
(1,		'GTA V',			'Windows 7 and above with i5 processor and 8GB RAM',		2),
(2,		'TSHIRT',			'SIZE-L with Black, Blue and White variations',				5),
(3,		'ROG LAPTOP',		'Windows 10 with 15inch screen, i7 processor, 1TB SSD',		4),
(4,		'OATS',				'Highly Nutritious from Nestle',							3),
(5,		'HARRY POTTER',		'Best Collection of all time by J.K Rowling',				1),
(6,		'MILK',				'1L Toned MIlk',											3),
(7,		'Boat Earphones',	'1.5Meter long Dolby Atmos',								4),
(8,		'Jeans',			'Stretchable Denim Jeans with various sizes and color',		5),
(9,		'Project IGI',		'compatible with windows 7 and above',						2),
(10,	'Hoodie',			'Black GUCCI for 13 yrs and above',							5),
(11,	'Rich Dad Poor Dad', 'Written by RObert Kiyosaki',								1),
(12,	'Train Your Brain',	'By Shireen Stephen',										1);




insert into supplier_pricing(PRICING_ID,	PRO_ID,	SUPP_ID,	SUPP_PRICE) values
(1,		1,			2,	1500),
(2,		3,			5,	30000),
(3,		5,			1,	3000),
(4,		2,			3,	2500),
(5,		4,			1,	1000),
(6,		12,			2,	780),
(7,		12,			4,	789),
(8,		3,			1,	31000),
(9,		1,			5,	1450),
(10,	4,			2,	999),
(11,	7,			3,	549),
(12,	7,			4,	529),
(13,	6,			2,	105),
(14,	6,			1,	99),
(15,	2,			5,	2999),
(16,	5,			2,	2999);

insert into orders(ORD_ID,	ORD_AMOUNT,	ORD_DATE,	CUS_ID,PRICING_ID) values
(101,			1500,		'2021-10-06',	2,		1),
(102,			1000,		'2021-10-12',	3,		5),
(103,			30000,		'2021-09-16',	5,		2),
(104,			1500,		'2021-10-05',	1,		1),
(105,			3000,		'2021-08-16',	4,		3),
(106,			1450,		'2021-08-18',	1,		9),
(107,			789,		'2021-09-01',	3,		7),
(108,			780,		'2021-09-07',	5,		6),
(109,			3000,		'2021-09-10',	5,		3),
(110,			2500,		'2021-09-10',	2,		4),
(111,			1000,		'2021-09-15',	4,		5),
(112,			789,		'2021-09-16',	4,		7),
(113,			31000,		'2021-09-16',	1,		8),
(114,			1000,		'2021-09-16',	3,		5),
(115,			3000,		'2021-09-16',	5,		3),
(116,			99,		 	'2021-09-17',	2,		14);








insert into rating(RAT_ID,	ORD_ID,	RAT_RATSTARS) values
(1,		101,		4),
(2,		102,		3),
(3,		103,		1),
(4,		104,		2),
(5,		105,		4),
(6,		106,		3),
(7,		107,		4),
(8,		108,		4),
(9,		109,		3),
(10,	110,		5),
(11,	111,		3),
(12,	112,		4),
(13,	113,		2),
(14,	114,		1),
(15,	115,		1),
(16,	116,		0);



-- 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
 
 select count(c.cus_id) as No_of_customers,c.cus_gender from customer c
 inner join orders o on c.cus_id=o.cus_id where o.ord_amount>=3000
 group by c.cus_gender;
 
 --  4)	Display all the orders along with product name ordered by a customer having Customer_Id=2


 
 select ord.* ,prd.pro_name from orders ord 
 inner join supplier_pricing sp on sp.pricing_id=ord.pricing_id
 inner join product prd on prd.pro_id=sp.pro_id 
 inner join customer cus on cus.cus_id=ord.cus_id -- optional
 where ord.cus_id=2;



-- 5)	Display the Supplier details who can supply more than one product.



select *from supplier sp 
INNER join 
(
select supp_id,count(pro_id) as count from supplier_pricing
group by supp_id) as sup on sp.supp_id=sup.supp_id where sup.count>1;

-- 6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product



select ct.cat_id,ct.cat_name,min(t2.minPrice) from category ct 
inner join (
select prd.cat_id,prd.pro_name,t1.* from product prd 
inner join(
select sp.pro_id,min(sp.supp_price) as minPrice from Supplier_pricing sp group by sp.pro_id) as t1 on prd.pro_id=t1.pro_id)
as t2 on ct.cat_id=t2.cat_id
group by t2.cat_id;

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.


select prd.pro_id, prd.pro_name from orders  ord
inner join 
supplier_pricing sp on sp.pricing_id=ord.pricing_id
inner join product prd on prd.pro_id=sp.pro_id 
where ord.ord_date>'2021-10-05';


-- 8)	Display customer name and gender whose names start or end with character 'A'.

select CUS_NAME,CUS_GENDER from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';

-- 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.


delimiter &&
create procedure getDetails()
begin
select report.supp_id,
report.supp_name,
report.rating,
case when report.rating=5 then 'Excellent Service'
when report.rating>4 then 'Good Service'
when report.rating>2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service
from (select s.supp_id,s.supp_name,v.avg as rating from supplier s
inner join 
(
select sp.supp_id,avg(rt.rat_ratstars) as avg from orders ord
inner join rating rt on rt.ord_id=ord.ord_id
inner join supplier_pricing sp on sp.pricing_id=ord.pricing_id
group by sp.supp_id
)as v on v.supp_id=s.supp_id
) as report;
end 
&&

call getDetails();



