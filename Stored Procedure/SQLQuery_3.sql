/*alter PROCEDURE TEST2 @titleid char(15)

as 

select au_lname as "Authors Last name" from authors where au_id in (select au_id from titleauthor where title_id=@titleid)
--select * from authors

EXEC TEST2 'PS3333'*/

create procedure Update_Priceee @titleid char(15)

as

DECLARE @price money
select @price = price from titles where title_id=@titleid
set @price = @price + @price*0.1

if @price <=20
update titles set price = @price where title_id=@titleid


EXEC Update_Priceee 'BU2075'

select * from titles

select * from titles
