import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../size_config.dart';
import '../view/productDescription.dart';

Widget productCard(BuildContext context, bool isFarm, Map farm) {
  return InkWell(
    onTap:(){Get.to(()=> ProductDescription(product: farm,));},
    child: Card(
      color: fill,
      child: SizedBox(
        height: h(165, context),
        width: w(108, context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
                      width: w(50, context),
                      height: h(50, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                            image: AssetImage(farm["image"]),
                            fit: BoxFit.cover),
                      ),
                    ),
              
                Text(farm["name"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: w(10, context),
                        fontWeight: FontWeight.w600,
                        color: black)),
                Text(farm["farm"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: w(10, context),
                        fontWeight: FontWeight.w600,
                        color: grey)),
              !isFarm?  Text(farm["price"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: w(14, context),
                        fontWeight: FontWeight.w600,
                        color: mainGreen)):Container(),
              ]),
        ),
      ),
    ),
  );
}
