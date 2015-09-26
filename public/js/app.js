var racerApp = angular.module('racerApp', ['checkFilter']);

racerApp.controller('trackListCtrl', function($scope, $http) {
    $http.get('/api/tracks').success(function(data) {
        $scope.tracks = data;
    });

    $scope.defaultCheckChange = function() {
        if ($scope.defaultOnly) {
            $scope.defaultOnlytest = "0"; // true
        } else {
            $scope.defaultOnlytest = "no";
        }
    };
});

