var CronJob = require('cron').CronJob;
var mysql      = require('mysql');
var async = require('async');
request = require("request")
var XMLHttpRequest = require('w3c-xmlhttprequest').XMLHttpRequest;
var Uber = require('node-uber');

var pool  = mysql.createPool({
   	  host     : 'localhost',
	  user     : 'root',
	  password : 'mysql',
	  database : 'xplor_local'
});

// A2, Boston, San Francisco, NYC, Detroit, Las Vegas, Miami, Sacramento
var latitude = [42.275267, 42.360225, 37.774929, 40.762250, 42.329585, 36.121452, 34.073234, 25.758851, 38.577814];
var longitude = [-83.741606, -71.058744, -122.419416, -73.978740, -83.039529, -115.169611, -118.389241, -80.192212, -121.490685];
var api_key = "uoxquw9WjwGe6XrIMr4LIydfvdD6PvET"; 

pool.getConnection(function(err,connection) {
	for (var j = 0; j < 9; j++) {
		var url = 'http://terminal2.expedia.com/x/hotels?location=' + latitude[j] +',' + longitude[j] + '&radius=3km&apikey=' + api_key;
		request({
		    url: url,
		    json: true
		}, function (error, response, body) {
		    if (!error && response.statusCode === 200) {
		    	var data = JSON.stringify(body);
		    	for (var i = 0; i < 3; i++) {
			        var HotelID = body.HotelInfoList.HotelInfo[i].HotelID;
			        var Name = body.HotelInfoList.HotelInfo[i].Name;
			        var location = body.HotelInfoList.HotelInfo[i].Location.City;
			        var latitude = body.HotelInfoList.HotelInfo[i].Location.GeoLocation.Latitude;
			        var longitude = body.HotelInfoList.HotelInfo[i].Location.GeoLocation.Longitude;
			        var TotalRate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.Price.TotalRate.Value;
			        var CheckInDate = body.HotelInfoList.HotelInfo[i].FeaturedOffer.CheckInDate;
			        var DetailsUrl = body.HotelInfoList.HotelInfo[i].FeaturedOffer.DetailsUrl;
			        var StarRating = body.HotelInfoList.HotelInfo[i].StarRating;
			        var geo = latitude + "," + longitude;
			        var post = {HotelID: HotelID, Name: Name, location: location, TotalRate: TotalRate, CheckInDate: CheckInDate, DetailsUrl: DetailsUrl, StarRating: StarRating, geo: geo};
					var query = connection.query('INSERT INTO hotel_info SET ?', post, function(err, result) {
					if (err) {
							throw err
						}
					});
			    }
			}
		});
	}
	connection.release();
});





