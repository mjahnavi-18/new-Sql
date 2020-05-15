use lms_db;
show tables;
/* 1.Write aquery to display the member id, member name, city and membership status 
who are all having life time membership. */

select * from lms_members;
select member_id, member_name, city, membership_status 
from lms_members 
where membership_status = 'permanent';

/* 2.Write a query to display the member id, member name who have not returned the books.*/

select * from lms_book_issue;
/* 
select member_id, book_code 
from lms_book_issue 
where date_return != date_returned; 
*/

select distinct lms_members.member_name, lms_book_issue.member_id
from lms_members
join lms_book_issue on lms_members.member_id = lms_book_issue.member_id
where date_return != date_returned;


/* 3Write a query to display the member id, member name who have taken the book with book code 'BL000002'.*/

select * from lms_members;
select * from lms_book_issue;
select lms_members.member_name, lms_book_issue.member_id
from lms_members
join lms_book_issue on lms_members.member_id = lms_book_issue.member_id
where book_code = 'BL000002';


/* 4.Write a query to display the book code, book title and author of the books whose author name begins with 'P'.*/

select book_code, book_title, author
from lms_book_details
where author like 'p%';


/* 5. Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.*/

select sum(number_of_books) from lms_book_details;

alter table lms_book_details rename column book_edition to number_of_books;
select * from lms_book_details;

select count(category) as no_of_books from lms_book_details  where category = 'java' group by category ;
 
/*6. Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’*/
select * from lms_book_details;

select category,count(category) as no_of_books from lms_book_details group by category;


/* 7. Write a query to display the number of books published by "Prentice Hall” with the alias name
“NO_OF_BOOKS”.*/

select * from lms_book_details;

select count(book_code) as no_of_books from lms_book_details where publication = 'Prentice Hall';


/*8.Write a query to display
 the book code, book title of the books which are issued on the date "1st April 2012"*/
select * from lms_book_details;
select * from lms_book_issue;
select lms_book_details.book_title, lms_book_issue.book_code 
from lms_book_details 
join lms_book_issue 
on lms_book_details.book_code = lms_book_issue.book_code
where date_issue = '2012-04-01';



/*9.Write a query to display the member id, member name, date of registration and expiry date of the members
whose membership expiry date is before APR 2013.*/

select *from lms_members;
select member_id, member_name,date_register,date_expire from lms_members where date_expire < '2013-04-30';


/*10.write a query to display the member id, member name, date of registration, membership status of the
members who registered before "March 2012" and membership status is "Temporary"*/
select *from lms_members;
select member_id, member_name, date_register, membership_status from lms_members where date_register < '2012-03-01';


/* 11.Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the
member name in title case with alias name 'Name'.*/

select * from lms_members;
select member_id, member_name as Name from lms_members where city =  'delhi' or 'chennai' ;

/*12. Write a query to concatenate book title, author and display in the following format.
Book_Title_is_written_by_Author.*/

desc lms_book_details;

select distinct concat_ws("_", "book",book_title,"written","by",author) as Book_Written_by from lms_book_details; 

/*13.
Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name
“AVERAGEPRICE”
*/
select category, avg(price) as averageprice from lms_book_details where category = 'java';


/*14
=================
Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail
account.*/
select * from lms_suppliers_details;
select supplier_id,supplier_name, email from lms_suppliers_details where email like '%@gmail.com';


/*15
=========================
Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone
number or email or address with alias name “CONTACTDETAILS”. If phone number is null then display email,
even if email also null then display the address of the supplier. Hint: Use Coalesce function.
*/

select supplier_id,supplier_name,coalesce(contact,email,address) as ContactDetails from lms_suppliers_details;




/*16
===================
Write a query to display the supplier id, supplier name and contact. If phone number is null then display ‘No’
else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. Hint: Use NVL2.
*/


select supplier_id,supplier_name,contact nullif( )
