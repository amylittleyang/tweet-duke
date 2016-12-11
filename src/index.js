import http from 'http';
import express from 'express';
import morgan from 'morgan';
// import cors from 'cors';
import bodyParser from 'body-parser';
var fs = require('fs');
var busboy = require('connect-busboy');

// import initializeDb from './db';
// import middleware from './middleware';
import api from './api';
import routes from './routes';
// import config from './config.json';
// import mongoose from 'mongoose';
import path from 'path';
import Sequelize from 'sequelize';

let app = express();
app.server = http.createServer(app);

// all environments
app.set('port', process.env.PORT || 3000);

app.use(morgan('dev'));
app.use(bodyParser());
app.use(busboy());

// app.use(methodOverride());
app.use('/', routes);
app.use(express.static(path.join(__dirname, '/public')));
app.use(express.static(path.join(__dirname, '/../node_modules')));

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


// JSON API
// app.use('/api/', api);

// initialize with connection string
var sequelize = new Sequelize('postgres://vdookpabztdayg:f23c0XpZ5ZHm5Obw29eeuu3YrL@ec2-54-247-76-24.eu-west-1.compute.amazonaws.com:5432/cs316_project');
// var sequelize = new Sequelize('postgres://postgres@localhost:5432/cs316_project')
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

app.use('/api', api({sequelize}));

/**
 * Start Server
 */

http.createServer(app).listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
