// Declare app level module which depends on filters, and services

var app = angular.module('app',['ngRoute','ngMaterial','mainController','categoryController']);

app.config(function ($routeProvider, $locationProvider) {
  $routeProvider.
    when('/', {
      templateUrl: './view/home.html',
      // controller: 'mainController'
      controller:'categoryController'
    })
    .when('/category/:category', {
      templateUrl: './view/home.html',
      controller: 'categoryController'
    })
  });

app.directive('fileModel', ['$parse', function ($parse) {
  return {
     restrict: 'A',
     link: function(scope, element, attrs) {
        var model = $parse(attrs.fileModel);
        var modelSetter = model.assign;

        element.bind('change', function(){
           scope.$apply(function(){
              modelSetter(scope, element[0].files[0]);
           });
        });
     }
  };
}]);

app.service('fileUpload', ['$http', function ($http) {
  this.uploadFileToUrl = function(file, uploadUrl, successCallback, errorCallback){
     var fd = new FormData();
     fd.append('file', file);

     $http.post(uploadUrl, fd, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined},
        body: {
          // TODO: add uid, tid, rating, tags
        }
     })

     .success(function(){
       document.getElementById("file-chooser").value = "";
       successCallback();
     })

     .error(function(){
       errorCallback();
     });
  }
}]);

app.controller('ctrl',['$scope','fileUpload','$route',function($scope,fileUpload,$route) {
  $scope.tags = [];
  $scope.rating = 1;
  $scope.uploadFile = function(){
     var file = $scope.myFile;

     console.log('file is ' );
     console.dir(file);

     var uploadUrl = "api/fileUpload";
     fileUpload.uploadFileToUrl(file, uploadUrl,
       function success() {
         $scope.tags = [];
         $scope.myFile = "";
         $scope.rating = 1;

      }, function error() {
         alert('error');
      }) ;
  };
}]);
