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
            when('/:trackShortname', {
                templateUrl: 'partials/track-details.html',
                controller: 'trackDetailsCtrl'
            }).
            otherwise({
                redirectTo: '/tracks'
            });
    }]);