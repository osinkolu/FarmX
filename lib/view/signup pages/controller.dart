import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../botowNav.dart';

class FirebaseController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var typeController = TextEditingController();
  var userType = "customer";

  UserCredential? user;
  Map<String, dynamic> userData = {};

  Map<String, String> get signUpData => {
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "address": addressController.text,
        "type": userType,
      };

  signupUser() {
    signUp(emailController.text, passwordController.text);
  }

  /// Signup with Firebase

  Future<void> signUp(String email, String password) async {
    EasyLoading.show(status: "Signing Up");
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user != null) {
        this.user = user;
        uploadUserDetails(
          nameController.text,
          emailController.text,
          phoneController.text,
          addressController.text,
          userType,
        );

        print("User Created");
      } else {
        print("User not Created");
      }

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        EasyLoading.showError('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError('The account already exists for that email.');
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError('The email address is not valid.');
        print('The email address is not valid.');
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  //// upload userdetails to firestore

  Future<void> uploadUserDetails(String name, String email, String phone,
      String address, String type) async {
    EasyLoading.show(status: "Uploading Details");
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.user!.uid)
          .set({
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "type": type,
        "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
        'updatedAt': DateTime.now().millisecondsSinceEpoch.toString(),
      });
      getUserDetails();
    } catch (e) {
      print(e);
    }
  }

  /// Get user details from firestore

  Future<void> getUserDetails() async {
    EasyLoading.show(status: "Please wait...");
    try {
      final user = await FirebaseFirestore.instance
          .collection("users")
          .doc(this.user!.user!.uid)
          .get();
      userData = user.data()!;
      EasyLoading.dismiss();

      Get.offAll(() => const BottomNavBar());
    } catch (e) {
      print(e);
    }
  }

  /// sign in with Firebase

  Future<void> signIn(String email, String password) async {
    EasyLoading.show(status: "Signing In");
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      EasyLoading.dismiss();

      if (user != null) {
        this.user = user;
        print("User Signed In");
        getUserDetails();
      } else {
        print("User not Signed In");
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        EasyLoading.showError('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError('The email address is not valid.');
        print('The email address is not valid.');
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }
}
