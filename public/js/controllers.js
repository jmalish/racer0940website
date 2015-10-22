// controller.js
var racerControllers = angular.module('racerControllers', []);

// tracks
racerControllers.controller('trackListCtrl', function($scope, $http, $rootScope) {
    $http.get('/api/tracks').success(function(data) {
        $scope.tracks = data;
    });

    $rootScope.pageTitle = "Track List :: racer0940.com";
});

racerControllers.controller('trackDetailsCtrl', function($scope, $http, $routeParams, $rootScope) {
    $http.get('/api/configs/' + $routeParams.trackShortname).success(function(data) {
        $scope.configs = data;

        $rootScope.pageTitle = "Track Detail for " + data[0].track_name + " :: racer0940.com";
    });
});

// configs page
racerControllers.controller('configListCtrl', function($scope, $http, $rootScope) {
    $http.get('/api/configs').success(function(data) {
        $scope.configs = data;
    });

    $rootScope.pageTitle = "All Track Configurations :: racer0940.com";
});

// cars
racerControllers.controller('carListCtrl', function($scope, $http, $rootScope) {
    $http.get('/api/cars').success(function(data) {
        $scope.cars = data;
    });

    $rootScope.pageTitle = "Cars :: racer0940.com";
});

// random race page
racerControllers.controller('randomRaceCtrl', function($scope, $http, $rootScope) {
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

    $rootScope.pageTitle = "Random Race Generator :: racer0940.com";

    $scope.reloadPage();
});

// series
racerControllers.controller('seriesCtrl', function($scope, $http, $rootScope) {
    $http.get('/api/series').success(function(data) {
        $scope.series = data;
    });

    $scope.minLicense = "";

    $rootScope.pageTitle = "Series :: racer0940.com";
});

racerControllers.controller('seriesDetailsCtrl', function($scope, $http, $routeParams, $rootScope, $filter) {
    $http.get('/api/series/' + $routeParams.seriesId).success(function(data) {
        $scope.series = data[0];

        $rootScope.pageTitle = "Series Detail for " + data[0].name + " :: racer0940.com";
    });

    $http.get('/api/carsinseries/' + $routeParams.seriesId).success(function(data) {
        $scope.cars = data;
    });

    $http.get('/api/eventsinseries/' + $routeParams.seriesId).success(function(data) {
        $scope.events = data;

        today = $filter('date')(new Date(), 'MM dd yyyy hh mm ss'); // gets current date and formats it
        $scope.currentWeek = 0;

        angular.forEach($scope.events, function (value, index) {
            startDate = $filter('date')(new Date(value.startDate), 'MM dd yyyy hh mm ss');

            if (today > startDate) {
                $scope.currentWeek = value.raceWeek;
            }
        });
    });
});

racerControllers.controller('currentRacesCtrl', function($scope, $http, $routeParams, $rootScope) {
    $http.get('/api/currentWeek').success(function(data) {
        $scope.races = data;
    });

    $http.get('/api/carsInSeries').success(function(data) {
        $scope.cars = data;
    });

    $scope.minLicense = 0


    $rootScope.pageTitle = "Races of the Week :: racer0940.com";
});