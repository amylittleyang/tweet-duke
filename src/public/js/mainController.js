var mainController = angular.module('mainController',[]);
mainController.controller('mainController',['$scope','$http',function($scope,$http) {
  $scope.title = "Hello"
  $http({
    method: "GET",
    url:"/api/1"
  }).then( function(res) {
    $scope.data1 = res.data;
    $scope.data2 = res.data;
  }, function (err) {
    alert("error getting data.");
  });
}]);
