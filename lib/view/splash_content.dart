import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
    required this.index,
    this.body,
  }) : super(key: key);
  final String? text, image, body;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h(20, context)),
          child: Container(
            width: w(327, context),
            height: h(368, context),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Text(text!,
            style: TextStyle(
                fontSize: w(18, context),
                fontWeight: FontWeight.w600,
                color: white)),
        Padding(
          padding: EdgeInsets.only(top: h(10, context), bottom: h(10, context)),
          child: Text(body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: w(12, context),
                  fontWeight: FontWeight.w400,
                  color: grey)),
        )
      ],
    );
  }
}
