import 'dart:io';
import 'package:agrotech_hackat/models/data_dump_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../constants/env.dart';
import '../../models/analyse_response.dart';
import '../../models/easy_predict_response.dart';
import '../../models/prediction_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Env.recommendation_url)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("predict")
  @MultiPart()
  Future<PredictResponse> predictRequest(
      @Part(name: "image") File files, @Headers() predictionBody);

  @POST("analyze")
  @MultiPart()
  Future<AnalyseResponse> analysRequest(
      @Part(name: "image") File image, @Headers() predictionBody);

  @POST("data_dump")
  Future<DataDumpResponse> getDataDump(
      @Body() Map<String, dynamic> predictionBody);
  @POST("easy_predict")
  Future<EasyPredictResponse> getEasyPredictData(
      @Body() Map<String, dynamic> predictionBody);
}
