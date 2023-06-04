import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:agrotech_hackat/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';
import 'controller.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2(
      {Key? key, required this.emailController, required this.function})
      : super(key: key);
  final TextEditingController emailController;
  final Function function;

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final _formKey = GlobalKey<FormState>();
  FirebaseController controller = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: h(32, context)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: w(24, context), right: w(24, context)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                textField(controller.emailController,
                    TextInputType.emailAddress, "Enter email", true,
                    hintText: "example@gmail.com", isEmail: true),
                SizedBox(
                  height: h(420, context),
                ),
                button("Next", () {
                  _formKey.currentState!.validate() ? widget.function() : null;
                }, white, mainGreen, mainGreen, h(49, context),
                    w(327, context)),
                SizedBox(
                  height: h(20, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
