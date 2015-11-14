from __future__ import print_function
import json
from datetime import date, datetime, timedelta
import mysql.connector
import random
import string
import re
import schedule
import time

from mysql.connector import (connection)

# from blockchain import util 

import requests
 

# A2, Boston, San Francisco, NYC, Detroit, Las Vegas, Miami, Sacramento
api_key = "AIzaSyAj5cCIIpeDtSqKX8gN6UNzTAO-SOmMQVk"
url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=" + api_key
headers = {'content-type': 'application/json'}


params = {
  "request": {
    "slice": [
      {
        "origin": "DTW",
        "destination": "BOS",
        "date": "2015-11-20"
      },
      {
        "origin": "DTW",
        "destination": "SFO",
        "date": "2015-11-20"        
      },
      {
        "origin": "DTW",
        "destination": "JFK",
        "date": "2015-11-20"        
      },
      {
        "origin": "DTW",
        "destination": "LAS",
        "date": "2015-11-20"        
      },
      {
        "origin": "DTW",
        "destination": "MIA",
        "date": "2015-11-20"        
      },
      {
        "origin": "DTW",
        "destination": "SMF",
        "date": "2015-11-20"        
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

for item in range (4):
  saleTotal = json_data["trips"]["tripOption"][item]["saleTotal"]
  flight_duration_hrs = json_data["trips"]["tripOption"][item]["slice"][0]["duration"] / 60
  flight_duration_min = json_data["trips"]["tripOption"][item]["slice"][0]["duration"] % 60
  carrier = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["flight"]["carrier"]
  flight_number = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["flight"]["number"]
  for i in range (1):
    departure_time = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['departureTime']
    arrival_time = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['arrivalTime']
    origin = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['origin']
    destination = json_data['trips']['tripOption'][item]['slice'][0]["segment"][0]["leg"][0]['destination']
    saleTotal = re.sub("[^0-9\.]", "", saleTotal)
    encoded = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(10))

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


