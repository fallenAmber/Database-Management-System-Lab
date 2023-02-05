select * from authors
select * from titleauthor

alter proc TEST2

AS

select au_lname as "Author Last Name" from authors where au_id = '172-32-1176'

EXEC TEST2