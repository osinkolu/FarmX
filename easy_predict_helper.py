# -*- coding: utf-8 -*-
"""
Created on Friday September 16 02:09:00 2022

@author: Olufemi Victor Tolulope. @osinkolu on github.
Comments and explanations done by Olufemi Victor Tolulpe.

"""


import pandas as pd
import json
import os
import requests

Open_weathermaps_api_key = "2f5e2e8666c3aee09073507960194baa"

#os.environ["Open_weathermaps_api_key"]
#print(Open_weathermaps_api_key)

all_data = pd.read_csv("Victor_Nigerian_soil_database.csv")

class easy_parameter_finders:

    def get_parameters(self, coordinates,all=False):
        nearest_coordinates = self.get_nearest_coordinates(coordinates)
        if all:
            return(all_data[all_data['coordinates']==str(nearest_coordinates)].to_json(orient='records'))
        else:
            return(all_data[all_data['coordinates']==str(nearest_coordinates)][['N','P','K','pH']].values[0])


    def get_nearest_coordinates(self, coordinates):
        coordinates_list = [(all_data["X"][i],all_data["Y"][i]) for i in range(len(all_data))]
        return(min(coordinates_list, key=lambda c: (c[0]- coordinates[0])**2 + (c[1]-coordinates[1])**2))

    def get_weather_params(self, coordinates, all=False):
        lat, lon = coordinates
        url = "https://api.openweathermap.org/data/2.5/weather?lat={}&lon={}&appid={}".format(lat,lon,Open_weathermaps_api_key)
        response = requests.request("GET", url, headers={}, data={})
        if all:
            return(json.loads(response.text))
        else:
            if 'rain' in json.loads(response.text):
                rain = json.loads(response.text)['rain']['1h']
            else:
                rain = 0
            humidity  = json.loads(response.text)['main']['humidity']
            temperature_K = json.loads(response.text)['main']['temp']
            temperature_c = temperature_K - 273.15
            return(rain, humidity, temperature_c)

    def collate_data(self,coordinates):
        N,P,K,pH = self.get_parameters(coordinates)
        rain, humidity, temperature_c = self.get_weather_params(coordinates)
        dictionary =     { "raw_values":[ {
            "N":N,
            "P":P,
            "K":K,
            "temperature":temperature_c,
            "humidity":humidity,
            "ph":pH,
            "rainfall": rain
        }
            ]}
        return(dictionary)

    def dump_all_data(self, coordinates):
        dump = {
        "#### climate ####":(self.get_weather_params((7.196450,9.048933), all=True)),
        "#### Soil ####": json.loads(self.get_parameters((7.196450,9.048933), all=True)),
        "#### Description ####": "The climate data is pulled from open weather maps API, the soil data is a local data base which is still growing, we may have altered your location slightly to the closest location in the database while trying to pull up soil data for you."
}
        return dump