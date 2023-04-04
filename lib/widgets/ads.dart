import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../size_config.dart';

Widget ads(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
                        top: h(20, context), bottom: h(33, context)),
    child: Container(
      height: h(165, context),
      width: w(327, context),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("You can advertise here", style: TextStyle(
        fontSize: w(24, context),
        fontWeight: FontWeight.w600,
        color: white,
      ),),
      SizedBox(height: h(15, context),),
       Text("here!", style: TextStyle(
        fontSize: w(20, context),
        fontWeight: FontWeight.w400,
        color: grey,
      ),)]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: mainGreen,
      ),
    ),
  );
}
