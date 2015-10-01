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

// configs page
racerControllers.controller('configListCtrl', function($scope, $http) {
    $http.get('/api/configs').success(function(data) {
        $scope.configs = data;
    });
});

// cars
racerControllers.controller('carListCtrl', function($scope, $http) {
    $http.get('/api/cars').success(function(data) {
        $scope.cars = data;
    });
});

// random race page
racerControllers.controller('randomRaceCtrl', function($scope, $http) {
    $scope.reloadPage = function() {
        // get configs
        $http.get('/api/configs').success(function(data) {
            $scope.tracks = data;

            $scope.randTrack = getRandomNum(data.length);
        });

        // get cars
        $http.get('/api/cars').success(function(data) {
            $scope.cars = data;

            $scope.randCar = getRandomNum(data.length);
        });

        // get random number
        getRandomNum = function(max){
            return Math.floor((Math.random()*max)+1);
        };
    };

    $scope.reloadPage();
});