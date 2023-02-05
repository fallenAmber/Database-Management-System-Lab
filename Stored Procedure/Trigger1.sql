create TRIGGER update_Test on TransactionsTableTest FOR INSERT

AS

BEGIN

DECLARE @cust_id char(6), @tranamnt int, @trantype char(1), @tranprice FLOAT(12)

select @cust_id = cust_id, @tranamnt = tran_quantity, @trantype = tran_type, @tranprice = tran_price from inserted

if (@trantype='S')

    update CustomerAndSuppliersTable set sales_amnt = sales_amnt+(@tranamnt*@tranprice) where cust_id = @cust_id

    ELSE

    UPDATE CustomerAndSuppliersTable set proc_amnt = proc_amnt+(@tranamnt*@tranprice) where cust_id = @cust_id
END


CREATE TABLE TransactionsTableTest
(
tran_id CHAR(10) PRIMARY KEY CHECK (tran_id LIKE '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id CHAR(6) foreign key references ITEM(item_id),
cust_id CHAR(6) foreign key references CustomerAndSuppliersTable(cust_id),
tran_type CHAR (1) check(tran_type like '[SO]'),
tran_quantity int check (tran_quantity>=0),
tran_price FLOAT(12) check (tran_price>=0),
tran_date datetime default(GETDATE())
)



select * from TransactionsTableTest

INSERT TransactionsTableTest
(tran_id,item_id,cust_id,tran_type,tran_quantity, tran_price) VALUES 
('T123456789','P18107','C18108','S','1', 10)

INSERT TransactionsTableTest
(tran_id,item_id,cust_id,tran_type,tran_quantity, tran_price) VALUES 
('T123456788','P18107','C18108','O','1', 15)

select * from TransactionsTableTest
select * from ITEM
select * from CustomerAndSuppliersTable