// server.js
// load prerequisites
var express = require('express');
var app = express();

// setting view engine to use ejs
app.set('view engine', 'ejs');

///////////
// PAGES //
///////////
// index page
app.get('/', function(req, res) {
    var drinks = [
        { name: 'Drink1', drunkness: 5},
        { name: 'Drink2', drunkness: 15},
        { name: 'Drink3', drunkness: 9},
    ];
    var tagline = "This is a tagline, used for tagging stuff, maybe on lines.";

    res.render('pages/index', {
        drinks: drinks,
        tagline: tagline
    });
});

// about page
app.get('/about', function (req, res) {
    res.render('pages/about');
});


//////////////////
// Server Stuff //
//////////////////
app.listen(8081);
console.log('Server running on port 8081');