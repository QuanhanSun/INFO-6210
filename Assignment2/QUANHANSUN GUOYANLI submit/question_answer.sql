use film_industry;
#1What user posted this?
select consumer,post
from consumers;

#2When did user post this?
select consumer,post,post_time
from consumers;

#3What posts has user posted in the past 24 hours?
select actorname,post from actor_twitter_information
where posttime>('2019-3-04') and actorname='Lady Gaga';

#4How many posts has this user posted in past 24 hour?
select actorname,count(post) 
from actor_twitter_information
where posttime>('2019-3-04') and actorname='Lady Gaga';

#5What hashtag are popular?
select hashtag,count(Hashtag)
from consumers
GROUP BY Hashtag 
order by (select count(Hashtag) group by Hashtag) desc;

#6What posts are populer?
SELECT post,favourites from consumers
ORDER BY favourites desc;