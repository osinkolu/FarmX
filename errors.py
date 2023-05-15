from flask import json, make_response, jsonify
from werkzeug.exceptions import HTTPException

# define an error handling function
def init_handler(app):

    # catch every type of exception
    @app.errorhandler(Exception)
    def handle_exception(e):

        #loggit()!          

        # return json response of error
        if isinstance(e, HTTPException):
            response = e.get_response()
            # replace the body with JSON
            response.data = json.dumps({
                "code": e.code,
                "name": e.name,
                "description": e.description,
            })
        else:
            # build response
            response = make_response(jsonify({"message": 'Something went wrong'}), 500)

        # add the CORS header
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.content_type = "application/json"
        return response