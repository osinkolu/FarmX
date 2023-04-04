import 'package:flutter/material.dart';

Widget button(
  String title,
  Function ontap,
  Color textColor,
  Color buttonColor,
  Color borderColor,
  double height,
  double width,{double? fontSize,double? borderRadius}
) {
  return MaterialButton(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: borderColor)),
    onPressed: () {
      ontap();
    },
    child: Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize??20,
        fontWeight: FontWeight.w400,
      ),
    ),
    color: buttonColor,
    height: height,
    minWidth: width,
  );
}
