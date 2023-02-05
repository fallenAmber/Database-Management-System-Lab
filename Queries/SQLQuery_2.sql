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

select * from customers
insert customers

(customer_id, first_name, last_name, total_sale) values ('C001','Tohrul','Amin', 50), ('C002','Abu','sayed',40), ('C003','Ahnaf','Abid', 10)

create table transactions

(

tran_id char(12) PRIMARY KEY (tran_id LIKE '[T][0-9][0-9][0-9]'),
tran_date DATETIME DEFAULT(getdate()),
customer_id CHAR(12) FOREIGN key REFERENCES customers(customer_id),
product_id char(12) FOREIGN key REFERENCES products (product_id),
quan_sold money CHECK(quan_sold>=0)

)