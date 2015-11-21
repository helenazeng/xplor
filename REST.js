var mysql   = require("mysql");


function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

REST_ROUTER.prototype.handleRoutes = function(router,connection,md5) {
    var request_city = "New York";
    var self = this;
    router.get("/",function(req,res) {
        res.json({"Message" : "Hello World !"});
    });
    router.get("/api",function(req,res) {
        connection.query("SELECT * FROM Everything",function(err,rows) {
            if (err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                // A2, Boston, San Francisco, NYC, Detroit, Las Vegas, Miami, Sacramento
                // var cities = ["Boston", "Ann Arbor", "San Francisco", "New York", "Detroit", "Las Vegas", "Miami", "Sacramento"];
                // var flights_dest = ["BOS", "DTW", "SFO", "JFK", "DTW", "LAS", "MIA", "SMF"];
                // var uber_origin = ["Logan International Airport", "Detroit Metropolitan Airport", "San Francisco International Airport", 
                //          "John F. Kennedy International Airport", "Detroit Metropolitan Airport", "Los Angeles International Airport",
                //         "", "Sacramento International Airport"];
                var itinerary = {};
                var flights = [];
                var ubers_hotel = [];
                var hotels = [];
                // for (var j = 0; j < cities.length; j++) {
                    // itinerary[cities[j]] = {};
                itinerary[request_city] = {};
                for (var i in rows) {
                    // itinerary["type"] = "flightSet";
                    // itinerary["flightCount"] = i;
                    // itinerary["city"] = cities[j];
                    if (request_city == "New York") {
                        airport = "JFK";
                        uber = "Loews Regency New York Hotel"
                    }
                    else if (request_city == "Boston") {
                        airport = "BOS";
                        uber = "Four Seasons Hotel Boston";
                    }
                    else if (request_city == "San Francisco") {
                        airport = "SFO";
                        uber = "The Fairmont San Francisco";

                    }
                    else if (request_city == "Ann Arbor") {
                        airport = "DTW";
                        uber = "Residence Inn Ann Arbor Downtown";
                    }
                    else if (request_city == "Detroit") {
                        airport = "DTW";
                        uber = "MGM Grand Detroit";
                    }
                    else if (request_city == "Las Vegas") {
                        airport = "LAS";
                        uber = ""
                    }
                    else if (request_city == "Miami") {
                        airport = "MIA";
                        uber = "";

                    }
                    else if (request_city == "Sacramento") {
                        airport = "SMF";
                        uber = "Amber House - Midtown Sacramento";
                    }
                    if (rows[i].destination == airport || rows[i].origin == airport) {
                        // itinerary[request_city][vendor] = rows[i].vendor;
                        flights.push(rows[i]);

                    }
                    else if (rows[i].destination == uber) {
                        ubers_hotel.push(rows[i]);
                    }
                    else if (rows[i].location == request_city) {
                        if (rows[i].DetailsUrl != "") {
                            delete rows[i].DetailsUrl;
                        }
                        hotels.push(rows[i]);

                    }
                }
                
                itinerary[request_city]["flights"] = flights;
                itinerary[request_city]["ubers_hotel"] = ubers_hotel;
                itinerary[request_city]["hotels"] = hotels;
                res.setHeader("Access-Control-Allow-Origin", "*");
                res.send(JSON.stringify(itinerary));
                
                // res.json({rows});
                // }
                // res.json({"itinerary": itinerary});
            }
        });
    });
    
}

module.exports = REST_ROUTER;
