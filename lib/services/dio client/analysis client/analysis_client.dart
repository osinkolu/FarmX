import 'dart:io';
import 'package:agrotech_hackat/models/data_dump_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../constants/env.dart';
import '../../../models/analyse_response.dart';
import '../../../models/prediction_model.dart';

part 'analysis_client.g.dart';

@RestApi(baseUrl: Env.analysis_baseurl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("predict")
  @MultiPart()
  Future<PredictResponse> predictRequest(
      @Part(name: "image") File files, @Headers() predictionBody);

  @POST("analyze")
  @MultiPart()
  Future<AnalyseResponse> analysRequest(
      @Part(name: "image") File files, @Headers() predictionBody);
}
