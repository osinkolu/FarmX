# FarmX - Crop Analysis API.

## Overview
The crop analysis API is built to perfrom detections on an image based on the selected agricultural use-case. Developers can leverage the API to make detections via the A.I models. This API tool is open source and requires no account setup to use.

## Tutorial
Tutorial on how to use the API is coming soon, however, it is a simple to use API.

## Technologies

1. Google Cloud Platform - Hosts deployment
2. Google Colab - Trained the model
3. Google Search - Helps with Top results on the label and more details regards curing.
4. Google Translate - Helps return all data in selected language.
5. Tensorflow by Google  - Finetuned model is the Efficientdet4 from the tensorflow hub.

## Support
For API support, please reach out on [LinkedIn](https://www.linkedin.com/in/olufemi-victor-tolulope/) or [Twitter](https://twitter.com/Osinkoluolufemi).

## Basic Authentication

Accesss to the API is granted freely, there is no authentication put in place currently

``` POST
    requests.post(
        url, files={'image': open('image.JPG', 'rb')}, headers = {
            'threshold': '0.5',
            'usecase': 'crop_disease',
            'language': 'en'
        }) 
```

## API Versioning
There will be subsequent versions of this API as frameworks change, models update, use cases expand and as it gets better. However, the API version you wish to access in the format `v{version_number}`

Currently version 1 of the API (most current) is hosted on **GCP** and accessible via: https://cropanalysis-zc6ytsujkq-uw.a.run.app/

## HTTP requests
All API requests are made by sending a secure HTTPS request using one of the following methods, depending on the action being taken:

* `POST` Create a resource
* `GET` Get a resource or list of resources

Please note that the headers are important to pass the use case, language and the threshold to setup the models.

## HTTP Responses
The response is very basic, there are two major end points in this project.

1. `/predict`

* for each detection, the API returns the position of the bounding boxes : left, right, top, bottom, prediction, probability of detection. Asides the list, the API also returns the message status and the number of detections found.

```
{
    "bounding_box_details": [
        [
            134,
            296,
            108,
            265,
            "Weeds",
            0.98828125
        ],
        [
            300,
            409,
            143,
            282,
            "Weeds",
            0.9296875
        ]
    ],
    "msg": "success",
    "number of predictions": 2
}
```
2. `/analyze`
* The Analyze endpoint goes futher to provide more details regards the disease and the latest curing methods. Also the endpoint sends in the label of the image without the bounding box information. In the `more_details` section of the response, the content includes:
- A brief about the label
- The topic of the next description
- The next description itself.

We provide all these as the topics and descriptions change based on the **model in use** and the **language selected**. Below are examples of responses.

* Usecase set to crop_disease

```
{
    "main_data": {
        "confidence": 0.60546875,
        "label": "Tomato Septoria leaf spot"
    },
    "more_details": {
        "about": "Septoria leaf spot is caused by the fungus Septoria lycopersici. This fungus can attack tomatoes at any stage of development, but symptoms usually first appear on the older, lower leaves and stems when plants are setting fruit. Symptoms usually appear on leaves, but can occur on petioles, stems, and the calyx.",
        "extra_topic": "Latest on curing Tomato Septoria leaf spot",
        "topic_description": "Septoria Leaf Spot of Tomato\nRemove diseased leaves. If caught early, the lower infected leaves can be removed and burned or destroyed.  \nImprove air circulation around the plants.  \nMulch around the base of the plants.  \nDo not use overhead watering.  \nControl weeds.  \nUse crop rotation.  \nUse fungicidal sprays."
    }
}
```

## HTTP Response Codes
Each response will be returned with one of the following HTTP status codes:

* `200` `OK` The request was successful
* `400` `Bad Request` There was a problem with the request (security, malformed, data validation, etc.)
* `404` `Not found` An attempt was made to access a resource that does not exist in the API
* `405` `Method not allowed` The resource being accessed doesn't support the method specified (GET, POST, etc.).
* `500` `Server Error` An error on the server occurred
* There are also tons of responses (well explained) which could be returned due to errors flagged on inference.

## Model Information(coming soon):

The information of each A.I model training will be made available, including the carbon footprint.

