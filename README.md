# FarmX - Crop Recommendation API

## Introduction
This is a flask API that recommends what kind of crop to plant, this project is part of a larger project to provide A.I tools to farmers.

### Dependencies

* [Python](https://www.python.org/) - Programming Language
* [Flask](https://flask.palletsprojects.com/) - The framework used
* [Pip](https://pypi.org/project/pip/) - Dependency Management
* [RESTful](https://restfulapi.net/) - REST docs


## Support
For API support, please reach out on [LinkedIn](https://www.linkedin.com/in/olufemi-victor-tolulope/) or [Twitter](https://twitter.com/Osinkoluolufemi).

## Basic Authentication and Usage

Accesss to the API is granted freely, there is no authentication put in place currently

The API has been deployed on **GCP** with CI-CD. It is accessible via: https://croprecommendation-zc6ytsujkq-uw.a.run.app/ you'll need to post your input Json format. 

There are two formats.

* Format one is when you provide all the data, below is the sample of the request we expect.

``` {
"raw_values":[
    {
        "N":90,
        "P":42,
        "K":43,
        "temperature":20.87974371,
        "humidity":82.00274423,
        "ph":60.502985292,
        "rainfall":202.9355362
    }
            ]                           
    }
```

* Format 2 is the lazy-format, we do everything for you, all you need to do is provide the longitude and lagitude.


{
    "lat":7.4905, 
    "lon":4.5521
}
    

### EndPoints.
1. `/predict`
returns the predicted plant to buy as a list:
Sample Output 
["rice"]

2. `/easy_predict`
returns the predicted plant to buy as a list:
Sample Output
["rice"]


3. `/data_dump`
returns a heavy json dump of all the data tracked at the backend.

```
{
    "#### Description ####": "The climate data is pulled from open weather maps API, the soil data is a local data base which is still growing, we may have altered your location slightly to the closest location in the database while trying to pull up soil data for you.",
    "#### Soil ####": [
        {
            "Ca": 618.0,
            "Cu": 2.65,
            "Depth": "0-15",
            "Depthcode": 1,
            "Farm": "TungaMaje",
            "Fe": 2.45,
            "K": 903.21,
            "Lat": 9.048933,
            "Long": 7.19645,
            "Mg": 133.2,
            "Mn": 0.0,
            "N": 0.031,
            "Na": 220.8,
            "OBJECTID": 1,
            "OC": 0.61,
            "P": 9.27,
            "X": 7.19645,
            "Y": 9.048933,
            "Zn": 0.99,
            "coordinates": "(7.19645000000003, 9.04893300000003)",
            "pH": 6.5,
            "project": "North central"
        }
    ],
    "#### climate ####": {
        "base": "stations",
        "clouds": {
            "all": 14
        },
        "cod": 200,
        "coord": {
            "lat": 7.1965,
            "lon": 9.0489
        },
        "dt": 1676069919,
        "id": 2318374,
        "main": {
            "feels_like": 300.02,
            "grnd_level": 988,
            "humidity": 13,
            "pressure": 1009,
            "sea_level": 1009,
            "temp": 301.49,
            "temp_max": 301.49,
            "temp_min": 301.49
        },
        "name": "Yandev",
        "sys": {
            "country": "NG",
            "sunrise": 1676007726,
            "sunset": 1676050445
        },
        "timezone": 3600,
        "visibility": 10000,
        "weather": [
            {
                "description": "few clouds",
                "icon": "02n",
                "id": 801,
                "main": "Clouds"
            }
        ],
        "wind": {
            "deg": 82,
            "gust": 1.82,
            "speed": 1.65
        }
    }
}
```


## Core Definitions

* "N" - Nitrogen level in the soil
* "P"  - Phosporus level in the soil
* "K" - Potassium level in the soil
* "Temperature" - The current temperature of the surroundings in degree celcius.
* "Humidiy" - Relative humidity.
* "PH" - The PH value of the soil
* "rainfall" - the rainfall value in mm

## API Versioning
There will be subsequent versions of this API as frameworks change, models update, use cases expand and as it gets better. However, the API version you wish to access in the format `v{version_number}`

Currently version 1 of the API (most current) is accessible via:
[this link](https://croprecommendation-zc6ytsujkq-uw.a.run.app/)

## HTTP requests
All API requests are made by sending a secure HTTPS request using one of the following methods, depending on the action being taken:

* `POST` Create a resource
* `GET` Get a resource or list of resources

## HTTP Responses
The HTTP response is very basic, the request returns a list of predictions, one prediction for each input sample.
```
["rice", "orange"]

```
## HTTP Response Codes
Each response will be returned with one of the following HTTP status codes:

* `200` `OK` The request was successful
* `400` `Bad Request` There was a problem with the request (security, malformed, data validation, etc.)
* `404` `Not found` An attempt was made to access a resource that does not exist in the API
* `405` `Method not allowed` The resource being accessed doesn't support the method specified (GET, POST, etc.).
* `500` `Server Error` An error on the server occurred

## Dataset Used to build model.
1. Crop dataset: Dataset is Openly Available on Kaggle and added to references. It was curated for the indian agricultural context.

2. Soil database: Data was curated by Olufemi Victor from over 10 data sources and open research from sources like FAO, IITA, etc. 

## References:
1. OCP Fertilizer Maize belt soils: [here](https://www.africageoportal.com/datasets/CSI::ocp-fertilizer-maize-belt-soils/explore?location=9.054579%2C8.646835%2C7.00)

2. Farms soils: [here](https://www.africageoportal.com/datasets/CSI::farms-soils-samples/explore?location=9.054579%2C8.646835%2C7.00)

3. IITA projects soils: [here](https://www.africageoportal.com/datasets/CSI::iita-projects-soils/explore?location=9.054579%2C8.646835%2C7.00)

4. Legacy soils and National surveys: [here](https://www.africageoportal.com/datasets/CSI::legacy-soils-and-national-surveys/explore?location=9.054579%2C8.646835%2C7.00)

5. Babagona soils Northern Nigeria: [here](
https://www.africageoportal.com/datasets/CSI::babagona-soils-northern-nigeria/explore?location=9.054579%2C8.646835%2C7.00)

6. New states 2003 data: [here](https://www.africageoportal.com/datasets/CSI::new-states-2003/explore?location=9.054579%2C8.646835%2C7.00)

7. IITA_field_soil:IITA_field_soil: [here](https://www.africageoportal.com/datasets/CSI::iita-field-soil/explore?location=7.475445%2C3.836997%2C14.62)

8. Crop Prediction Dataset: [here](https://www.kaggle.com/datasets/atharvaingle/crop-recommendation-dataset)

## Model Information(coming soon):

The information of the A.I model- training, validation and metrics will be made available soon.
