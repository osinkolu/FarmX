import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import "package:get/get.dart";
import '../models/analyse_response.dart';
import '../models/prediction_model.dart';
import 'package:http/http.dart' as http;
import '../services/dio client/analysis client/analysis_client.dart';

class ClientsRepository extends GetxController {
  late Dio _dio;
  late ApiClient _apiClient;

  ClientsRepository() {
    _dio = _getDio();
    _apiClient = ApiClient(_dio);
  }

  Dio _getDio() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
        headers: {
          // "authorization": "Bearer $token",
        },
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors.addAll([
        PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseBody: false,
            request: false),
      ]);
    }
    return dio;
  }

  // Create User
  Future<AnalyseResponse> fetchAnalysisData(
      File file, Map<String, String> userDetails) async {
    try {
      // final _response = await _apiClient.analysRequest(file, userDetails);

      var headers = userDetails;
      var request = http.MultipartRequest('POST',
          Uri.parse('https://crop-analysis-gzhmfjnevq-uc.a.run.app/analyze'));
      request.files.add(await http.MultipartFile.fromPath('image', file.path));
      request.fields.addAll(userDetails);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return AnalyseResponse.fromJson(
            jsonDecode(await response.stream.bytesToString()));
      } else {
        print(response.reasonPhrase);
        EasyLoading.showError(
            "Error Occured: ${response.reasonPhrase} \n You can try reducing the Threshold value",
            duration: const Duration(seconds: 10));
        return AnalyseResponse();
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString(),
          duration: const Duration(seconds: 10));
      return AnalyseResponse();
    }
  }

  Future<PredictResponse> fetchPredictData(
      File file, Map<String, dynamic> userDetails) async {
    try {
      final _response = await _apiClient.predictRequest(file, userDetails);

      return _response;
    } on DioError catch (e) {
      EasyLoading.dismiss();
      if (e.type == DioErrorType.response) {
        return PredictResponse();
      }
      if (e.type == DioErrorType.connectTimeout) {
        return PredictResponse();
      }
      if (e.type == DioErrorType.receiveTimeout) {
        return PredictResponse();
      }
      if (e.type == DioErrorType.other) {
        return PredictResponse();
      }
      return PredictResponse();
    }
  }
}
