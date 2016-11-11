module.exports = function (sequelize) {
  //get best rated things
  function homePageDataTop (req,res,next) {
  var uid = req.params.uid
  sequelize.query(
  "SELECT thing.name, directory.category, AVG(ratings.rating) AS avg " +
  "FROM thing " +
    "JOIN directory " +
      "ON directory.tid = thing.tid " +
    "JOIN ratings " +
      "ON ratings.tid = directory.tid " +
    "JOIN subscribes " +
      "ON subscribes.tid = ratings.tid " +
  "WHERE subscribes.uid = " +uid+ " AND subscribes.category = directory.category "+
  "GROUP BY thing.tid ORDER BY AVG(ratings.rating) " + "\
  DESC LIMIT 5" ,{ type: sequelize.QueryTypes.SELECT })
  .then(function(users) {
    res.json(users);
    }, function(err) {
      res.status(500).send('Error getting homepage data.');
    });
  };

  function homePageDataNew (req,res,next) {
  var uid = req.params.uid
  sequelize.query("SELECT thing.name, directory.category, AVG(ratings.rating) " +
    "FROM thing " +
      "JOIN directory " +
        "ON directory.tid = thing.tid " +
      "JOIN ratings " +
        "ON ratings.tid = directory.tid " +
      "JOIN subscribes " +
        "ON subscribes.tid = ratings.tid " +
    "WHERE subscribes.uid = " +uid+ " AND subscribes.category = directory.category "+
    "GROUP BY thing.tid ORDER BY ratings.timestamp " + "\
    DESC LIMIT 5"  ,{ type: sequelize.QueryTypes.SELECT })
  .then(function(users) {
    res.json(users);
    }, function(err) {
      res.status(500).send('Error getting homepage data.');
    });
  };

  return {homePageDataTop, homePageDataNew};
}
