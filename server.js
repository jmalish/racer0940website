// server.js
// load prerequisites
var express = require('express');
var app = express();
var request = require('request');
var fs = require('fs');
var mysql = require('mysql');
var bodyparser = require('body-parser');

// setting view engine to use ejs
var port = 81; // port server listens on

app.set('view engine', 'ejs');

// general app setup
app.use(express.static(__dirname + '/public'))
    .use('/node', express.static(__dirname + '/node_modules'))
    .use('/partials', express.static(__dirname + '/views/partials'))
    .use(bodyparser.urlencoded({ extended: false}))
    .use(bodyparser.json());

// <editor-fold desc="MySQL setup">
// setting up mysql
var secretsJSON = fs.readFileSync('secrets.json'); // read secrets file
var secrets = JSON.parse(secretsJSON);
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
// </editor-fold>

////////////////
// index page //
////////////////
app.get('/', function(req, res) {
    res.render('pages/index', {}
    );
});


//////////
// JSON //
//////////
// <editor-fold desc="JSON/API">
// track api
app.get('/api/tracks', function(req, res) {
    sqlConnection.query('SELECT * FROM tracks', function(err, rows) {
        if (!err) {
            var tracks = JSON.stringify(rows);

            res.json(JSON.parse(tracks));
        }
    });
});

// track api
app.get('/api/cars', function(req, res) {
    sqlConnection.query('SELECT * FROM cars', function(err, rows) {
        if (!err) {
            var tracks = JSON.stringify(rows);

            res.json(JSON.parse(tracks));
        }
    });
});

// configs api (all)
app.get('/api/configs', function(req, res) {
    var myQuery = "SELECT tracks.name as parentName, tracks.shortName as parentShortName, configs.iRacingId, configs.name, configs.layoutImageURL FROM tracks INNER JOIN configs ON tracks.id=configs.trackId;";

    sqlConnection.query(myQuery, function(err, rows) {
        if (!err) {
            var configs = JSON.stringify(rows);

            res.json(JSON.parse(configs));
        }
    });
});

// configs api (specific track)
app.get('/api/configs/:trackShortname', function(req, res) {
    var trackShortName = mysql.escape(req.params.trackShortname);

    var myQuery = 'SELECT tracks.name as parentName, tracks.logoURL as parentLogoImgUrl, tracks.mapImageURL as parentMapImgUrl, tracks.isDefaultContent as parentIsDefaultContent, configs.hasNight, configs.name, configs.isOval, configs.layoutImageURL FROM tracks INNER JOIN configs ON tracks.id=configs.trackId WHERE tracks.shortName = '
        + trackShortName;

    sqlConnection.query(myQuery, function(err, rows) {
        if (!err) {
            var configs = JSON.stringify(rows);

            res.json(JSON.parse(configs));
        }
    });
});

// series api
app.get('/api/series', function(req, res) {
    var myQuery = "select series.*, series.isFixed, series.isTeam, lic1.name as minLicense, lic2.name as maxLicense FROM series left join licenses lic1 on lic1.id = series.minLicenseId left join licenses lic2 on lic2.id = series.maxLicenseId;";

    sqlConnection.query(myQuery, function(err, data) {
        var series = JSON.stringify(data);

        res.json(JSON.parse(series));
    });
});

// series details api
app.get('/api/series/:seriesId', function(req, res) {
    var seriesId = mysql.escape(req.params.seriesId);

    var myQuery = "SELECT * FROM series WHERE series.id = " +
        seriesId;

    sqlConnection.query(myQuery, function(err, data) {
        var seriesDetails = JSON.stringify(data);

        res.json(JSON.parse(seriesDetails));
    });
});

// cars in series api
app.get('/api/carsInSeries/:seriesId', function(req, res) {
    var seriesId = mysql.escape(req.params.seriesId);

    var myQuery = "SELECT cars.name, cars.imageURL, cars.isDefaultContent FROM cars LEFT JOIN cars_in_series ON cars.iRacingId = cars_in_series.carId WHERE cars_in_series.seriesId = " +
        seriesId;

    sqlConnection.query(myQuery, function(err, data) {
        var carsInSeries = JSON.stringify(data);

        res.json(JSON.parse(carsInSeries));
    });
});

app.get('/api/eventsInSeries/:seriesId', function(req, res) {
    var seriesId = mysql.escape(req.params.seriesId);

    var myQuery = "SELECT events.id, events.startDate, events.laps, events.time, events.raceWeek, configs.name as configName, configs.layoutImageURL, tracks.name as parentName, tracks.isDefaultContent FROM events LEFT JOIN configs on configs.iracingId = events.trackId LEFT JOIN tracks on tracks.id = configs.trackId where events.seasonId = " +
        seriesId;

    sqlConnection.query(myQuery, function(err, data) {
        var eventsInSeries = JSON.stringify(data);

        res.json(JSON.parse(eventsInSeries));
    });
});
// </editor-fold>

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
