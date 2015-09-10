# use decorators to link the function to a url
@app.route('/')
def home():
	parameters = {
		'origin': 'Mosher-Jordan Hall, Ann Arbor, MI 48109',
		'destination': 'New York, NY',
		'key': 'AIzaSyAj5cCIIpeDtSqKX8gN6UNzTAO-SOmMQVk',
	}
	url = 'https://maps.googleapis.com/maps/api/directions/json?parameters'


	response = requests.get(url, params=parameters)
	data = response.json()
	return render_template('home.html', token=data)


@app.route('/price', methods=['GET'])
def price(): 
	# uber
	url = 'https://api.uber.com/v1/products'

	parameters = {
    	'server_token': 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
    	'latitude': 37.775818,
    	'longitude': -122.418028,
	}

	response = requests.get(url, params=parameters)

	# data = response.json()

	return render_template('home.html', token=response.text)
	url = config.get('https://api.uber.com/v1/products') + 'estimates/price'
	parameters = {
		'server_token': 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
    	'start_latitude': config.get('start_latitude'),
        'start_longitude': config.get('start_longitude'),
        'end_latitude': config.get('end_latitude'),
        'end_longitude': config.get('end_longitude'),
	}

if __name__ == '__main__':
    app.run(debug=False)

