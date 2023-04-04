import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/widgets/ads.dart';
import 'package:agrotech_hackat/widgets/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: w(24, context), right: w(24, context)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h(10, context)),
              child: Row(
                children: [
                  Text("Kings Tower, Ikoyi, Lagos State",
                      style: TextStyle(color: black)),
                  const Spacer(),
                  CircleAvatar(
                    radius: w(16, context),
                    backgroundColor: mainGreen,
                    child: SvgPicture.asset("assets/svgs/notification.svg",),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h(10, context)),
              child: Row(
                children: [
                  SizedBox(
                    width: w(283,context),
                    height: h(50, context),
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: fill,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: fill,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: fill,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: h(8, context)),
                        filled: true,
                        fillColor: fill,
                        hintText: "Enter your Search",
                        hintStyle: TextStyle(color: grey),
                        prefixIcon: Icon(Icons.search, color: grey),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: w(20, context),
                    backgroundColor: mainGreen,
                    child: SvgPicture.asset("assets/svgs/setting.svg"),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ads(context),
                  productCategory(context, "Latest"),
                  farmCategory(context, "Top Rated Farms"),
                  productCategory(context, "Picks for you"),
                  farmersCategory(context, "Your Favourite farmers",
                      "Here are the brands you use the most on Rideeat."),
                  ads(context),
                  farmCategory(context, "Most Patronized Farms"),
                   productCategory(context, "Most ordered Foods"),
                   ads(context)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
