use lms_db;
show tables;

select * from lms_members;
select * from lms_book_issue;
select * from lms_book_details;
select * from lms_suppliers_details;
select * from lms_fine_details;

/*1.Write a query to display the member id, member name of the members, book code and 
book title of the books taken by them.*/
 
select member_id, member_name from lms_members 
union
select book_code, book_title from lms_book_details;

/*
2.Write a query to display the total number of books available in the library with alias name
“NO_OF_BOOKS_AVAILABLE” (Which is not issued). Hint: The issued books details are available in the
LMS_BOOK_ISSUE table.
*/

select count(book_code) from lms_book_details where book_code not in
(select book_code from lms_book_issue where date_returned is null);

/* 3.Write a query to display the member id, member name, fine range and fine amount of the members 
whose fine amount is less than 100.*/


select member_id, member_name from lms_members
union
select fine_range, fine_amount from lms_fine_details where fine_amount < '100';

/*4.Write a query to display the book code, book title and availability status of the ‘JAVA’ 
books whose edition is "6”. Show the availability status with alias name “AVAILABILITYSTATUS”.
 Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.*/

select lms_book_details.book_title as availibilitystatus,category, lms_book_issue.book_code
from lms_book_details
join lms_book_issue on lms_book_details.book_code = lms_book_issue.book_code
where date_returned is not null and
category = 'java' and book_edition = '6';



/*
5.Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1'
and sort by book title in ascending order.*/
select book_code, book_title, rack_num from lms_book_details  where rack_num = 'A1' order by book_title asc;

/*6. Write a query to display the member id, member name, due date and date returned of the members who has
returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return
date.*/

select lms_members.member_id,memeber_name, lms_book_issue.date_return, date_returned
from lms_members
join lms_date_issue on lms_members.member_id = lms_book_issue.member_id
where date_returned > date_return;


/*7.Write a query to display the member id, member name and date of registration who have not taken any book.*/

select lms_members.date_register, lms_book_issue.member_id
from lms_members
join lms_book_issue on lms_members.member_id = lms_book_issue.member_id
where date_issue is null;


/*8.Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.*/

select lms_members.member_name, lms_book_issue.member_id
from lms_members
join lms_book_issue on lms_members.member_id = lms_book_issue.member_id
where fine_range = 'R0' and year(date_return) = '2012';

/*9. Write a query to display the date on which the maximum numbers of books were issued and the number of
books issued with alias name “NOOFBOOKS”.*/

select max(date_issue) as noofbooks from lms_book_issue;


/*10.Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book
edition is 5 and supplied by supplier ‘S01’.*/

select book_title, supplier_id, author, book_edition from lms_book_details where author = 'Herbert Schildt' and 
book_edition = 5 and supplier_id = 'S01';

/*11. Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS”
and sort by rack number in ascending order.*/

select rack_num, category as noofbooks from lms_book_details order by rack_num asc; 


/*12. Write a query to display book issue number, member name, date or registration, date of expiry, book title,
category author, price, date of issue, date of return, actual returned date, issue status, fine amount.*/
 
 
/*13. Write a query to display the book code, title, publish date of the books which is been published in the month of
December.*/

select book_code, book_title, publish_date from lms_book_details where  monthname(publish_date) = 'december';

/*14. Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is
"5”. Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be
fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.*/

select lms_book_details.book_title, lms_book_issue.date_issue 
from lms_book_details
join lms_book_issue on lms_book_details.book_code = lms_book_issue.book_code
where category = 'java' and book_edition = '5' and date_issue is not null; 
