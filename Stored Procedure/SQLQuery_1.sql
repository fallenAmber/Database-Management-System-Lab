create proc sp_updatePrice @titleid char(20)

as
BEGIN

DECLARE @price MONEY
select @price = price from titles where title_id = @titleid
set @price = @price + 0.1*@price
if @price <=20
update titles set price = @price where title_id = @titleid

END

exec sp_updatePrice 'BU7832';

call sp_updatePrice()