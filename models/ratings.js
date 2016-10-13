/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('ratings', {
		uid: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'user',
				key: 'uid'
			}
		},
		tid: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'thing',
				key: 'tid'
			}
		},
		rating: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		timestamp: {
			type: DataTypes.STRING,
			allowNull: false
		},
		media: {
			type: DataTypes.TEXT,
			allowNull: true
		}
	}, {
		tableName: 'ratings'
	});
};
