// Declare app level module which depends on filters, and services

var app = angular.module('app',['ngRoute','ngMaterial','mainController','categoryController','ratingController']);

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
    .when('/ratings/:tid',{
      templateUrl:'./view/rating.html',
      controller:'ratingController'
    });
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
  this.uploadFileToUrl = function(file,data, successCallback, errorCallback){
     var fd = new FormData();
     fd.append('file', file);
     for(var key in data) {
       fd.append(key,data[key]);
     }

     $http.post('/api/post',fd, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined},
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

app.controller('ctrl',['$scope','$http','fileUpload','$route',function($scope,$http,fileUpload,$route) {
  $scope.tags = [];
  $scope.recentTags = [];
  $scope.uid = 1;
  $scope.rating = 1;
  $scope.categories = [];
  var icons = ["favorite","pets","content_paste","movie_filter","class","theaters","settings_voice","camera","tag_faces"];
  var timestamp = new Date();

  $scope.clickTag = function(tag) {
    tag = "#"+tag;
    var arr = $scope.recentTags;
    if(arr.indexOf(tag) === -1) {
      arr.push(tag);
    }
    if(arr.length>8) {
      arr.splice(0,1);
    }
  }

  $scope.getCategories = function() {
    $http({
      method: "GET",
      url:"/api/category"
    }).then(function (res) {
      for (var t of res.data) {
        t.icon = icons[getRandomInt(0,icons.length)];
      }
      // console.log("res.data=");
      // console.log(res.data);
      $scope.categories = res.data;
    });
  };

  function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
  }

  $scope.post = function(){
     var file = $scope.myFile;
     var data = {
       "tags":$scope.tags,
       "rating":$scope.rating,
       "uid":$scope.uid,
       "timestamp": timestamp.toString()
     };
  // console.log($scope.tags);
     fileUpload.uploadFileToUrl(file, data,
       function success() {
         $scope.tags = [];
         $scope.myFile = "";
         $scope.rating = 1;

      }, function error() {
         alert('error');
      }) ;
  };
  $scope.getCategories();
}]);
