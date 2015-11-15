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

    router.get("/flight",function(req,res) {
        connection.query("SELECT * FROM flight_info",function(err,rows) {
            if (err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Message" : "Success", "flights" : rows});
            }
        });
    });

    router.get("/hotel",function(req,res) {
        connection.query("SELECT * FROM hotel_info",function(err,rows) {
            if (err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Message" : "Success", "hotels" : rows});
            }
        });
    });
    router.get("/uber",function(req,res) {
        connection.query("SELECT * FROM uber",function(err,rows){ 
            if (err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Message" : "Success", "uber_price" : rows});
            }
        });
    });

    
}

module.exports = REST_ROUTER;
