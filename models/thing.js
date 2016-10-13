/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('thing', {
		tid: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		name: {
			type: DataTypes.STRING,
			allowNull: false
		}
	}, {
		tableName: 'thing'
	});
};
