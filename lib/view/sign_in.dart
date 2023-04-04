import 'package:agrotech_hackat/size_config.dart';
import 'package:agrotech_hackat/view/signUp.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:agrotech_hackat/widgets/textField.dart';
import 'package:agrotech_hackat/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controller/userController.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  _submit() async {
    setState(() {
      isLoading = true;
    });
    String email = emailController.text;

    String password = passwordController.text;

    UserController().logIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.only(
                    left: w(24, context), right: w(24, context)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: h(72, context),
                                            bottom: h(74, context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: h(40, context),
                                              width: h(40, context),
                                              decoration: BoxDecoration(
                                                  color: fill,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                color: grey,
                                                size: 30,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Welcome \nBack!",
                                    style: TextStyle(
                                        fontSize: w(24, context),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: h(24, context),
                                        bottom: h(57, context)),
                                    child: Text(
                                        "Login to your existing account to place your \norder.",
                                        style: TextStyle(
                                            fontSize: w(14, context),
                                            fontWeight: FontWeight.w400,
                                            color: grey)),
                                  ),
                                  title(context, "Email Address"),
                                  textField(
                                      emailController,
                                      TextInputType.emailAddress,
                                      "Enter your email",
                                      true,
                                      hintText: "example@gmail.com",
                                      isEmail: true),
                                  title(context, "Password"),
                                  textField(
                                      passwordController,
                                      TextInputType.text,
                                      "Enter your password",
                                      true,
                                      hintText: "********",
                                      obscured: true),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: h(57, context)),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                              color: mainGreen,
                                              fontSize: w(14, context)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: button("Login", () {
                                    _formKey.currentState!.validate()
                                        ? _submit()
                                        : null;
                                  }, white, mainGreen, mainGreen, 49, 327)),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: h(26, context)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Didn't have an account?",
                                          style: TextStyle(
                                              color: grey,
                                              fontSize: w(14, context),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => const CreateAccount());
                                          },
                                          child: Text(
                                            " Sign Up",
                                            style: TextStyle(
                                                color: mainGreen,
                                                fontSize: w(14, context),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
