#1 Get the top 3 rating movies in 2018
select name,release_company,rating
from film
ORDER BY rating desc
limit 3;

#2 GET youtube's video about these five actors and get these twitter accounts' followers.
select actorname,video_title,followers
from (SELECT actorname,followers
FROM actor_twitter_information
GROUP BY actorname,followers) as b,actor_youtube_information a
where a.actorname_in_youtube=b.actorname
ORDER BY followers desc;

#3 Get the most 3 actors'personl twitter accounts about these followers.
SELECT actorname,followers
FROM actor_twitter_information
GROUP BY actorname,followers 
order by followers desc
limit 3;


#4 Get the companys' channel_titles and playist_titles on youtube,which company distributed the top 3 rating movies in 2018.
select name,rating,release_company,chanenl_title,playist_title
from(select name,release_company,rating
from film
ORDER BY rating desc
limit 3) as a, company_youtube as b
where a.release_company=b.company_name;

#5 Get what post on company's official accounts,which company distributed the top 3 rating movie in 2018.
select name,rating,release_company,screen_name,post,followers
from(select name,release_company,rating
from film
ORDER BY rating desc
limit 3) as a, company_twitter as b
where a.release_company=b.company_name;

#6 Get the most 10 popular twitters about these five actors.
SELECT actorname,post,posttime,retweets
FROM actor_twitter_information
ORDER BY retweets DESC LIMIT 10;

#7 Get laday gaga's the most 10 popular twitters from her personal twiter account.
SELECT actorname,post,retweets
FROM actor_twitter_information
WHERE actorname='Lady Gaga'
ORDER BY retweets DESC LIMIT 10;

#8 Get the most 10 recent youtube videos about these five actors.
SELECT actorname_in_youtube,video_title,video_desription,posttime
FROM actor_youtube_information
ORDER BY posttime DESC LIMIT 10;

#9 Get the least video title about these five actors.
SELECT b.actorname_in_youtube,b.video_title,b.posttime
FROM 
(SELECT actorname_in_youtube,MAX(posttime) as recent  
FROM actor_youtube_information
GROUP BY actorname_in_youtube) a
JOIN actor_youtube_information b ON b.posttime=a.recent;

#10 Get the most retweets post from the five actors' twitter accounts.
SELECT b.actorname,b.post,b.retweets
FROM 
(SELECT actorname,MAX(retweets)as retweets
FROM actor_twitter_information 
GROUP BY actorname) a
JOIN actor_twitter_information b ON b.retweets=a.retweets;