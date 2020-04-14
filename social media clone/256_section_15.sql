-- finding the 5 oldest users
select * from users
order BY created_at
limit 5;

-- which day of the week do most users register on?
select 
	username, 
	dayname(created_at) as day,
	count(*) as total
from users
group by day
order by total desc
limit 2;

-- identify inactive users (users with no photos)
select username
from users
left join photos
on users.id = photos.user_id
where photos.id is NULL;
# select * from photos;

-- who got the most likes on a single photo
select
	photos.id,
	photos.image_url,
	count(*)
from photos
inner join likes
on likes.photo_id = photos.id
group by photos.id;

-- find users who have liked every single photo on the site
select
	username,
	user_id,
	count(*) as num_likes
from users
inner join likes
on users.id = likes.user_id
group by likes.user_id
having num_likes = (select COUNT(*) from photos);
