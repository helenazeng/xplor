var mysql   = require("mysql");


function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

REST_ROUTER.prototype.handleRoutes = function(router,connection,md5) {
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
                var cities = ["Boston", "Ann Arbor", "San Francisco", "New York", "Detroit", "Las Vegas", "Miami", "Sacramento"];
                var flights_dest = ["BOS", "DTW", "SFO", "JFK", "DTW", "LAS", "MIA", "SMF"];
                var uber_origin = ["Logan International Airport", "Detroit Metropolitan Airport", "San Francisco International Airport", 
                         "John F. Kennedy International Airport", "Detroit Metropolitan Airport", "Los Angeles International Airport",
                        "", "Sacramento International Airport"];
                var itinerary = {};
                var flights = [];
                var ubers_hotel = [];
                var hotels = [];
                for (var j = 0; j < 8; j++) {
                    for (var i in rows) {
                        // itinerary["type"] = "flightSet";
                        itinerary["flightCount"] = i;
                        itinerary["city"] = cities[j];
                        if (rows[i].destination == flights_dest[j]) {
                            flights.push(rows[i]);
                        }
                        else if (rows[i].origin == uber_origin[j]) {
                            ubers_hotel.push(rows[i]);
                        }
                        else if (rows[i].location == cities[j]) {
                            hotels.push(rows[i]);

                        }
                    
                }
                itinerary["flights"] = flights;
                itinerary["ubers_hotel"] = ubers_hotel;
                itinerary["hotels"] = hotels;
                res.json({"itinerary": itinerary});
                
                
                // res.json({rows});
                }
            }
        });
    });
    
}

module.exports = REST_ROUTER;
