# select 
# 	concat(substring(title, 1, 10), '...') as 'short title' from books;

select substring(replace(title, 'e', '3'), 1, 10) from books;

'woof' 'foow'

select concat(author_fname, reverse(author_fname)) from books;

"Eggers is 6 characters long"

select concat(author_lname, ' is ', char_length(author_lname), ' characters long') from books;

select concat('MY FAVORITE BOOK IS ', upper(title)) from books;

select reverse(upper('Why does my cat look at me with such hatred?'));

select author_lname from books