// controller.js
var racerControllers = angular.module('racerControllers', []);


// tracks
racerControllers.controller('trackListCtrl', function($scope, $http) {
    $http.get('/api/tracks').success(function(data) {
        $scope.tracks = data;
    });
});

racerControllers.controller('trackDetailsCtrl', function($scope, $http, $routeParams) {
    $http.get('/api/configs/' + $routeParams.trackShortname).success(function(data) {
        $scope.configs = data;
    });
});

// cars
racerControllers.controller('carListCtrl', function($scope, $http) {
    $http.get('/api/cars').success(function(data) {
        $scope.cars = data;
    });

    $scope.defaultCheckChange = function() {
        if ($scope.defaultOnly) {
            $scope.search = {"car_isDefaultContent" : 1}; // true
        } else {
            $scope.search = {"car_isDefaultContent" : ""}; // false
        }
    };
});