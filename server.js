// server.js
// load prerequisites
var express = require('express');
var app = express();
var request = require('request');
var events = require('events');
var eventEmitter = new events.EventEmitter();

// setting view engine to use ejs
app.set('view engine', 'ejs');

// telling server to use public folder
app.use(express.static(__dirname + '/public'));

///////////
// PAGES //
///////////
// index page
app.get('/', function(req, res) {
    var xinput = true;

    // get json from twitch
    request({
        url: 'https://api.twitch.tv/kraken/streams/racer0940',
        json: true
    }, function(error, response, body){
        // if twitch says the channel is not live, hide the player
        if (body.stream === null) {
            res.render('pages/', {
                title:'racer0940.com :: Home',
                isLive: false
            });
        } else { // show the player
            res.render('pages/', {
                title:'racer0940.com :: Home',
                isLive: true
            });
        }
    });
});

//youtube api: https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUkUuHpGDYHTW-I3Wvlwpf4g&key=

// about page
app.get('/about', function (req, res) {
    res.render('pages/about', {
        title:'racer0940.com :: About'
    });
});

// testing page
app.get('/test', function (req, res) {

});

//////////////////
// Server Stuff //
//////////////////
app.listen(8081);
console.log('Server running on port 8081');