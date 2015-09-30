var racerApp = angular.module('racerApp', [
    'racerFilters',
    'ngRoute',
    'racerControllers'
]);

racerApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/tracks', {
                templateUrl: 'partials/track-list.html',
                controller: 'trackListCtrl'
            }).
            when('/tracks/:trackShortname', {
                templateUrl: 'partials/track-details.html',
                controller: 'trackDetailsCtrl'
            }).
            otherwise({
                redirectTo: '/tracks'
            });
    }]);