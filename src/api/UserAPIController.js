module.exports = function (sequelize) {
  function homePageData (req,res,next) {
  sequelize.query("QUERY GOES HERE",{ type: sequelize.QueryTypes.SELECT })
  .then(function(users) {     
    res.json(users);
    }, function(err) {
      res.status(500).send('Error getting homepage data.');
    });
  };
  return {homePageData};
}