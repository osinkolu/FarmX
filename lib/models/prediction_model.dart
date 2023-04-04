// To parse this JSON data, do
//
//     final predictResponse = predictResponseFromJson(jsonString);

import 'dart:convert';

PredictResponse predictResponseFromJson(String str) =>
    PredictResponse.fromJson(json.decode(str));

String predictResponseToJson(PredictResponse data) =>
    json.encode(data.toJson());

class PredictResponse {
  PredictResponse({
    this.boundingBoxDetails,
    this.msg,
    this.numberOfPredictions,
  });

  List<List<dynamic>>? boundingBoxDetails;
  String? msg;
  int? numberOfPredictions;

  factory PredictResponse.fromJson(Map<String, dynamic> json) =>
      PredictResponse(
        boundingBoxDetails: json["bounding_box_details"] == null
            ? []
            : List<List<dynamic>>.from(json["bounding_box_details"]!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        msg: json["msg"],
        numberOfPredictions: json["number of predictions"],
      );

  Map<String, dynamic> toJson() => {
        "bounding_box_details": boundingBoxDetails == null
            ? []
            : List<dynamic>.from(boundingBoxDetails!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "msg": msg,
        "number of predictions": numberOfPredictions,
      };
}
