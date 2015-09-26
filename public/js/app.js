var racerApp = angular.module('racerApp', ['checkFilter']);

racerApp.controller('trackListCtrl', function($scope, $http) {
    $http.get('/api/tracks').success(function(data) {
        $scope.tracks = data;
    });

    $scope.defaultCheckChange = function() {
        if ($scope.defaultOnly) {
            $scope.search = {"track_isDefaultContent" : 1}; // true
        } else {
            $scope.search = {"track_isDefaultContent" : ""}; // false
        }
    };
});

