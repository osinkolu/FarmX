// To parse this JSON data, do
//
//     final easyPredictResponse = easyPredictResponseFromJson(jsonString);

import 'dart:convert';

EasyPredictResponse easyPredictResponseFromJson(String str) =>
    EasyPredictResponse.fromJson(json.decode(str));

String easyPredictResponseToJson(EasyPredictResponse data) =>
    json.encode(data.toJson());

class EasyPredictResponse {
  EasyPredictResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<String>? data;

  factory EasyPredictResponse.fromJson(Map<String, dynamic> json) =>
      EasyPredictResponse(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
