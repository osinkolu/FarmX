import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:agrotech_hackat/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../size_config.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key, required this.codeController, required this.function}) : super(key: key);
 final  TextEditingController codeController;
 final Function function;

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final _formKey = GlobalKey<FormState>();
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
               PinCodeTextField(
                    defaultBorderColor: fill,
                    pinTextStyle: TextStyle(
                      color: grey,
                      fontSize: w(16,context),
                      fontWeight: FontWeight.w700,
                    ),
                    controller: widget.codeController,
                    pinBoxHeight: 51,
                    pinBoxWidth: 51,
                    pinBoxColor: fill,
                    pinBoxBorderWidth: 0,
                    highlightAnimation: true,
                    highlightColor: mainGreen,
                    pinBoxRadius:10,
                    highlightPinBoxColor: fill,
                    hasTextBorderColor:mainGreen
                   // pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
             
                SizedBox(
                  height: h(420, context),
                ),
                button("Skip", () {
                  _formKey.currentState!.validate()? widget.function():null;
                }, white, mainGreen, mainGreen,
                    h(49, context), w(327, context), ),
                    Padding(
                      padding:  EdgeInsets.only(top:h(26,context) ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't get the code?",style: TextStyle(color: grey,fontSize: w(14, context),fontWeight: FontWeight.w400),),
                        Text(" Resend",style: TextStyle(color: mainGreen,fontSize: w(14, context),fontWeight: FontWeight.w400),)
                      ],),
                    )
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
