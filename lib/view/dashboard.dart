import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/controller/userController.dart';
import 'package:agrotech_hackat/size_config.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'signup pages/controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

UserController user = Get.put(UserController());

class _DashboardState extends State<Dashboard> {
  FirebaseController controller = Get.put(FirebaseController());
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  top: h(5, context),
                  right: w(23, context),
                  left: w(23, context)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: w(16, context),
                              backgroundColor: white,
                              child: SvgPicture.asset(
                                "assets/svgs/Profile.svg",
                                semanticsLabel: "Profile",
                                color: black,
                                height: h(15, context),
                                width: w(15, context),
                              ),
                            ),
                            Column(
                              children: [
                                Text(controller.userData['name'],
                                    style: TextStyle(
                                        color: black,
                                        fontSize: h(16, context),
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: h(182, context),
                        width: w(327, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: mainGreen,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(w(30, context)),
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: w(18, context),
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Total Orders",
                                      style: TextStyle(
                                          fontSize: w(12, context),
                                          color: white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      "N0",
                                      style: TextStyle(
                                          fontSize: w(18, context),
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "All Time Sales",
                                      style: TextStyle(
                                          fontSize: w(12, context),
                                          color: white,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                              Spacer(),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Account Balance",
                                      style: TextStyle(
                                          fontSize: w(12, context),
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: w(15, context)),
                                      child: Text(
                                        "N0.00",
                                        style: TextStyle(
                                            fontSize: w(18, context),
                                            color: white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Spacer(),
                                    button("Withdraw", () {}, mainGreen, white,
                                        white, h(50, context), w(153, context),
                                        fontSize: w(14, context),
                                        borderRadius: w(30, context))
                                  ])
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SizedBox(
                            width: w(20, context),
                            child: Center(
                                child: SvgPicture.asset(
                                    "assets/svgs/burger.svg"))),
                        title: Text("Scan Plant for disease recognition",
                            style: TextStyle(
                                fontSize: w(14, context), color: black)),
                      ),
                      ListTile(
                        leading: SizedBox(
                            width: w(20, context),
                            child: Center(
                                child: SvgPicture.asset(
                              "assets/svgs/Profile.svg",
                              color: mainGreen,
                            ))),
                        title: Text("Complete your Profile",
                            style: TextStyle(
                                fontSize: w(14, context), color: black)),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: w(100, context),
                              child: button("Today's", () {
                                setState(() {
                                  _index = 0;
                                });
                              },
                                  black,
                                  _index == 0 ? mainGreen : white,
                                  _index == 0 ? mainGreen : white,
                                  h(40, context),
                                  w(100, context),
                                  fontSize: w(14, context),
                                  borderRadius: w(30, context))),
                          SizedBox(
                              width: w(100, context),
                              child: button("Monthly", () {
                                setState(() {
                                  _index = 1;
                                });
                              },
                                  black,
                                  _index == 1 ? mainGreen : white,
                                  _index == 1 ? mainGreen : white,
                                  h(40, context),
                                  w(100, context),
                                  fontSize: w(14, context),
                                  borderRadius: w(30, context))),
                          SizedBox(
                              width: w(100, context),
                              child: button("All Time", () {
                                setState(() {
                                  _index = 2;
                                });
                              },
                                  black,
                                  _index == 2 ? mainGreen : white,
                                  _index == 2 ? mainGreen : white,
                                  h(40, context),
                                  w(100, context),
                                  fontSize: w(14, context),
                                  borderRadius: w(30, context))),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.only(top: h(30, context)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(w(30, context)),
                                  color: white),
                              width: w(160, context),
                              height: h(201, context),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: w(32, context),
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "New Orders",
                                    style: TextStyle(
                                        fontSize: w(12, context),
                                        color: grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: w(30, context),
                                        right: w(30, context)),
                                    child: Divider(
                                      color: fill,
                                    ),
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: w(32, context),
                                        color: link,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "In Progress",
                                    style: TextStyle(
                                        fontSize: w(12, context),
                                        color: grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h(30, context)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(w(30, context)),
                                  color: white),
                              width: w(160, context),
                              height: h(201, context),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: w(32, context),
                                        color: mainGreen,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                        fontSize: w(12, context),
                                        color: grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: w(30, context),
                                        right: w(30, context)),
                                    child: Divider(
                                      color: fill,
                                    ),
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: w(32, context),
                                        color: error,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Canceled",
                                    style: TextStyle(
                                        fontSize: w(12, context),
                                        color: grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      )
                    ]),
                  ),
                ],
              ))),
    );
  }
}
