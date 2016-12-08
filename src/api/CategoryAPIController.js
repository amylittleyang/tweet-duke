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
          SELECT t.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count\
          FROM ratings r JOIN tags t ON r.tid=t.tid\
          WHERE t.tag='"+category+"'\
          GROUP BY t.tid\
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

    function getTagsForId (req,res,next) {
      var tid = req.params.tid;
      sequelize.query("SELECT tags.tag, tags.freq FROM tags WHERE tid='"+tid+"' ORDER BY freq DESC")
      .then(function(tags) {
        res.json(tags[0]);
      });
    }

    function getAllCategory (req,res,next) {
      sequelize.query("SELECT tags.tag, COUNT(r.tid) AS count FROM tags, ratings r \
      WHERE tags.tid=r.tid \
      GROUP BY tags.tag ORDER BY count DESC LIMIT 30;")
      .then(function(tags) {
        // console.log(tags);
        res.json(tags[0]);
      },function(error) {
        res.status(500).send('error getting tags.');
      });
    }

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
          SELECT t.tid,AVG(r.rating) AS avg, COUNT(r.rating) AS count, MAX(r.timestamp) AS timestamp\
          FROM ratings r JOIN tags t ON r.tid=t.tid\
          WHERE t.tag='"+category+"'\
          GROUP BY t.tid\
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

  return {getTopPosts,getTagsForId,getAllCategory,getNewPosts};
}
