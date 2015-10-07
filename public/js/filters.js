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
    }).
    filter('cautionTypeFilter', function() {
        return function(cautionType) {
            if (cautionType == 0) {
                return "No Cautions";
            } else if (cautionType == 1) {
                return "Local Cautions Only";
            } else if (cautionType == 2) {
                return "Full Course Cautions";
            }
        }
    });