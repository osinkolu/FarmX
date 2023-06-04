import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class IotController extends GetxController {
  bool isLoading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  var result = {};

  FirebaseDatabase database = FirebaseDatabase.instance;

  fetchData() async {
    isLoading = true;
    update();
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('farmx_iot');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      result = data as Map;
      print(data);
      update();
    });

    update();
    isLoading = false;
  }
}
