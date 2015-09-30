angular.module('racerFilters', []).
    filter('checkmarkFilter', function() {
        return function(input) {
            return input ? '\u2713' : '\u2718';
        };
    }).
    filter('ovalRoadFilter', function() {
        return function(input) {
            return input ? 'Oval' : 'Road';
        };
    }).
    filter('hasNightFilter', function() {
        return function(input) {
            return input ? 'It does offer night racing.' : 'It does not offer night racing.';
        };
    });