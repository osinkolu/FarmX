import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/view/sign_in.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:agrotech_hackat/widgets/textField.dart';
import 'package:agrotech_hackat/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../size_config.dart';
import 'controller.dart';

class SignUp4 extends StatefulWidget {
  const SignUp4(
      {Key? key,
      required this.fullNameController,
      required this.passwordController,
      required this.phone,
      required this.function,
      required this.confirmPasswordController})
      : super(key: key);
  final TextEditingController fullNameController,
      phone,
      passwordController,
      confirmPasswordController;
  final Function function;

  @override
  State<SignUp4> createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool re_enterPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    FirebaseController controller = Get.put(FirebaseController());
    return Padding(
      padding: EdgeInsets.only(top: h(32, context)),
      child: Padding(
        padding: EdgeInsets.only(left: w(24, context), right: w(24, context)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: h(10, context), top: h(10, context)),
                child: title(context, "Full Name"),
              ),
              textField(controller.nameController, TextInputType.name,
                  "Enter Full Name", true,
                  hintText: "Enter Full Name"),
              Padding(
                padding: EdgeInsets.only(
                    bottom: h(10, context), top: h(10, context)),
                child: title(context, "Phone Number"),
              ),
              textField(controller.phoneController, TextInputType.number,
                  "Enter Phone Number", true,
                  hintText: "Enter Phone Number", maxLenght: 11),
              Padding(
                padding: EdgeInsets.only(
                    bottom: h(10, context), top: h(10, context)),
                child: title(context, "Password"),
              ),
              TextFormField(
                  obscureText: !passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                  controller: controller.passwordController,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value == null) {
                      return "Password length must be at least 8 characters";
                    } else if (value.length < 8) {
                      return "Password length must be at least 8 characters";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "minimum of 8 characters",
                      hintStyle:
                          TextStyle(fontSize: w(14, context), color: grey),
                      fillColor: fill,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: passwordVisible ? mainGreen : grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: fill,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 1.0, color: mainGreen)),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.red)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.red)))),
              Padding(
                padding: EdgeInsets.only(
                    bottom: h(10, context), top: h(10, context)),
                child: title(context, "Confirm Password"),
              ),
              TextFormField(
                  obscureText: !re_enterPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                  controller: controller.confirmPasswordController,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value == null) {
                      return "Please Re-enter your password";
                    } else if (controller.confirmPasswordController.text !=
                        controller.passwordController.text) {
                      return "Password Mismatch";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "minimum of 8 characters",
                      hintStyle:
                          TextStyle(fontSize: w(14, context), color: grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          re_enterPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: re_enterPasswordVisible ? mainGreen : grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            re_enterPasswordVisible = !re_enterPasswordVisible;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: fill,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 1.0, color: mainGreen)),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.red)))),
              SizedBox(
                height: h(50, context),
              ),
              button(
                "Sign Up",
                () {
                  _formKey.currentState!.validate()
                      ? controller.signupUser()
                      : null;
                },
                white,
                mainGreen,
                mainGreen,
                h(49, context),
                w(327, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: h(26, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: grey,
                          fontSize: w(14, context),
                          fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()));
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                            color: mainGreen,
                            fontSize: w(14, context),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
