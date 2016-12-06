module.exports = function (sequelize) {
  function getTopPosts (req,res,next) {
    var category = req.params.category
    // return top 5 best rated thing in the category
    /*  SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count
        FROM ratings r JOIN directory d ON r.tid=d.tid
        WHERE d.category='pets'
        GROUP BY d.tid
        HAVING COUNT(r.rating)>=10
        ORDER BY AVG(r.rating) DESC
        LIMIT 5;
    */

    sequelize.query(
        "WITH table_t AS ( \
          SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count\
          FROM ratings r JOIN directory d ON r.tid=d.tid\
          WHERE d.category='"+category+"'\
          GROUP BY d.tid\
          HAVING COUNT(r.rating)>=0\
          ORDER BY AVG(r.rating) DESC\
          LIMIT 8 \
        )\
        SELECT * FROM table_t JOIN thing ON thing.tid=table_t.tid;",

        { type: sequelize.QueryTypes.SELECT }
      )
    .then(function(users) {
      res.json(users);
      }, function(err) {
        res.status(500).send('Error getting post data.');
      });
    };

    function getNewPosts (req,res,next) {
      var category = req.params.category
      // return top 5 most recent rated thing in the category
      /*
          SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count, MAX(r.timestamp) AS timestamp
          FROM ratings r JOIN directory d ON r.tid=d.tid
          WHERE d.category='jk'
          GROUP BY d.tid
          ORDER BY MAX(r.timestamp) DESC
          LIMIT 5;
      */
      sequelize.query(
        "WITH table_t AS (\
          SELECT d.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count, MAX(r.timestamp) AS timestamp\
          FROM ratings r JOIN directory d ON r.tid=d.tid\
          WHERE d.category='"+category+"'\
          GROUP BY d.tid\
          ORDER BY MAX(r.timestamp) DESC\
          LIMIT 8\
          )\
        SELECT * FROM table_t JOIN thing ON thing.tid=table_t.tid",
        { type: sequelize.QueryTypes.SELECT })
      .then(function(users) {
        res.json(users);
        }, function(err) {
          res.status(500).send('Error getting post data.');
        });
      };

  return {getTopPosts,getNewPosts};
}
