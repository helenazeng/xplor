var Uber = require('node-uber');

var mysql      = require('mysql');
request = require("request")
var XMLHttpRequest = require('w3c-xmlhttprequest').XMLHttpRequest;

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'xplor_local'
});

connection.connect();

 
var hotel_latitude = 'SELECT latitude FROM hotel_info';
var hotel_longitude = 'SELECT longitude FROM hotel_info';
connection.query(hotel_latitude, hotel_longitude, function(err, rows, fields) {
    if (err) throw err;
    for (var i in rows) {
        var hotel_lat = rows[i].latitude;
        var hotel_long = rows[i].longitude;
    }
});


var uber = new Uber({
  client_id: '8k6fXvLhPy7gcCckWlwKMSS64dVyxtnT',
  client_secret: 'pBXkDL3EazTLgptU0W4YZsezOmD0NY-NS8CkSyfZ',
  server_token: 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
  redirect_uri: 'http://localhost:8080/uberauthorize',
  name: 'uber_info'
});

ann arbor to DTW
uber.estimates.price({ 
  start_latitude: 42.365613, start_longitude: -71.009560, 
  end_latitude: 42.356159, end_longitude: -71.050789
}, function (err, res) {
  if (err) console.error(err);
  else
    price = res.prices[0].estimate;
    distance = res.prices[0].distance;
    product_id = res.prices[0].product_id;

    var post = {origin: "Logan International Airport", distance: distance, destination: "Boston Harbor Hotel", price: price, id: product_id};
    var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
    if (err) {
      throw err
    }
  });
  console.log(query.sql);
  connection.end();
});

uber.estimates.price({ 
  start_latitude: 42.365613, start_longitude: -71.009560, 
  end_latitude: 42.352317, end_longitude: -71.068525
}, function (err, res) {
  if (err) console.error(err);
  else
    price = res.prices[0].estimate;
    distance = res.prices[0].distance;
    product_id = res.prices[0].product_id;

    var post = {origin: "Logan International Airport", distance: distance, destination: "Four Seasons Hotel Boston", price: price, id: product_id};
    var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
    if (err) {
      throw err
    }
  });
  console.log(query.sql);
  connection.end();
});

uber.estimates.price({ 
  start_latitude: 42.365613, start_longitude: -71.009560, 
  end_latitude: 42.348881, end_longitude: -71.08181
}, function (err, res) {
  if (err) console.error(err);
  else
    price = res.prices[0].estimate;
    distance = res.prices[0].distance;
    product_id = res.prices[0].product_id;

    var post = {origin: "Logan International Airport", distance: distance, destination: "Mandarin Oriental Boston", price: price, id: product_id};
    var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
    if (err) {
      throw err
    }
  });
  console.log(query.sql);
  connection.end();
});

uber.estimates.price({ 
  start_latitude: 42.365613, start_longitude: -71.009560, 
  end_latitude: 42.353266, end_longitude: -71.063156
}, function (err, res) {
  if (err) console.error(err);
  else
    price = res.prices[0].estimate;
    distance = res.prices[0].distance;
    product_id = res.prices[0].product_id;

    var post = {origin: "Logan International Airport", distance: distance, destination: "The Ritz-Carlton, Boston Common", price: price, id: product_id};
    var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
    if (err) {
      throw err
    }
  });
  console.log(query.sql);
  connection.end();
});

uber.estimates.price({ 
  start_latitude: 42.365613, start_longitude: -71.009560, 
  end_latitude: 42.354216, end_longitude: -71.05245 
}, function (err, res) {
  if (err) console.error(err);
  else
    price = res.prices[0].estimate;
    distance = res.prices[0].distance;
    product_id = res.prices[0].product_id;

    var post = {origin: "Logan International Airport", distance: distance, destination: "InterContinental Boston", price: price, id: product_id};
    var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
    if (err) {
      throw err
    }
  });
  console.log(query.sql);
  connection.end();
});




