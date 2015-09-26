/*
 * Joseph Malle -- node.js simple starter for testing
 * Requires file structure as follows:
 * root
 *  |-cssjs
 *  |    |-any css, js, or text file
 *  |
 *  |-files
 *  |    |-index.html
 *  |    |-itinerary.html
 *  |    |-thankyou.html
 *  |    |-404.html
 *  |
 *  | -img
 *       |-any png
 *
 */

var http = require("http");
var file = require("fs");
var data = {};
file.readFile("files/index.html",function(err,indexData){
  data.index = indexData;
});
file.readFile("files/itinerary.html",function(err,itineraryData){
  data.itinerary = itineraryData;
});
file.readFile("files/thankyou.html",function(err,thankYouData){
  data.thankYou = thankYouData;
});
file.readFile("files/404.html",function(err,four04Data){
  data.four04 = four04Data;
});
http.createServer(function(request, response){
  var text;
  var code = 200;
  var goSendResponse = true;
  if(request.url == "/"){
    text = data.index;
  }else if(request.url == "/thank-you"){
    text = data.thankYou;
  }else if(/\/itinerary\/.*/.test(request.url)){
    text = data.itinerary;
  }else if(/\/api\/.*/.test(request.url)){
    text = "api stuff";
  }else if(/\/cssjs\/.*/.test(request.url)){
    var urlToFile = request.url.match(/\/(cssjs\/.*)/);
    goSendResponse = false;
    file.readFile(urlToFile[1],function(err, fileData){
      if(err){
        response.writeHead(404,{"Content-Type": "text/html"});
        response.end(data.four04);
      }else{
        var mimeType = "text/plain";
        if(/\.js/.test(urlToFile[1])){
          mimeType = "application/javascript";
        }else if(/\.css/.test(urlToFile[1])){
          mimeType = "text/css";
        }
        response.writeHead(200,{"Content-Type": mimeType});
        response.end(fileData);
      }
    });
  }else if(/\/img\/.*/.test(request.url))){
    var urlToFile = request.url.match(/\/(img\/.*)/);
    goSendResponse = false;
    file.readFile(urlToFile[1],function(err, fileData){
      if(err){
        response.writeHead(404,{"Content-Type": "text/html"});
        response.end(data.four04);
      }else{
        response.writeHead(200,{"Content-Type": “image/png”});
        response.end(fileData);
      }
    });
  }else{
    text = data.four04;
    code = 404;
  }
  if(goSendResponse){
    response.writeHead(code,{"Content-Type": "text/html"});
    response.end(text);
  }
}).listen(8000);
console.log("Server is on");
