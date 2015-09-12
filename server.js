// server.js
// load prerequisites
var express = require('express');
var app = express();
var request = require('request');
var fs = require('fs');
var mysql = require('mysql');
var bodyparser = require('body-parser');

// setting view engine to use ejs
var port = 80; // port server listens on

app.set('view engine', 'ejs');

// general app setup
app.use(express.static(__dirname + '/public'))
    .use(bodyparser.urlencoded({ extended: false}))
    .use(bodyparser.json());


// setting up mysql
var data = fs.readFileSync('secrets.json');
var secrets = JSON.parse(data);
var mysqlpwd = secrets.passwords.mysql;
var sqlConnection;
var sqlConfig = {
    host: 'localhost',
    user: 'root',
    password: mysqlpwd,
    database: 'iracing'
};

function handleDisconnect() { // reconnects to DB if sqlConnection is lost for some reason
    sqlConnection = mysql.createConnection(sqlConfig);

    sqlConnection.connect(function(err) {
        if(err) {
            console.log("Error connecting to mySQL: " + err);
            setTimeout(handleDisconnect(), 2000);
        }
    });

    sqlConnection.on('error', function(err) {
        console.log('DB error: ', err);
        if(err.code === 'PROTOCOL_CONNECTION_LOST') {
            handleDisconnect();
        } else {
            throw err;
        }
    });

    setTimeout(function() {
        console.log("Connected to SQL database with thread id " + sqlConnection.threadId);
    }, 100);
}

