var mysql = require('mysql');

var fs = require('fs');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'xplor_local'
});


connection.query('select * from flight_info;', function(err, results, fields){
    if(err) throw err;
    fs.writeFile('table.json', JSON.stringify(results), function (err) {
    	if (err) throw err;
    	console.log('Saved!');
    });
});
connection.query('select * from hotel_info;', function(err, results, fields){
    if(err) throw err;
    fs.writeFile('table.json', JSON.stringify(results), function (err) {
    	if (err) throw err;
    	console.log('Saved!');
    });
});
connection.query('select * from uber;', function(err, results, fields){
    if(err) throw err;
    fs.writeFile('table.json', JSON.stringify(results), function (err) {
    	if (err) throw err;
    	console.log('Saved!');
    });
});

connection.end();
 




