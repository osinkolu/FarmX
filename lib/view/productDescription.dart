import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/size_config.dart';
import 'package:agrotech_hackat/view/cart.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/productAdd.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key, required this.product}) : super(key: key);
  final Map product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int increment = 1;

  increase() {
    if (increment < int.parse(widget.product["quantity"])) {
      setState(() {
        increment++;
      });
    }
  }

  reduce() {
    if (increment > 1) {
      setState(() {
        increment--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: h(23, context), right: w(23, context), left: w(23, context)),
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  maxRadius: w(16, context),
                  backgroundColor: lightGreen,
                  child: Icon(Icons.cancel_outlined , color:mainGreen, size: w(25, context),),
                ),
              ),
            ],
          ),
          SizedBox(height: h(10, context)),
          SizedBox(
            height: h(276, context),
            width: w(322, context),
            child: Image.asset(
              widget.product["image"],
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: h(10, context)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: h(10, context), bottom: h(10, context)),
                child: Text(widget.product["name"],
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: black,
                        fontSize: w(24, context))),
              ),
              Spacer(),
              CircleAvatar(
                maxRadius: w(16, context),
                backgroundColor: mainGreen,
                child: Icon(
                  Icons.favorite_border,
                  color: white,
                ),
              ),
            ],
          ),
          SizedBox(height: h(10, context)),
          Row(
            children: [
              Text(widget.product["farm"],
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: grey,
                      fontSize: w(16, context))),
              Spacer(),
              Icon(Icons.location_on, color: mainGreen),
                      Text("3km away from you",style: TextStyle( fontSize: w(12,context), color: grey),)
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: h(24, context), bottom: h(24, context)),
            child: Row(
              children: [
                Text(
                    "${widget.product["price"]}/${widget.product["totalUnit"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: mainGreen,
                        fontSize: w(24, context))),
                Spacer(),
                productAdd(context, increment, increase, reduce),
              ],
            ),
          ),
          Row(children: [
            SvgPicture.asset(
              "assets/svgs/shoppingbag.svg",
              semanticsLabel: "Bag",
              color: mainGreen,
              height: h(20, context),
              width: w(20, context),
            ),
            Text(
              "${widget.product["quantity"]} bags",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: mainGreen,
                  fontSize: w(14, context)),
            ),
            Text(
              " left",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: grey,
                  fontSize: w(14, context)),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(top: h(24, context)),
            child: Text(widget.product["description"],
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: grey,
                    fontSize: w(12, context))),
          ),
          Padding(
            padding: EdgeInsets.only(top: h(24, context)),
            child: button("Buy Now", () {
              Get.to(() => const Cart());
            }, white, mainGreen, mainGreen, h(49, context), w(327, context)),
          )
        ]),
      ),
    ));
  }
}
