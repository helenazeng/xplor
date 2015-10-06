var mysql      = require('mysql');
var request = require("request")
var api_key = "uoxquw9WjwGe6XrIMr4LIydfvdD6PvET"

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'xplor_local'
});

connection.connect();


var url = 'http://terminal2.expedia.com/x/hotels?location=42.284707,-83.741527&radius=1km&apikey=' + api_key
request({
    url: url,
    json: true
}, function (error, response, body) {
    if (!error && response.statusCode === 200) {
    	var data = JSON.stringify(body);
    	for (var i = 0; i < 2; i++) {
	        var HotelID = body.HotelInfoList.HotelInfo[i].HotelID;
	        var Name = body.HotelInfoList.HotelInfo[i].Name;
	        var location = body.HotelInfoList.HotelInfo[i]. Location;
	        var TotalRate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.Price.TotalRate;
	        var CheckInDate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.CheckInDate;
	        var DetailsUrl = body.HotelInfoList.HotelInfo[i].FeaturedOffer.DetailsUrl;
	        var StarRating = body.HotelInfoList.HotelInfo[i].StarRating;

	        console.log(HotelID);
	        console.log(Name);
	        console.log(location);
	        console.log(TotalRate);
	        console.log(CheckInDate);
	        console.log(DetailsUrl);
	        console.log(StarRating);

    }

    }
});

// connection.query('SELECT * from hotel_info', function(err, rows, fields) {

//   if (!err)
//     console.log('The solution is: ', rows);
//   else
//     console.log('Error while performing Query.');
// });

connection.end();


// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : 'mysql',
//   database : 'xplor_local'
// });

// connection.connect();

// connection.query('SELECT * from hotel_info', function(err, rows, fields) {

//   if (!err)
//     console.log('The solution is: ', rows);
//   else
//     console.log('Error while performing Query.');
// });

// connection.end();

console.log("Server running at http://127.0.0.1:3306/");

