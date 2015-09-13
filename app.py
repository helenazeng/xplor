from __future__ import absolute_import
from collections import OrderedDict
import json
import os

from flask import Flask, render_template, request, redirect, session
import requests

from geopy.distance import vincenty


app = Flask(__name__, static_folder='static', static_url_path='')
app.requests_session = requests.Session()
app.secret_key = os.urandom(24)

with open('config.json') as f:
	config = json.load(f)

global my_dict
my_dict = {}

# use decorators to link the function to a url
@app.route('/health',methods=['GET'])
def health():
	"""Check the status of the app"""
	return ';-)'

@app.route('/uberprice')
def uberprice():
	# Gives estimates for time, 
	url = config.get('base_uber_url') + 'estimates/price'
	params = {
		'start_latitude': config.get('start_latitude'),
		'start_longitude': config.get('start_longitude'),
		'server_token': config.get('server_token'),
		'end_latitude': config.get('end_latitude'),
		'end_longitude': config.get('end_longitude'),
	}

	response = app.requests_session.get(
	                                    url,
	                                    params=params,
	                                    )
	if response.status_code != 200:
		return 'There was an error', response.status_code
	binary = response.content
	output = json.loads(binary)
	uberX = output['prices'][0]
	uberXL = output['prices'][1]
	uberSELECT = output['prices'][5]

	return render_template(
	                       'home.html',
	                       endpoint='products',
	                       uberx=uberX,
	                       uberxl=uberXL,
	                       uberselect=uberSELECT,
	                       )


@app.route('/expedia')
def expedia():
	api_key = "uoxquw9WjwGe6XrIMr4LIydfvdD6PvET"
	url = 'http://terminal2.expedia.com/x/hotels?location=42.284707,-83.741527&radius=5km&apikey=' + api_key


	response = app.requests_session.get(
	                                    url,
	                                    )

	data = response.json()
	with open("hotel.json", 'w') as i:
		for item in range(7):
			binary = response.content
			output = json.loads(binary)
			location = (output['HotelInfoList'])['HotelInfo'][item]['Location']
			hotelID = (output['HotelInfoList'])['HotelInfo'][item]['HotelID']
			starRating = (output['HotelInfoList'])['HotelInfo'][item]['StarRating']
			price = (output['HotelInfoList'])['HotelInfo'][item]['FeaturedOffer']['Price']['TotalRate']['Value']
			buy = (output['HotelInfoList'])['HotelInfo'][item]['DetailsUrl']
			image = (output['HotelInfoList'])['HotelInfo'][item]['ThumbnailUrl']
			latitude = output['HotelInfoList']['HotelInfo'][item]['Location']["GeoLocation"]["Latitude"] 
			longitude = output['HotelInfoList']['HotelInfo'][item]['Location']["GeoLocation"]["Longitude"] 

			dictionary = {
					'location': location,
					'hotelID': hotelID,
					'starRating': starRating,
					'price': price,
					'buy': buy,
					'image': image,
					'latitude': latitude,
					'longitude': longitude,
					}

			a2 = (42.284707, -83.741527)
			t1 = (dictionary['latitude'], dictionary['longitude'])

			distance = vincenty(a2, t1).miles
			my_dict.update(dictionary)
			dis = {
				'distance': distance,

			}
			my_dict.update(dis)
			json.dump(my_dict, i, ensure_ascii=False)

		
		# OrderedDict(sorted(my_dict.items(), key=lambda t: t[1]))

	return render_template('hotel.json', token=dictionary)


@app.route('/flights')
def flights():
	
	api_key = "AIzaSyB6JIWZK9O9-9t4nJCVUQGoK0sqY-5YCLk"
	url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=" + api_key
	headers = {'content-type': 'application/json'}

	params = {
	  "request": {
	    "slice": [
	      {
	        "origin": "DTW",
	        "destination": "JFK",
	        "date": "2015-09-13"
	      }
	    ],
	    "passengers": {
	      "adultCount": 1
	    },
	    "solutions": 3,
	    "refundable": False
	  }
	}

	response = requests.post(url, data=json.dumps(params),headers=headers
	                                    )
	json_data = response.json()

	with open("hotel.json", 'w') as f:
		for item in range(2):
			saleTotal = json_data["trips"]['tripOption'][item]["saleTotal"]
			flight_duration_hrs = (json_data['trips']['tripOption'][0]['slice'][0]["duration"]) / 60
			flight_duration_min = (json_data['trips']['tripOption'][0]['slice'][0]["duration"]) % 60
			flight = json_data['trips']['tripOption'][0]['slice'][0]["segment"][0]["flight"]
			departure_time = json_data['trips']['tripOption'][0]['slice'][0]["segment"][0]["leg"][item]['departureTime']
			arrival_time = json_data['trips']['tripOption'][0]['slice'][0]["segment"][0]["leg"][item]['arrivalTime']
			origin = json_data['trips']['tripOption'][0]['slice'][0]["segment"][0]["leg"][item]['origin']
			destination = json_data['trips']['tripOption'][0]['slice'][0]["segment"][0]["leg"][item]['destination']

			dictionary = {
				'price': saleTotal,
				'flight': flight,
				'origin': origin,
				'departure_time': departure_time,
				'arrival_time': arrival_time,
				'destination':destination,
				'flight_duration_hrs':flight_duration_hrs,
				'flight_duration_min':flight_duration_min

			}

			
			my_dict.update(dictionary)
			json.dump(my_dict, i , ensure_ascii=False)


	return render_template('hotel.json', token=my_dict)


if __name__ == '__main__':
    app.run(debug=True)
