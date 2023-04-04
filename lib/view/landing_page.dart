import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/view/signUp.dart';
import 'package:agrotech_hackat/view/sign_in.dart';
import 'package:agrotech_hackat/view/splash_content.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../size_config.dart';
import '../widgets/animated_contaner.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "As a customer, you can",
      "body": """Order healthy fresh farm produce \nfrom vasrieties on our app.
""",
      "image": "assets/svgs/cucumber.jpg",
    },
    {
      "text": "As a farmer, you can",
      "body": """Upload your farm produce and \nget orders from customers.
""",
      "image": "assets/svgs/palm.jpg"
    },
       {
      "text": "Diagnose your plant health",
      "body": """Diagnose you plant health \nand get treatment suggestions.
""",
      "image": "assets/images/diagnose.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: h(88, context),
                right: w(24, context),
                left: w(24, context)),
            child: Container(
              height: h(512, context),
              width: w(327, context),
              decoration: BoxDecoration(
                  color: black,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"],
                        text: splashData[index]['text'],
                        body: splashData[index]['body'],
                        index: index,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: h(20, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(context, currentPage, index: index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: h(53, context), bottom: h(10, context)),
            child: button("Login", () {
              Get.to(() => const LogIn());
            }, white, mainGreen, mainGreen, h(49, context), w(327, context)),
          ),
          button("Sign Up", () {
            Get.to(() => const CreateAccount());
          }, mainGreen, white, mainGreen, h(49, context), w(327, context)),
        ],
      ),
    );
  }
}
