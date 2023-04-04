import 'dart:io';

import 'package:agrotech_hackat/repo/analysis_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../models/analyse_response.dart';
import 'crop_analysis.dart';

class CropAnalysisController extends GetxController {
  RxString selectedImage = "".obs;
  var resp = AnalyseResponse().obs;
  RxInt selectedIndex = 0.obs;
  updateIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  var selectedLang = Language(
    name: 'English',
    code: 'en',
  ).obs;
  double value = 0.5;
  updateValue(double value) {
    this.value = value;
    update();
  }

  selectLanguage(Language lang) {
    selectedLang.value = lang;
    update();
  }

  selectImage(String path) {
    selectedImage.value = path;
    update();
  }

  List<Map<String, String>> langs = [
    {'name': 'English', 'code': 'en'},
    {'name': 'French', 'code': 'fr'},
    {'name': 'German', 'code': 'de'},
    {'name': 'Italian', 'code': 'it'},
    {'name': 'Spanish', 'code': 'es'},
    {'name': 'Portuguese', 'code': 'pt'},
    {'name': 'Russian', 'code': 'ru'},
    {'name': 'Chinese', 'code': 'zh'},
    {'name': 'Japanese', 'code': 'ja'},
    {'name': 'Korean', 'code': 'ko'},
    {'name': 'Arabic', 'code': 'ar'},
    {'name': 'Turkish', 'code': 'tr'},
    {'name': 'Hindi', 'code': 'hi'},
    {'name': 'Dutch', 'code': 'nl'},
    {'name': 'Swedish', 'code': 'sv'},
    {'name': 'Norwegian', 'code': 'no'},
    {'name': 'Danish', 'code': 'da'},
    {'name': 'Finnish', 'code': 'fi'},
    {'name': 'Polish', 'code': 'pl'},
    {'name': 'Romanian', 'code': 'ro'},
    {'name': 'Czech', 'code': 'cs'},
    {'name': 'Hungarian', 'code': 'hu'},
    {'name': 'Greek', 'code': 'el'},
    {'name': 'Bulgarian', 'code': 'bg'},
    {'name': 'Ukrainian', 'code': 'uk'},
    {'name': 'Hebrew', 'code': 'he'},
    {'name': 'Indonesian', 'code': 'id'},
    {'name': 'Malay', 'code': 'ms'},
    {'name': 'Vietnamese', 'code': 'vi'},
    {'name': 'Thai', 'code': 'th'},
    {'name': 'Bengali', 'code': 'bn'},
    {'name': 'Persian', 'code': 'fa'},
    {'name': 'Urdu', 'code': 'ur'},
    {'name': 'Tamil', 'code': 'ta'},
    {'name': 'Telugu', 'code': 'te'},
    {'name': 'Marathi', 'code': ' mr'},
    {'name': 'Hindi', 'code': 'hi'},
    {'name': 'Kannada', 'code': 'kn'},
    {'name': 'Malayalam', 'code': 'ml'},
    {'name': 'Sinhala', 'code': 'si'},
    {'name': 'Burmese', 'code': 'my'},
    {'name': 'Khmer', 'code': 'km'},
    {'name': 'Lao', 'code': 'lo'},
    {'name': 'Georgian', 'code': 'ka'},
    {'name': 'Amharic', 'code': 'am'},
    {'name': ' Somali', 'code': 'so'},
    {'name': 'Swahili', 'code': 'sw'},
    {'name': 'Zulu', 'code': 'zu'},
    {'name': 'Xhosa', 'code': 'xh'},
    {'name': 'Afrikaans', 'code': 'af'},
    {'name': 'Igbo', 'code': 'ig'},
    {'name': 'Yoruba', 'code': 'yo'},
    {'name': 'Hausa', 'code': 'ha'},
    {'name': 'Yiddish', 'code': 'yi'},
    {"name": 'Latin', "code": 'la'}
  ];

  List<Language> get languages => langs
      .map((e) => Language(name: e['name'], code: e['code']))
      .toList(growable: false);

  fetchAnalysis() async {
    if (selectedImage.value != "") {
      EasyLoading.show();
      ClientsRepository rep = Get.put(ClientsRepository());
      final data = await rep.fetchAnalysisData(File(selectedImage.value), {
        'threshold': value.toString(),
        'usecase': 'crop_disease',
        'language': selectedLang.value.code!
      });

      resp.value = data;
      update();
      if (resp.value.mainData != null) {
        Get.to(() => const CropAnalysis());
      }
      //print(data.toJson());
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError('Please select an image');
    }
    // Get.to(() => const PredictionsPage());
  }
}

class Language {
  Language({this.name, this.code});
  final String? name;
  final String? code;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
