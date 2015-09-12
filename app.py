from __future__ import absolute_import

import json
import os

from flask import Flask, render_template, request, redirect, session
import requests

app = Flask(__name__, static_folder='static', static_url_path='')
app.requests_session = requests.Session()
app.secret_key = os.urandom(24)

with open('config.json') as f:
	config = json.load(f)


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
	uberSELECT = output['prices'][2]

	return render_template(
	                       'home.html',
	                       endpoint='products',
	                       uberx=uberX,
	                       uberxl=uberXL,
	                       uberselect=uberSELECT,
	                       )


@app.route('/')
def home():
	# parameters = {
	# 	'origin': 'Mosher-Jordan Hall, Ann Arbor, MI 48109',
	# 	'destination': 'New York, NY',
	# 	'key': 'AIzaSyAj5cCIIpeDtSqKX8gN6UNzTAO-SOmMQVk',
	# }
	# url = 'https://maps.googleapis.com/maps/api/directions/json?parameters'


	# response = requests.get(url, params=parameters)
	# data = response.json()
	# return render_template('home.html', token=data)


# @app.route('/price', methods=['GET'])
# def price(): 
# 	# uber
# 	url = 'https://api.uber.com/v1/products'

# 	parameters = {
#     	'server_token': 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
#     	'latitude': 37.775818,
#     	'longitude': -122.418028,
# 	}

# 	response = requests.get(url, params=parameters)

# 	# data = response.json()

# 	return render_template('home.html', token=response.text)
# 	url = config.get('https://api.uber.com/v1/products') + 'estimates/price'
# 	parameters = {
# 		'server_token': 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
#     	'start_latitude': config.get('start_latitude'),
#         'start_longitude': config.get('start_longitude'),
#         'end_latitude': config.get('end_latitude'),
#         'end_longitude': config.get('end_longitude'),
# 	}
# def flights():
	api_key = "AIzaSyAj5cCIIpeDtSqKX8gN6UNzTAO-SOmMQVk"
	url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=" + api_key
	headers = {'content-type': 'application/json'}

	params = {
	  "request": {
	    "slice": [
	      {
	        "origin": "DTW",
	        "destination": "JFK",
	        "date": "2015-09-12"
	      }
	    ],
	    "passengers": {
	      "adultCount": 1
	    },
	    "solutions": 2,
	    "refundable": False
	  }
	}

	response = requests.post(url, data=json.dumps(params), headers=headers)
	data = response.json()
	return render_template('home.html',token=data)
	
@app.route('/expedia')
def expedia():
	api_key = "uoxquw9WjwGe6XrIMr4LIydfvdD6PvET"
	url = 'http://terminal2.expedia.com/x/hotels?location=42.284707,-83.741527&radius=5km&apikey=' + api_key


	response = app.requests_session.get(
	                                    url,
	                                    )

	data = response.json()

	with open("hotel.json", 'w') as i:
		for item in range(5):
			binary = response.content
			output = json.loads(binary)
			location = (output['HotelInfoList'])['HotelInfo'][item]['Location']
			hotelID = (output['HotelInfoList'])['HotelInfo'][item]['HotelID']
			starRating = (output['HotelInfoList'])['HotelInfo'][item]['StarRating']
			price = (output['HotelInfoList'])['HotelInfo'][item]['FeaturedOffer']['Price']['TotalRate']['Value']
			buy = (output['HotelInfoList'])['HotelInfo'][item]['DetailsUrl']
			image = (output['HotelInfoList'])['HotelInfo'][item]['ThumbnailUrl']
			dictionary = {
				'location': location,
				'hotelID': hotelID,
				'starRating': starRating,
				'price': price,
				'buy': buy,
				'image': image
			}


			json.dump(dictionary, i , ensure_ascii=False)

			my_dict.update(dictionary)

	return render_template('hotel.json', taken=my_dict)



if __name__ == '__main__':
    app.run(debug=True)
