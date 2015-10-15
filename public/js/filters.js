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
    }).filter('licenseFilter', function() {
       return function(input) {
           if (input == 0) {
               return "Rookie 1.0";
           } else if (input == 1) {
               return "Rookie 2.0";
           } else if (input == 2) {
               return "Rookie 3.0";
           } else if (input == 3) {
               return "Rookie 4.0";
           } else if (input == 4) {
               return "D 1.0";
           } else if (input == 5) {
               return "D 2.0";
           } else if (input == 6) {
               return "D 3.0";
           } else if (input == 7) {
               return "D 4.0";
           } else if (input == 8) {
               return "C 1.0";
           } else if (input == 9) {
               return "C 2.0";
           } else if (input == 10) {
               return "C 3.0";
           } else if (input == 11) {
               return "C 4.0";
           } else if (input == 12) {
               return "B 1.0";
           } else if (input == 13) {
               return "B 2.0";
           } else if (input == 14) {
               return "B 3.0";
           } else if (input == 15) {
               return "B 4.0";
           } else if (input == 16) {
               return "A 1.0";
           } else if (input == 17) {
               return "A 2.0";
           } else if (input == 18) {
               return "A 3.0";
           } else if (input == 19) {
               return "A 4.0";
           } else if (input == 20) {
               return "Pro 1.0";
           } else if (input == 21) {
               return "Pro 2.0";
           } else if (input == 22) {
               return "Pro 3.0";
           } else if (input == 23) {
               return "Pro 4.0"
           }
       }
    }).filter('isFixedFilter', function() {
        return function(input) {
            return input ? "Fixed" : "Open";
        }
    }).filter('lapsTimeFilter', function() {
        return function(input) {
            if (input == 0) {
                return "";
            } else {
                return input;
            }
        }
    }).filter('lapsTimeTitleFilter', function() {
        return function(input) {
            if (input == 0) {
                return "Laps";
            } else {
                return "Minutes";
            }
        }
    });