var racerApp = angular.module('racerApp', []);

racerApp.controller('trackListCtrl', function($scope, $http) {
    $http.get('/api/tracks').success(function(data) {
        $scope.tracks = data;
    });
});