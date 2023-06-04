import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/controller/userController.dart';
import 'package:agrotech_hackat/view/signup%20pages/sign_up_page1.dart';
import 'package:agrotech_hackat/view/signup%20pages/sign_up_page4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../size_config.dart';
import 'signup pages/sign_up_page2.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final List _texts = [
    {
      "name": "Let’s help you get started",
      "sub": "How do you want to sign up?"
    },
    {
      "name": "Enter your email",
      "sub":
          "We’ll send 4 digits verification code to \nthe provided email address to verify \nemail."
    },
    {
      "name": "Enter verification code",
      "sub": "Enter the 4 digits verification code sent to"
    },
    {
      "name": "Let’s get you started!",
      "sub": "Create an account to start enjoying our service."
    }
  ];

  int _index = 1;

  String userType = "customer";
  String email = "";

  //List<AwesomeStepperItem> _steps = [];
  bool _isLoading = false;
  _submit() async {
    String email = emailController.text;
    String phone = phoneController.text;
    String fullName = fullNameController.text;
    String password = passwordController.text;
    setState(() {
      _isLoading = true;
    });
    UserController().signUp(fullName, email, password, phone, userType);
  }

  content() {
    if (_index == 1) {
      return SignUp1(user: userType, function: nextStep);
    } else if (_index == 2) {
      return SignUp2(
        emailController: emailController,
        function: nextStep,
      );
    } else if (_index == 3) {
      return SignUp4(
          fullNameController: fullNameController,
          phone: phoneController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          function: _submit);
    }
  }

  Map payLoad = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w(10, context)),
                          child: IconButton(
                            onPressed: () {
                              prevStep();
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                            color: Colors.black,
                            iconSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: w(24, context)),
                          child: Text(
                            "$_index of 4",
                            style: TextStyle(
                                fontSize: h(16, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: w(24, context), top: h(24, context)),
                      child: Text(
                        _texts[_index - 1]['name'],
                        style: TextStyle(
                            fontSize: h(16, context),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: w(24, context), top: h(24, context)),
                      child: Text(
                        _texts[_index - 1]['sub'],
                        style: TextStyle(
                            fontSize: h(14, context),
                            fontWeight: FontWeight.w600,
                            color: grey),
                      ),
                    ),
                    _index == 3
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: w(24, context), top: h(4, context)),
                            child: Text(
                              emailController.text,
                              style: TextStyle(
                                  fontSize: h(14, context),
                                  fontWeight: FontWeight.w700,
                                  color: black),
                            ),
                          )
                        : Container(),
                    content()
                  ],
                )),
    );
  }

  nextStep() {
    cont() {
      setState(() {
        _index < 4 ? _index++ : null;
      });
    }

    cont();
  }

  prevStep() {
    cont() {
      setState(() {
        _index > 1 ? _index-- : Get.back();
      });
    }

    cont();
  }
}
