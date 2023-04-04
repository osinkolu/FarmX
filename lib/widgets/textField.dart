// This returns a textformfield with the given hint and controller

import 'package:agrotech_hackat/constants/colors.dart';
import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, TextInputType type,
    String errorText, bool required,
    {String hintText = "", int? maxLenght, bool? obscured = false, bool? isEmail = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
        maxLength: maxLenght,
        keyboardType: type,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        controller: controller,
        validator: required
            ? (value) {
                if (value!.isEmpty) {
                  return errorText;
                }else if (isEmail!){
                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return "Please enter a valid email";
                  }
                }
                return null;
              }
            : null,
        obscureText: obscured!,
        decoration: InputDecoration(
            fillColor: fill,
            filled: true,
            hintText: 
              hintText,
              hintStyle:  TextStyle(
                  color: grey, fontWeight: FontWeight.w400),
            
            //hintText: hintText,
            contentPadding: const EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  width: 1.0,
                  color: fill,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 1.0, color: mainGreen)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 1.0, color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 1.0, color: Colors.red)))),
  );
}


