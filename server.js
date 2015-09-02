// server.js
// load prerequisites
var express = require('express');
var app = express();
var request = require('request');

// setting view engine to use ejs
app.set('view engine', 'ejs');

// telling server to use public folder
app.use(express.static(__dirname + '/public'));

///////////
// PAGES //
///////////
// index page
app.get('/', function(req, res) {

    // get json from twitch
    request({
        url: 'https://api.twitch.tv/kraken/streams/racer0940',
        json: true
    }, function(error, response, body){
        // if twitch says the channel is not live, hide the player
        if (body.stream === null) {
            // since no stream is on, I want to show two random videos from my youtube channel (racer0940tv)
            // https:www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUkUuHpGDYHTW-I3Wvlwpf4g&maxResults=20&key=AIzaSyCo36ATPVxuATJJpSDHZtQ9ChZ-K9hkh9s
            request({
                url: 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUkUuHpGDYHTW-I3Wvlwpf4g&maxResults=20&key=AIzaSyCo36ATPVxuATJJpSDHZtQ9ChZ-K9hkh9s',
                json: true
            }, function(error, response, body) {
                // get latest video
                var latestVideo = 'https://www.youtube.com/embed/' + body.items[0].snippet.resourceId.videoId;
                var latestVideoDescription = body.items[0].snippet.description;

                // generate a random number between 1 and 20 (don't want 0, that's the latest video)
                var rand = Math.floor(Math.random() * 19) + 1;
                var randomVideo = 'https://www.youtube.com/embed/' + body.items[rand].snippet.resourceId.videoId;
                var randomVideoDescription = body.items[rand].snippet.description;


                res.render('pages/', {
                    title:'racer0940.com :: Home',
                    isLive: false,
                    latestVid: latestVideo,
                    latestVidDesc: latestVideoDescription,
                    randVid: randomVideo,
                    randVidDesc: randomVideoDescription
                });
            });
        } else { // show the player
            res.render('pages/', {
                title:'racer0940.com :: Home',
                isLive: true,
                latestVid: null,
                latestVidDesc: null,
                randVid: null,
                randVidDesc: null
            });
        }
    });
});

// about page
app.get('/about', function (req, res) {
    res.render('pages/about', {
        title:'racer0940.com :: About'
    });
});

// testing page
app.get('/test', function (req, res) {
    // generate a random number between 1 and 20 (don't want 0, that's the latest video)
    var rand = Math.floor(Math.random() * 19) + 1;

    res.render('pages/test',
        {title: 'test',
         random: rand}
    );
});

// 404 (THIS ALWAYS NEEDS TO BE LAST)
app.get('*', function (req, res) {
    res.render('pages/404', {
        title:'OH SNAP A 404!'
    });
});

//////////////////
// Server Stuff //
//////////////////
app.listen(8081);
console.log('Server running on port 8081');