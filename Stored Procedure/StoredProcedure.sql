/*create database examprep

create table products
(

    product_id char(12) PRIMARY KEY CHECK (product_id like '[P][0-9][0-9][0-9]'),
    product_name varchar(12),
    unit_price money check(unit_price >=0),
    quantity_in_hand int

)

INSERT products

(product_id, product_name, unit_price, quantity_in_hand) values ('P001','Milk',10,2),('P002','Shampoo',40,2), ('P003','Perfume',150,2)

create table customers

(

    customer_id CHAR(12) PRIMARY key CHECK (customer_id like '[C][0-9][0-9][0-9]'),
    first_name char(12),
    last_name char(12),
    city CHAR(12) default 'Rajshahi',
    total_sale money CHECK (total_sale>=0)

)

insert customers

(customer_id, first_name, last_name, total_sale) values ('C001','Tohrul','Amin', 50), ('C002','Abu','sayed',40), ('C003','Ahnaf','Abid', 10)


create table transactions

(

tran_id char(12) PRIMARY KEY CHECK (tran_id like '[T][0-9][0-9][0-9]'),
tran_date DATETIME DEFAULT(getdate()),
customer_id CHAR(12) FOREIGN key REFERENCES customers(customer_id),
product_id char(12) FOREIGN key REFERENCES products (product_id),
quan_sold money CHECK(quan_sold>=0)

)*/


select * from Products
select * from Customers
select * from transactions


/*ALter proc transaction_check
As
Begin
	declare @quantity_sold int,@product_id char(4),@quantity_in_hand int;
	set @quantity_sold=10;
	set @product_id='P000';
	select	@quantity_in_hand=Quantity_in_hand from products where @product_id=@Product_id
	if @quantity_sold<=@quantity_in_hand
	Begin
		insert  transactions
		(Transaction_Id,Customer_id,Product_Id,Quantity_sold) values
		('T202','C100',@product_id,@quantity_sold);
		Update Products set	Quantity_in_hand = @quantity_in_hand-@quantity_sold  where @product_id=@Product_id
		print 'Transaction Successfull'
	End
	else
		print 'Transaction Can not be completed due to product shortage'
End

Execute transaction_check */

ALTER proc TEST
AS
BEGIN

declare @productid char(12), @quansold int, @quaninhand INT

set @quansold = 1;
set @productid = 'P001'

select @quaninhand = quantity_in_hand from products where product_id =@productid

if (@quaninhand>@quansold)

insert into transactions

(tran_id, customer_id, product_id, quan_sold) values ('T001', 'C001', @productid, @quansold)

ELSE

PRINT 'Transaction Can not be completed due to product shortage'

END

EXEC TEST










select * from products
select * from customers
select * from transactions





insert  products
(Product_Id,Product_name,Unit_price,quantity_in_hand) values
('P000','Pineapple',10,20);

insert  products
(Product_Id,Product_name,Unit_price,quantity_in_hand) values
('P001','Mango',50,10);


insert  Customers
(Customer_Id,First_name,Last_name,City,Total_sale_amount) values
('C100','Fahim','Karim','Chittagong',10)

insert  Customers
(Customer_Id,First_name,Last_name,City,Total_sale_amount) values
('C101','Sohel','Karim','Rajshahi',20)

