var categoryController = angular.module('categoryController',[]);
categoryController.controller('categoryController',['$scope','$http','$routeParams',function($scope,$http,$routeParams) {
  $scope.title = "Hello"
  $http({
    method: "GET",
    url:"/api/category/new/"+$routeParams.category
  }).then( function(res) {
    $scope.data2 = res.data;
  }, function (err) {
    alert("error getting data.");
  });

  $http({
    method: "GET",
    url:"/api/category/top/"+$routeParams.category
  }).then( function(res) {
    $scope.data1 = res.data;
  }, function (err) {
    alert("error getting data.");
  });
}]);
