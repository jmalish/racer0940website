var racerApp = angular.module('racerApp', [
    'checkFilter',
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
            otherwise({
                redirectTo: '/tracks'
            });
    }]);