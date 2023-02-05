create PROCEDURE ITEM_RECORDDD

AS 
BEGIN
--select * from 

select item_category, sum(item_qoh), avg(item_price) from ITEM group by item_category
END

EXEC ITEM_RECORDDD