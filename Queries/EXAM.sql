create database EXAM


create table products
(

    product_id char(12) PRIMARY KEY CHECK (product_id like '[P][0-9][0-9][0-9]'),
    product_name varchar(12) NOT NULL,
    manufacturer char(12) NOT NULL,
    origin char(12),
    price money check(price >=0),
    quantity_in_hand int

)

INSERT products

(product_id, product_name, manufacturer,origin, price, quantity_in_hand) values ('P001','Milk','Denis','Switzerland', 10,2),('P002','Shampoo','Sunsilk','India',40,2), ('P003','Perfume','Channel','France',150,2)


create table customers

(

    customer_id CHAR(12) PRIMARY key CHECK (customer_id like '[C][0-9][0-9][0-9]'),
    first_name char(12) NOT NULL,
    last_name char(12) NOT NULL,
    city CHAR(12) default 'Rajshahi',
    total_sale_quan int CHECK (total_sale_quan>=0)

)

insert customers

(customer_id, first_name, last_name, total_sale_quan) values ('C001','Tohrul','Amin', 1), ('C002','Abu','sayed',2), ('C003','Ahnaf','Abid', 3)


create table transactions

(

tran_id char(12) PRIMARY KEY CHECK (tran_id like '[T][0-9][0-9][0-9]'),
tran_date DATETIME DEFAULT(getdate()),
customer_id CHAR(12) FOREIGN key REFERENCES customers(customer_id),
product_id char(12) FOREIGN key REFERENCES products (product_id),
quan_sold int CHECK(quan_sold>=0),
amnt_paid money check(amnt_paid>=0)

)

create proc TEST @productid CHAR(12), @custid CHAR(12)

AS
BEGIN

DECLARE @totalsale int, @pricep money, @quaninhand INT

SELECT @totalsale = total_sale_quan from customers where customer_id=@custid
SELECT @quaninhand = quantity_in_hand, @pricep=price from products where product_id=@productid

if (@quaninhand>@totalsale)
    INSERT into transactions (tran_id,customer_id, product_id, quan_sold,amnt_paid)
    VALUES ('T111',@custid,@productid,@totalsale,@pricep)
    UPDATE products set quantity_in_hand = quantity_in_hand-@totalsale where product_id=@productid
END

EXEC TEST 'P001','C001'


SELECT * from products
SELECT * from customers
SELECT * from transactions


CREATE TRIGGER Tohid on transactions for INSERT
AS
BEGIN

DECLARE @productid CHAR(12), @custid CHAR(12), @quansold INT

SELECT @custid = customer_id, @productid=product_id, @quansold=quan_sold from inserted

--select @quaninhand = quantity_in_hand from products
--SELECT @totalsale = total_sale_quan from customers


if (@productid='P001')

    UPDATE products set quantity_in_hand = quantity_in_hand - @quansold where product_id=@productid

    UPDATE customers set total_sale_quan = total_sale_quan + @quansold WHERE customer_id =@custid

END



INSERT transactions

(tran_id,customer_id, product_id, quan_sold,amnt_paid) values ('T222','C001','P001', 1, 10)


select * from products
SELECT * from customers
SELECT * from transactions