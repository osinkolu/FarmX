import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';
import 'controller.dart';

class SignUp1 extends StatefulWidget {
  SignUp1({Key? key, required this.user, required this.function})
      : super(key: key);
  String user;
  final Function function;

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  FirebaseController controller =
      Get.put(FirebaseController(), permanent: true);
  int _index = 0;
  String user = "";
  List types = [
    {"name": "As a Farmer", "value": "farmer"},
    {"name": "As a Customer", "value": "customer"}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: h(32, context)),
      child: SizedBox(
        height: h(580, context),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: w(327, context),
                  height: h(120, context),
                  decoration: BoxDecoration(
                      color: fill,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: w(16, context), top: h(25, context)),
                        child: selectType(types, 1),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: w(16, context), bottom: h(35, context)),
                        child: selectType(types, 0),
                      ),
                    ],
                  )),
              Spacer(),
              button("Next", () {
                widget.function();
              }, white, mainGreen, mainGreen, h(49, context), w(327, context)),
              SizedBox(
                height: h(32, context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectType(type, index) {
    return InkWell(
      onTap: () {
        setState(() {
          _index = index;
        });
        user = type[index]["value"];
        // print(user);
        widget.user = user;
        controller.userType = user;
      },
      child: Row(
        children: [
          Text(
            type[index]["name"],
            style: TextStyle(
                color: grey,
                fontSize: h(16, context),
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          circularButton(index)
        ],
      ),
    );
  }

  circularButton(index) {
    return Padding(
      padding: EdgeInsets.only(right: w(16, context)),
      child: Container(
          width: w(20, context),
          height: h(20, context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fill,
            border:
                Border.all(color: index != _index ? grey : mainGreen, width: 1),
            // borderRadius: const BorderRadius.all(Radius.circular(16)
          ),
          child: index == _index
              ? Center(
                  child: Icon(
                  Icons.check,
                  color: mainGreen,
                  size: 12,
                ))
              : Container()),
    );
  }
}
