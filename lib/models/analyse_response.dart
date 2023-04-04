// To parse this JSON data, do
//
//     final analyseResponse = analyseResponseFromJson(jsonString);

import 'dart:convert';

AnalyseResponse analyseResponseFromJson(String str) =>
    AnalyseResponse.fromJson(json.decode(str));

String analyseResponseToJson(AnalyseResponse data) =>
    json.encode(data.toJson());

class AnalyseResponse {
  AnalyseResponse({
    this.mainData,
    this.moreDetails,
  });

  MainData? mainData;
  MoreDetails? moreDetails;

  factory AnalyseResponse.fromJson(Map<String, dynamic> json) =>
      AnalyseResponse(
        mainData: json["main_data"] == null
            ? null
            : MainData.fromJson(json["main_data"]),
        moreDetails: json["more_details"] == null
            ? null
            : MoreDetails.fromJson(json["more_details"]),
      );

  Map<String, dynamic> toJson() => {
        "main_data": mainData?.toJson(),
        "more_details": moreDetails?.toJson(),
      };
}

class MainData {
  MainData({
    this.confidence,
    this.label,
  });

  double? confidence;
  String? label;

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        confidence: json["confidence"]?.toDouble(),
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "confidence": confidence,
        "label": label,
      };
}

class MoreDetails {
  MoreDetails({
    this.about,
    this.extraTopic,
    this.topicDescription,
  });

  String? about;
  String? extraTopic;
  String? topicDescription;

  factory MoreDetails.fromJson(Map<String, dynamic> json) => MoreDetails(
        about: json["about"],
        extraTopic: json["extra_topic"],
        topicDescription: json["topic_description"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "extra_topic": extraTopic,
        "topic_description": topicDescription,
      };
}
