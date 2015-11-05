var mysql      = require('mysql');
request = require("request")
var XMLHttpRequest = require('w3c-xmlhttprequest').XMLHttpRequest;
var Uber = require('node-uber');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'xplor_local'
});

connection.connect();


var api_key = "uoxquw9WjwGe6XrIMr4LIydfvdD6PvET"

var url = 'http://terminal2.expedia.com/x/hotels?location=42.284707,-83.741527&radius=4km&apikey=' + api_key

request({
    url: url,
    json: true
}, function hotel(error, response, body) {
    if (!error && response.statusCode === 200) {
    	var data = JSON.stringify(body);
    	for (var i = 0; i < 5; i++) {
	        var HotelID = body.HotelInfoList.HotelInfo[i].HotelID;
	        var Name = body.HotelInfoList.HotelInfo[i].Name;
	        var location = body.HotelInfoList.HotelInfo[i]. Location;
	        var TotalRate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.Price.TotalRate;
	        var CheckInDate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.CheckInDate;
	        var DetailsUrl = body.HotelInfoList.HotelInfo[i].FeaturedOffer.DetailsUrl;
	        var StarRating = body.HotelInfoList.HotelInfo[i].StarRating;
	        console.log(location);
	        console.log(TotalRate);
	        var post = {HotelID: HotelID, Name: Name, Location: location, TotalRate: TotalRate, CheckInDate: CheckInDate, DetailsUrl: DetailsUrl, StarRating: StarRating};
			var query = connection.query('INSERT INTO hotel_info SET ?', post, function(err, result) {
				if (err) {
					throw err
				}
			});
			console.log(query.sql);
	    	}
	    }
	    connection.end();
});

