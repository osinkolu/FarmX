import 'dart:convert';
import 'package:agrotech_hackat/constants/url.dart';
import 'package:agrotech_hackat/models/userModel.dart';
import 'package:get/get.dart';
import '../services/baseClient.dart';
import '../view/botowNav.dart';

class UserController extends GetxController with StateMixin {
  
  

  List<User> users = <User>[User()].obs;

 Future logIn(String email, String password) async {
    
     Get.off(()=> const BottomNavBar());
    final res = await BaseClient()
        .post(base_url, "login", {"userName": email, "password": password});
          Get.off(() => const BottomNavBar());
    if (res.statusCode == 200) {
      
      change(null, status: RxStatus.success());
      final user = User.fromJson((jsonDecode(res.body))["response"]);
      users.add(user);
      ;
     
      Get.off(() => const BottomNavBar());
    } else {
      // Get.off(()=> const BottomNavBar());
      // print(res);
    }
  }

Future  signUp(
    String name,
    String email,
    String password,
    String phone,
    String role,
  ) async {
     Get.off(() => const BottomNavBar());
    change(null, status: RxStatus.loading());
    final res = await BaseClient().post(base_url, "register", {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role
    });
  Get.off(() => const BottomNavBar());
    if (res.statusCode == 200) {
      change(null, status: RxStatus.success());
      final user = User.fromJson((jsonDecode(res.body))["user"]);
      users.add(user);
      Get.off(() => const BottomNavBar());
    } else {
      //print(res);
    }
  }
}
