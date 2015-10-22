var racerApp = angular.module('racerApp', [
    'racerFilters',
    'ngRoute',
    'racerControllers'
]);

racerApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/', {
                templateUrl: 'partials/track-list.html',
                controller: 'trackListCtrl'
            }).
            when('/configurations', {
                templateUrl: 'partials/configurations.html',
                controller: 'configListCtrl'
            }).
            when('/cars', {
                templateUrl: 'partials/car-list.html',
                controller: 'carListCtrl'
            }).
            when('/randomRace', {
                templateUrl: 'partials/randomrace.html',
                controller: 'randomRaceCtrl'
            }).
            when('/tracks/:trackShortname', {
                templateUrl: 'partials/track-details.html',
                controller: 'trackDetailsCtrl'
            }).
            when('/series', {
                templateUrl: 'partials/series-list.html',
                controller: 'seriesCtrl'
            }).
            when('/series/:seriesId', {
                templateUrl: 'partials/series-details.html',
                controller: 'seriesDetailsCtrl'
            }).
            when('/currentRaces', {
                templateUrl: 'partials/current_week.html',
                controller: 'currentRacesCtrl'
            }).
            otherwise({
                templateUrl: 'partials/404.html'
            });
    }]);