var express = require('express'),
  bodyParser = require('body-parser'),
  // methodOverride = require('method-override'),
  // errorHandler = require('error-handler'),
  morgan = require('morgan'),
  routes = require('./routes'),
  api = require('./api'),
  http = require('http'),
  path = require('path'),
  Sequelize = require('sequelize');

var app = module.exports = express();

// all environments
app.set('port', process.env.PORT || 3000);

app.use(morgan('dev'));
app.use(bodyParser());
// app.use(methodOverride());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'node_modules')));
app.use(express.static(path.join(__dirname, 'bower_components')));

var env = process.env.NODE_ENV || 'development';

// development only
if (env === 'development') {
  // app.use(express.errorHandler());
}

// production only
if (env === 'production') {
  // TODO
}

/**
 * Routes
 */
app.use('/', routes);

// JSON API
// app.use('/api/', api);
app.use('/api', api(sequelize));

// initialize with connection string
var sequelize = new Sequelize('postgres://postgres@localhost:5432/cs316_project');

// connect to postgres database named 'cs316_project'
sequelize
  .authenticate()
  .then(function(err) {
    console.log('Connection has been established successfully.');
    // var Models = require('./models')(sequelize);
    // Models.createTables();
  })
  .catch(function (err) {
    console.log('Unable to connect to the database:', err);
  });


/**
 * Start Server
 */

http.createServer(app).listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
