create table TRANSACTIONN

(

    tran_id CHAR(12) PRIMARY key CHECK (tran_id like '[T][0-9][0-9][0-9]'),
    tran_date date DEFAULT (GETDATE()),
    customer_id char(12) FOREIGN KEY REFERENCES customers(customer_id),
    product_id char(12) FOREIGN KEY REFERENCES products(product_id),
    quantity_sold int,

)

insert TRANSACTIONN

(tran_id, customer_id, product_id, quantity_sold) values ('T001','C001','P001',1), ('T002','C002','P002',2), ('T003','C003','P003',0)


select * from products
select * from customers
SELECT * from TRANSACTIONN