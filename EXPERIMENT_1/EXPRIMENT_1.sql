create table books (
book_id int primary key,
book_name varchar(50) not null,
author_name varchar(50) not null
)



--  creating the library visitors table 

create table library_visitors(
	user_id int primary key,
	name varchar(50) not null,
	age int not null check(age>=18),
	email varchar(50) not null unique
)


--  creating the table for the book issue 
create table book_issue(
	book_isuue_id int  primary key,
	user_id int references library_visitors(user_id),
	book_id int not null references books(book_id)
)


--  inserting the data in the tables 
insert into books 
values (101 , 'HARRY POTTER' , 'DAVID');
insert into books 
values (102 , 'GODAN' , 'PREM')
INSERT INTO books
values (103 , 'MY_BOOK' ,'ARNAV')

select * from books


--  inserting data in the library_visitor
insert into library_visitors(user_id , name , age , email)
values (501,'Arnav Prajapati' , 20 , 'arnavprajapati@gamil.com'),
(502 , 'Anshu Sharma' , 19 , 'asnhu@gmail.com')

select * from library_visitors

--  to check the check constrain

insert into library_visitors 
values (503 , 'TEST' , 15 , 'test@gmail.com')


-- inserting the data into the book_issue
insert into book_issue
values(1001, 501 , 101)

select * from book_issue


-- verifcation
select * from books;
select * from library_visitors;
select * from book_issue;


-- creating the role 
create role librarian_2
with login password 'arnav0211'

select current_user


-- granting the permisiions 
grant select , insert , update , delete
on books to librarian_2

--  to revoke the permission from the librarian
revoke select , insert , update , delete 
on books from librarian_2


