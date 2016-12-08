var ratingController = angular.module('ratingController',[]);
ratingController.controller('ratingController',['$scope','$http','$routeParams',function($scope,$http,$routeParams) {
  var tid = $routeParams.tid;
  $http({
    method:'GET',
    url:'/api/rating/'+tid
  }).then(function success(res){
    $scope.data = res.data;
    $scope.name = res.data[0].name;
  });
}]);
