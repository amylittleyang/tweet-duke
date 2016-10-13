/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('tags', {
    tid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'thing',
        key: 'tid'
      }
    },
    tag: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    freq: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    tableName: 'tags'
  });
};
