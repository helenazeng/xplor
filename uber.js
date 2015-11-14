var Uber = require('node-uber');

var mysql      = require('mysql');
request = require("request");
var XMLHttpRequest = require('w3c-xmlhttprequest').XMLHttpRequest;


var pool  = mysql.createPool({
    host     : 'localhost',
    user     : 'root',
    password : 'mysql',
    database : 'xplor_local'
});

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'xplor_local'
});

var uber = new Uber({
  client_id: '8k6fXvLhPy7gcCckWlwKMSS64dVyxtnT',
  client_secret: 'pBXkDL3EazTLgptU0W4YZsezOmD0NY-NS8CkSyfZ',
  server_token: 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
  redirect_uri: 'http://localhost:8080/uberauthorize',
  name: 'uber_info'
});

connection.connect();

 
var hotel_geo = 'SELECT Geo FROM hotel_info';
connection.query(hotel_geo, function(err, rows, fields) {
    if (err) throw err;
    for (var i in rows) {
        console.log(rows[i].Geo);
    }
});
// no uber service in Las Vegas
var airport_latitude = [42.216172, 42.365613, 37.621313, 42.216172, 33.941589,
                               40.641311, 38.695085];
var airport_longitude = [-83.355384, -71.009560, -122.378955, -83.355384, 
                              -118.408530, -73.778139, -121.590065];
var hotel_name = 'SELECT Name FROM hotel_info';
connection.query(hotel_name, function(err, rows, fields) {
  if (err) throw err;
  uber.estimates.price({ 
    for (var i in rows) {

    }
      start_latitude: airport_latitude[i], start_longitude: airport_longitude[i], 
      end_latitude: 38.58035, end_longitude: -121.49366
    }, function (err, res) {
      if (err) console.error(err); 
      else
        price = res.prices[0].estimate;
        distance = res.prices[0].distance;
        var airports = ["Detroit Metropolitan Airport", "Logan International Airport", "San Francisco International Airport", 
                         "Detroit Metropolitan Airport", "Los Angeles International Airport",
                        "John F. Kennedy International Airport", "Sacramento International Airport"];
          var post = {origin: airports[i], distance: distance, destination: rows[i].Name, price: price};
          var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
          if (err) {
            throw err
          }
        });
      console.log(query.sql);
      connection.end();
    });
});
