// Declare app level module which depends on filters, and services

var app = angular.module('app',['ngRoute','ngMaterial','mainController']);

app.config(function ($routeProvider, $locationProvider) {
  $routeProvider.
    when('/', {
      templateUrl: './view/home.html',
      controller: 'mainController'
    });
  });
