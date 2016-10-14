--Query to get the top 5 ratings from each user:
SELECT uid, tid, rating FROM user, ratings WHERE user.uid = ratings.uid ORDER BY rating DESC LIMIT 5;
--Query to find the number of times each place has been tagged:
SELECT tid, COUNT(tag) FROM tags GROUP BY tid;
--Query to get the number of total ratings given by each user:
SELECT user.uid AS uid1, COUNT(rating) FROM user, ratings WHERE uid1 = ratings.uid GROUP BY uid1;
--Query to get the most subscribed to places:
SELECT tid, COUNT(uid) FROM directory, subscribes WHERE directory.category = subscribes.category GROUP BY tid;
