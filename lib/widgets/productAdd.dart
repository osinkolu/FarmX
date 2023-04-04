import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../size_config.dart';

Widget productAdd(BuildContext context,int value, Function increase, Function reduce) {
  return Row(
    children: [
        InkWell(
                  onTap: () {
                    increase();
                  },
                  child: CircleAvatar(
                    maxRadius: w(16, context),
                    backgroundColor: lightGreen,
                    child: Text("+",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainGreen,
                            fontSize: w(20, context))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: black,
                          fontSize: w(20, context))),
                ),
                InkWell(
                  onTap: () {
                    reduce();
                  },
                  child: CircleAvatar(
                    maxRadius: w(16, context),
                    backgroundColor: lightGreen,
                    child: Text("-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainGreen,
                            fontSize: w(20, context))),
                  ),
                ),
    ],
  );
}
