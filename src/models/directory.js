/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('directory', {
    tid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'thing',
        key: 'tid'
      }
    },
    category: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'directory'
  });
};
