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
            return input ? 'It has night racing.' : 'It does not have night racing.';
        };
    }).
    filter('defaultContentFilter', function() {
        return function(input) {
            return input ? 'It is default content.' : 'It is not default content.';
        };
    });