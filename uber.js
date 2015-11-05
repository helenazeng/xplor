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

var uber = new Uber({
  client_id: '8k6fXvLhPy7gcCckWlwKMSS64dVyxtnT',
  client_secret: 'pBXkDL3EazTLgptU0W4YZsezOmD0NY-NS8CkSyfZ',
  server_token: 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
  redirect_uri: 'http://localhost:8080/uberauthorize',
  name: 'uber_info'
});

// ann arbor to DTW
uber.estimates.price({ 
  start_latitude: 42.2751536, start_longitude: -83.7437474, 
  end_latitude: 42.2161722, end_longitude: -83.3575729
}, function (err, res) {
  if (err) console.error(err);
  else
    console.log(res);
  	price = res.value;

  	var post = {origin: "Ann Arbor", destination: "Detroit Metropolitan Airport", price: price,};
	  var query = connection.query('INSERT INTO uber SET ?', post, function(err, result) {
		if (err) {
			throw err
		}
	});
	console.log(query.sql);
  connection.end();
});

