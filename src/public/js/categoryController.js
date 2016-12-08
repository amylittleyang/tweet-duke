var categoryController = angular.module('categoryController',[]);
categoryController.controller('categoryController',['$scope','$http','$routeParams',function($scope,$http,$routeParams) {
  // $scope.title = "Hello"
  var category = "Hospital";
  if ($routeParams.category) {
    category = $routeParams.category
  }
  $http({
    method: "GET",
    url:"/api/category/new/"+category
  }).then( function(res) {
    for (var d of res.data) {
      d.avg = parseInt(d.avg);
      getTags(d.tid,d);
    }
    $scope.data2 = res.data;
    if(res.data.length==0) {
      alert('No data available :(')
    }
  }, function (err) {
    alert("error getting data.");
  });

  $http({
    method: "GET",
    url:"/api/category/top/"+category
  }).then( function(res) {
    for (var d of res.data) {
      d.avg = parseInt(d.avg);
      getTags(d.tid,d);
    }
    $scope.data1 = res.data;
    if(res.data.length==0) {
      alert('No data available :(')
    }
  }, function (err) {
    alert("error getting data.");
  });

  function getTags(tid,thing) {
    $http({
      method:'GET',
      url:'/api/tags/'+tid
    }).then(function(res) {
      res.data.splice(Math.min(5,res.data.length),res.data.length-5);
      thing.tags=res.data;
    });
  }
}]);
