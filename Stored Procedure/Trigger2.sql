select * from TransactionsTable
select * from ITEM
select * from CustomerAndSuppliersTable

/*INSERT CustomerAndSuppliersTable

(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) VALUES 
('C18108','Tohid','Islam','Laxmipur','01725028388','Rajshahi',10,2)


INSERT TransactionsTable

(tran_id,item_id,cust_id,tran_type,tran_quantity) VALUES 
('T123456788','P18108','C18108','O','1') */

/*create TRIGGER update_item on TransactionsTable FOR INSERT

as

BEGIN

DECLARE @item_id char(6),@tranamount int, @tran_type char(1)

select @item_id = item_id, @tranamount=tran_quantity, @tran_type=tran_type from inserted

if (@tran_type='S')

    UPDATE ITEM set item_qoh=item_qoh-@tranamount where item_id = @item_id

    ELSE

    UPDATE ITEM SET item_qoh = item_qoh +@tranamount where item_id=@item_id
END

CREATE TRIGGER tgr_test1 on ITEM for INSERT

AS

BEGIN

PRINT 'Data Inserted in ITEM Table'

END*/


create TRIGGER update_CustomerAndSupplier on TransactionsTable FOR INSERT

AS

BEGIN

DECLARE @custid char(6), @tranamnt int, @trantype char(1)

select @custid = cust_id, @tranamnt = tran_quantity, @trantype = tran_type from inserted

if (@trantype='S')

    update CustomerAndSuppliersTable set sales_amnt = sales_amnt+ @tranamnt where cust_id = @custid

    ELSE

    UPDATE CustomerAndSuppliersTable set proc_amnt = @tranamnt + ITEM.item_price where cust_id = @cust_id
END

