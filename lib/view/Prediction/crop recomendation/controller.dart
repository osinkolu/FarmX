import 'package:agrotech_hackat/constants/env.dart';
import 'package:agrotech_hackat/view/Prediction/crop%20recomendation/predictions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../models/data_dump_response.dart';
import '../../../models/easy_predict_response.dart';
import '../../../repo/requests_repository.dart';

class RecommendationController extends GetxController {
  final Location location = Location();

  var searchController = TextEditingController();
  var long = 0.0.obs;
  var lat = 0.0.obs;
  var predictions = <AutocompletePrediction>[].obs;
  var fetchedPlace;
  RxBool placeSearched = false.obs;
  var recommendations = EasyPredictResponse().obs;
  var datadump = DataDumpResponse().obs;

  searchPlace() async {
    placeSearched.value = false;
    final places = FlutterGooglePlacesSdk(Env.gcp_key);
    final pred =
        await places.findAutocompletePredictions(searchController.text);
    predictions.value = pred.predictions;
    EasyLoading.dismiss();
    update();
  }

  fetchPlace(AutocompletePrediction place) async {
    EasyLoading.show();
    List<PlaceField> _placeFields = [
      PlaceField.Location,
    ];
    final places = FlutterGooglePlacesSdk(Env.gcp_key);
    final res = await places.fetchPlace(place.placeId, fields: _placeFields);
    EasyLoading.dismiss();
    long.value = res.place!.latLng!.lng;
    lat.value = res.place!.latLng!.lat;

    placeSearched.value = true;
    update();
  }

  proceed() {
    placeSearched.value
        ? () {
            fetchRecommendation();
            //Get.to(() => const PredictionsPage());
          }()
        : searchPlace();
  }

  fetchRecommendation() async {
    EasyLoading.show();
    ClientsRepository rep = Get.put(ClientsRepository());
    final dataDump =
        await rep.fetchDataDump({"lat": lat.value, "lon": long.value});

    datadump.value = dataDump;

    final recommendations =
        await rep.cropRecommendation({"lat": lat.value, "lon": long.value});
    this.recommendations.value = recommendations;
    print(recommendations.data);
    EasyLoading.dismiss();
    Get.to(() => const PredictionsPage());
  }

  /// Get current location

  getCurrentLocation() async {
    final permission = await Permission.location.request();
    if (permission.isGranted) {
      final locationData = await location.getLocation();
      lat.value = locationData.latitude!;
      long.value = locationData.longitude!;
      EasyLoading.show();
      ClientsRepository rep = Get.put(ClientsRepository());
      final dataDump =
          await rep.fetchDataDump({"lat": lat.value, "lon": long.value});

      datadump.value = dataDump;

      final recommendations =
          await rep.cropRecommendation({"lat": lat.value, "lon": long.value});
      this.recommendations.value = recommendations;
      print(recommendations.data);
      EasyLoading.dismiss();
      Get.to(() => const PredictionsPage());
    } else {
      EasyLoading.showError("Location Permission Denied");
    }

    EasyLoading.show();

    placeSearched.value = true;
    update();
  }
}
