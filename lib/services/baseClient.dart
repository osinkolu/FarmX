import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:agrotech_hackat/constants/url.dart';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class BaseClient {
  // ignore: constant_identifier_names
  static const int time_out_duration = 60;
  //GET
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(base_url + api);
    try {
      var response = await http
          .get(uri)
          .timeout(const Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  // GET with token 


  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
       // HttpHeaders.authorizationHeader: "Bearer $token",
      },)
          .timeout(const Duration(seconds: time_out_duration));
     // dialog("", jsonDecode(response.body)["message"]);
     print(response.body);
      return _processResponse(response);
    } on SocketException {
      //dialog("Error", "Check your Internet Connection");
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      //dialog("Error", "Not respnding");
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }






  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
     
        return response;
      case 201:
        return response;

      case 400:
     //errorSnack1( jsonDecode(response.body)["message"].toString());
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
           
      case 401:
      case 403:
     // dialog("Error", "UnAuthorized");
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
     // dialog("Error", "Bad Request");
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
      //dialog("Error", " Error Fetching data");
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
