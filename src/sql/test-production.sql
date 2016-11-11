--Query to get the top 5 ratings from each user:
SELECT uid, tid, rating FROM user, ratings WHERE user.uid = ratings.uid ORDER BY rating DESC LIMIT 5;
--Query to find the number of times each place has been tagged:
SELECT tid, COUNT(tag) FROM tags GROUP BY tid;
--Query to get the number of total ratings given by each user:
SELECT user.uid AS uid1, COUNT(rating) FROM user, ratings WHERE uid1 = ratings.uid GROUP BY uid1;
--Query to get the most subscribed to places:
SELECT tid, COUNT(uid) FROM directory, subscribes WHERE directory.category = subscribes.category GROUP BY tid;
--Query to get 10 most recently rated items in a category
SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count

-- FROM ratings r JOIN directory d ON r.tid=d.tid
-- WHERE d.category='pets'
-- GROUP BY d.tid
-- HAVING COUNT(r.rating)>=10
-- ORDER BY AVG(r.rating) DESC
-- LIMIT 10;
-- --Query to get 10 most recent posts in a category
-- SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count, MAX(r.timestamp) AS timestamp
-- FROM ratings r JOIN directory d ON r.tid=d.tid
-- WHERE d.category='pets'
-- GROUP BY d.tid
-- ORDER BY MAX(r.timestamp) DESC
-- LIMIT 10;
--Query to
