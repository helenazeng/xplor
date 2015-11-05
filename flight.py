from __future__ import print_function
import json
from datetime import date, datetime, timedelta
import mysql.connector
import random
import string
import re
from mysql.connector import (connection)

# from blockchain import util 

import requests
  
api_key = "AIzaSyAj5cCIIpeDtSqKX8gN6UNzTAO-SOmMQVk"
url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=" + api_key
headers = {'content-type': 'application/json'}


params = {
  "request": {
    "slice": [
      {
        "origin": "DTW",
        "destination": "BOS",
        "date": "2015-11-11"
      }
    ],
    "passengers": {
      "adultCount": 1
    },
    "solutions": 5,
    "refundable": False
  }
}

response = requests.post(url, data=json.dumps(params), headers=headers)
json_data = response.json()

cnx = connection.MySQLConnection(user='root', password='mysql',
                                 host='localhost',
                                 database='xplor_local')
cursor = cnx.cursor()
tomorrow = datetime.now().date() + timedelta(days=1)

for item in range (6):
  saleTotal = json_data["trips"]["tripOption"][item]["saleTotal"]
  flight_duration_hrs = json_data["trips"]["tripOption"][item]["slice"][0]["duration"] / 60
  flight_duration_min = json_data["trips"]["tripOption"][item]["slice"][0]["duration"] % 60
  carrier = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["flight"]["carrier"]
  flight_number = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["flight"]["number"]
  departure_time = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['departureTime']
  arrival_time = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['arrivalTime']
  origin = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['origin']
  destination = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['destination']
  saleTotal = re.sub("[^0-9\.]", "", saleTotal)

  encoded = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(10))
  print(encoded)

  if flight_duration_min >= 0 and flight_duration_min <= 9: 
    time = str(flight_duration_hrs) + ":" + str(flight_duration_min).zfill(2)
    
  else:
    time = str(flight_duration_hrs) + ":" + str(flight_duration_min)

  airline = ""
  vendor = ""
  if carrier == "B6":
    vendor = "JetBlue"
  elif carrier == "NK":
    vendor = "Spirit Airlines"
  else:
    vendor = carrier

  airline = carrier + " " + flight_number




  insert_stmt = (
  "INSERT INTO flight_info (vendor, saleTotal, time, airline, departure_time, arrival_time, origin, destination, id) "
  "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
  )
  data = (vendor, saleTotal, time, airline, departure_time, arrival_time, origin, destination, encoded)
  cursor.execute(insert_stmt, data)

  # Make sure data is committed to the database
cnx.commit()

cursor.close()

cnx.close()


# @app.rout('/payment')
# def payment():

# 	class ReceiveResponse:

#     	def __init__(self, fee_percent, dest, input, callback):
#         self.fee_percent = fee_percent
#         self.destination_address = dest
#         self.input_address = input
#         self.callback_url = callback

# 		def receive(dest_addr, callback, api_code = None):
#     """Call the 'api/receive' endpoint and create a forwarding address.
    
#     :param str dest_addr: destination address where the payment should be sent
#     :param str callback: callback URI that will be called upon payment
#     :param str api_code: Blockchain.info API code (optional)
#     :return: an instance of :class:`ReceiveResponse` class
#     """
    
# 	    	params = { 'method': 'create', 'address': '1NDpZ2wyFekVezssSXv2tmQgmxcoHMUJ7u ', 'callback': '/api/receive?method=create&cors=true&format=plain&address=1NDpZ2wyFekVezssSXv2tmQgmxcoHMUJ7u&shared=false&callback=http%3A%2F%2F45.79.164.166%2Fpayment'}
# 	    	resp = util.call_api('api/receive', params)
# 	    	json_resp = json.loads(resp)
# 	    	payment_response = ReceiveResponse(json_resp['fee_percent'],
# 	                                        json_resp['destination'],
# 	                                        json_resp['input_address'],
# 	                                        json_resp['callback_url'])
# 	    	return payment_response

