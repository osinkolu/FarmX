import 'package:flutter/material.dart';

const double design_height = 812.0;
const double design_width = 375.0;

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double h(double value, BuildContext context) {
  double convH = value * (getScreenHeight(context) / design_height);
  return convH;
}

double w(double value, BuildContext context) {
  double convW = value * (getScreenWidth(context) / design_width);
  return convW;
}
