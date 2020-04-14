# select author_fname, author_lname, min(released_year) from books
# 	group by author_lname, author_fname;
	
	
select concat(author_fname, ' ', author_lname) as author, max(pages) as 'longest book'
from books
group by author_lname, author_fname;

select author_fname, author_lname, sum(released_year) from books group by author_lname, author_fname;

