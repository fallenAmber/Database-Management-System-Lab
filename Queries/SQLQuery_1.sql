select city from authors

select * from titleauthor

select * from titles

select * from publishers

select au_lname,  title, pub_name from authors JOIN titleauthor ON authors.au_id= titleauthor.au_id JOIN titles on titleauthor.title_id = titles.title_id join publishers ON titles.pub_id = publishers.pub_id

select * from authors
select * from publishers

select au_lname, pub_name from authors, publishers where authors.city=publishers.city

select au_lname,pub_name, publishers.city from authors,publishers where authors.city=publishers.city

select * from titleauthor