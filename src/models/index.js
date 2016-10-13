var Datatypes = require('sequelize');
module.exports = function (sequelize) {
  // console.log('imported');
  var model = {};
  model.User = require('./User')(sequelize, Datatypes);
  model.createTables = function(){
    model.User.sync().then(function() {
      // table is created
      console.log('User table is created');
    },function() {
      console.log('Error creating table');
    });
  };
  return model;
}
