# -*- coding: utf-8 -*-
"""
@author: Professor
"""

"""
{
"raw_values":[
    {
        "N":9000,
        "P":4200,
        "K":4300,
        "temperature":200.87974371,
        "humidity":802.00274423,
        "ph":60.502985292,
        "rainfall":2020.9355362
    }
        ]
}
"""

import json
from flask import Flask,render_template,request, jsonify
from flask_cors import CORS, cross_origin
from models.classifier import classify
from easy_predict_helper import easy_parameter_finders

app = Flask(__name__)
cors = CORS(app) #Allow Cross Origin
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/')
@cross_origin()
def index():
    return("Welcome, please smile more")

@app.route("/predict", methods=["GET", "POST"])
@cross_origin()
def predict():
    raw_data = request.get_json(force=True)
    return json.dumps(classify(raw_data))

@app.route("/easy_predict", methods=["GET", "POST"])
@cross_origin()
def easy_predict():
    data = request.get_json(force=True)
    coordinates = (data['lat'], data['lon'])
    print(coordinates)
    easy = easy_parameter_finders()
    try:
        raw_data = easy.collate_data(coordinates)
    except Exception:
        easy_predict_response = {"status": bool(0),"data": ["Your location is very far from all the locations on the database"]}
        return(easy_predict_response)
    easy_predict_response = {"status": bool(1),"data": classify(raw_data)}
    return (easy_predict_response)

@app.route("/data_dump", methods=["GET", "POST"])
@cross_origin()
def data_dump():
    data = request.get_json(force=True)
    coordinates = (data['lat'], data['lon'])
    print(coordinates)
    easy = easy_parameter_finders()
    raw_data = easy.dump_all_data(coordinates)
    return (raw_data)


if __name__ =="__main__":
    app.run(host='0.0.0.0', port=8080)
