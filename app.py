from __future__ import absolute_import

import json
import os

from flask import Flask, render_template, request, redirect, session
import requests

app = Flask(__name__, static_folder='static', static_url_path='')
app.requests_session = requests.Session()
app.secret_key = os.urandom(24)

# use decorators to link the function to a url
@app.route('/')
def home():
	url = 'https://api.uber.com/v1/products'

	parameters = {
    	'server_token': 'gDVK4AzgzSuBcvA5t8oG6P7BfdtdBveGVWGWt1Kq',
    	'latitude': 37.775818,
    	'longitude': -122.418028,
	}

	response = requests.get(url, params=parameters)

	data = response.json()
	return render_template('home.html', token=data)


if __name__ == '__main__':
    app.run(debug=True)