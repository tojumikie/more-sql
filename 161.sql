# curdate() - gives current date
# curtime() - gives current time
# now() - gives current datetime 

# insert into people values(
# 	'Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43'
# );


insert into people (name, birthdate, birthtime, birthdt) values
('Microwave', curdate(), curtime(), now());

delete from people where name = 'Microwave';

how to convert something like '2017-04-21' to 'April 21 2017'?
We could use something like concat(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate))