var fs = require('fs'),
    http = require('http');

http.createServer(function (req, res) {
  console.log(req.url);
  var url_actual = "/index.html";
  if(req.url != "/"){
     url_actual = req.url;
  }
    fs.readFile(__dirname + "/front_end" + url_actual, function (err,data) {
      if (err) {
        res.writeHead(404);
        res.end(JSON.stringify(err));
        return;
      }
      res.setHeader('Access-Control-Allow-Origin', 'http://xplor.xyz:3000/api');
      res.writeHead(200);
      res.end(data);
    });
}).listen(8000);