handleDisconnect(); // initial sqlConnection
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
            var data = fs.readFileSync('secrets.json');
            var secrets = JSON.parse(data);
            var youtubeAPIkey  = secrets.apiKeys.youtube;

            // since no stream is on, I want to show two random videos from my youtube channel (racer0940tv)
            request({
                url: 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUkUuHpGDYHTW-I3Wvlwpf4g&maxResults=20&key=' + youtubeAPIkey,
                json: true
            }, function(error, response, body) {
                // get latest video
                var latestVideo = 'https://www.youtube.com/embed/' + body.items[0].snippet.resourceId.videoId;
                var latestVideoDescription = body.items[0].snippet.description;

                // generate a random number between 1 and 20 (don't want 0, that's the latest video)
                var rand = Math.floor(Math.random() * 19) + 1;
                var randomVideo = 'https://www.youtube.com/embed/' + body.items[rand].snippet.resourceId.videoId;
                var randomVideoDescription = body.items[rand].snippet.description;

                // offline render (youtube vids and info)
                res.render('pages/', {
                    title:'racer0940.com :: Home',
                    isLive: false,
                    latestVid: latestVideo,
                    latestVidDesc: latestVideoDescription,
                    randVid: randomVideo,
                    randVidDesc: randomVideoDescription,
                    twitchTitle: null,
                    twitchGame: null
                });
            });
        } else { // show the player
            var twitchStreamGame = body.stream.game;
            var twitchStreamTitle = body.stream.channel.status;

            // live render (twitch player and info)
            res.render('pages/', {
                title:'Home :: racer0940.com',
                isLive: true,
                latestVid: null,
                latestVidDesc: null,
                randVid: null,
                randVidDesc: null,
                twitchTitle: twitchStreamTitle,
                twitchGame: twitchStreamGame
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

// cars page
app.get('/iracingCars', function(req, res) {
    sqlConnection.query('SELECT * FROM cars', function(err, rows) {
        if (!err) {
            res.render('pages/iracingCars', {
                title: 'iRacing Cars :: racer0940.com',
                cars: rows,
                search: ""
            });
        } else {
            console.log(err.stack);
        }
    });
});

app.post('/iracingCars', function(req, res) {

    var first = true;
    var search = req.body.search;
    var isDefault = req.body.defaultFilter;
    var myQuery = "SELECT * FROM cars";

    if ((search != "") || (search == null)) {
        mysql.escape(search);
        myQuery = "SELECT * FROM cars WHERE car_name LIKE '%" + req.body.search + "%'";
        first = false;
    }

    if (isDefault != 'Any') {
        mysql.escape(isDefault);
        if (!first) {
            myQuery += " AND car_isDefaultContent = " + isDefault;
        } else {
            myQuery = "SELECT * FROM cars WHERE car_isDefaultContent = " + isDefault;
        }
    }

    sqlConnection.query(myQuery, function(err, rows) {
        if (!err) {
            res.render('pages/iracingCars', {
                title: 'iRacing Cars :: racer0940.com',
                cars: rows,
                search: search
            });
        } else {
            console.error(err.stack);
        }
    });
});

// tracks page
app.get('/iracingTracks', function(req, res) {
    sqlConnection.query('SELECT * FROM tracks', function(err, rows) {
        if (!err) {
            res.render('pages/iracingTracks', {
                title: 'iRacing Tracks :: racer0940.com',
                tracks: rows,
                search: ""
            });
        } else {
            console.log(err.stack);
        }
    });
});

app.post('/iracingTracks', function(req, res) {
    var first = true;
    var search = req.body.search;
    var isDefault = req.body.defaultFilter;
    var myQuery = "SELECT * FROM tracks";

    if ((search != "") || (search == null)) {
        mysql.escape(search);
        myQuery = "SELECT * FROM tracks WHERE track_name LIKE '%" + req.body.search + "%'";
        first = false;
    }

    if (isDefault != 'Any') {
        mysql.escape(isDefault);
        if (!first) {
            myQuery += " AND track_isDefaultContent = " + isDefault;
        } else {
            myQuery = "SELECT * FROM tracks WHERE track_isDefaultContent = " + isDefault;
        }
    }

    sqlConnection.query(myQuery, function(err, rows) {
        res.render('pages/iracingTracks', {
            title: 'iRacing Tracks :: racer0940.com',
            tracks: rows,
            search: search
        });
    });
});

// configs page
app.get('/iracingConfigs', function(req, res) {

    sqlConnection.query('SELECT * FROM tracks AS parent INNER JOIN configs ON parent.track_id=configs.trackId', function(err, rows) {
        if (!err) {
            res.render('pages/iracingConfigs', {
                title: 'iRacing Track Configurations :: racer0940.com',
                configs: rows,
                search: "",
                ovalFilter: "Any",
                nightFilter: "Any"
            });
        } else {
            console.log(err.stack);
        }
    });
});

app.post('/iracingConfigs', function(req, res) {
    var search = req.body.search;
    var ovalFilter = req.body.ovalFilter;
    var nightFilter = req.body.nightFilter;
    var myQuery = "SELECT * FROM tracks AS t INNER JOIN configs AS c ON t.track_id=c.trackId";

    if (search != "") {
        mysql.escape(search);
        myQuery += " WHERE c.config_name LIKE '%" + req.body.search + "%' OR t.track_name LIKE '%" + req.body.search + "%'";
    }

    if (ovalFilter != 'Any') {
        mysql.escape(ovalFilter);
        myQuery += " AND c.isOval = " + ovalFilter;
    }

    if (nightFilter != 'Any') {
        mysql.escape(nightFilter);
        myQuery += " AND c.hasNight = " + nightFilter;
    }

    sqlConnection.query(myQuery, function(err, rows) {
        res.render('pages/iracingConfigs', {
            title: 'iRacing Track Configurations :: racer0940.com',
            configs: rows,
            search: search,
            ovalFilter: ovalFilter,
            nightFilter: nightFilter
        });
    });
});

// randomRace page
app.get('/randomRace', function (req, res) {

    var myQueryCar = "SELECT * FROM cars";
    var myQueryTrack = "SELECT * FROM tracks AS t INNER JOIN configs AS c ON t.track_id=c.trackId";
    var selectedCar, selectedTrack;

    sqlConnection.query(myQueryCar, function(err, rows) {
        var rand = Math.floor(Math.random() * rows.length);
        selectedCar = rows[rand];

        sqlConnection.query(myQueryTrack, function(err, rows) {
            rand = Math.floor(Math.random() * rows.length);
            selectedTrack = rows[rand];

            res.render('pages/randomRace', {
                    title: 'Random Race Generator :: racer0940.com',
                    car: selectedCar,
                    track: selectedTrack,
                    defaultFilterPost: "Any",
                    ovalFilter: "Any",
                    nightFilter: "Any"
                }
            );
        });
    });
});

app.post('/randomRace', function (req, res) {

    var first = true;
    var myQueryCar = "SELECT * FROM cars";
    var myQueryTrack = "SELECT * FROM tracks AS t INNER JOIN configs AS c ON t.track_id=c.trackId";
    var selectedCar, selectedTrack;
    var defaultFilter = req.body.defaultFilter;
    var ovalFilter = req.body.ovalFilter;
    var nightFilter = req.body.nightFilter;


    if (defaultFilter != "Any") {
        mysql.escape(defaultFilter);
        myQueryCar += " WHERE cars.car_isDefaultContent = " + defaultFilter;
        myQueryTrack += " WHERE t.track_isDefaultContent = " + defaultFilter;
        first = false;
    }

    if (ovalFilter != "Any") {
        mysql.escape(ovalFilter);
        if (first) {
            myQueryTrack += " WHERE c.isOval = " + ovalFilter;
            first = false;
        } else {
            myQueryTrack += " AND c.isOval = " + ovalFilter;
        }
    }

    if (nightFilter != "Any") {
        mysql.escape(nightFilter);
        if (first) {
            myQueryTrack += " WHERE c.hasNight = " + nightFilter;
        } else {
            myQueryTrack += " AND c.hasNight = " + nightFilter;
        }
    }

    sqlConnection.query(myQueryCar, function (err, rows) {
        var rand = Math.floor(Math.random() * rows.length);
        selectedCar = rows[rand];

        sqlConnection.query(myQueryTrack, function (err, rows) {
            rand = Math.floor(Math.random() * rows.length);
            selectedTrack = rows[rand];

            res.render('pages/randomRace', {
                    title: 'Random Race Generator :: racer0940.com',
                    car: selectedCar,
                    track: selectedTrack,
                    defaultFilterPost: defaultFilter,
                    ovalFilter: ovalFilter,
                    nightFilter: nightFilter
                }
            );
        });
    });
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
app.listen(port);
console.log('Server running on port ' + port);
