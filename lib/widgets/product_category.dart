import 'package:agrotech_hackat/constants/productList.dart';
import 'package:agrotech_hackat/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../size_config.dart';

Widget productCategory(BuildContext context, String category) {
  return SizedBox(
    height: h(256, context),
    width: w(348, context),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h(22, context)),
          child: Row(
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: black),
              ),
              const Spacer(),
              Text(
                "See all",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainGreen),
              )
            ],
          ),
        ),
        SizedBox(
          height: 136,
          child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection:Axis.horizontal ,
           itemCount: products.length,
             itemBuilder:((context,index){ return productCard(context,false,  products[index]);}) ,
              
            
          ),
        )
      ],
    ),
  );
}


Widget farmCategory(BuildContext context, String category) {
  return SizedBox(
    height: h(256, context),
    width: w(348, context),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h(22, context)),
          child: Row(
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: black),
              ),
              const Spacer(),
              Text(
                "See all",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainGreen),
              )
            ],
          ),
        ),
        SizedBox(
          height: 136,
          child:ListView.builder(
            // shrinkWrap: true,
            scrollDirection:Axis.horizontal ,
           itemCount: products.length,
             itemBuilder:((context,index){ return productCard(context,false,  products[index]);}) ,
              
            
          ),
        )
      ],
    ),
  );
}


Widget farmersCategory(BuildContext context, String category,String text) {
  return SizedBox(
    height: h(256, context),
    width: w(348, context),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h(10, context)),
          child: Row(
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: black),
              ),
              const Spacer(),
              Text(
                "See all",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainGreen),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: h(10,context)),
          child: Text(text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: w(12, context),
                  fontWeight: FontWeight.w600,
                  color: grey)),
        ),

        SizedBox(
          height: 136,
          child:ListView.builder(
            // shrinkWrap: true,
            scrollDirection:Axis.horizontal ,
           itemCount: products.length,
             itemBuilder:((context,index){ return productCard(context,false,  products[index]);}) ,
              
            
          ),
        )
      ],
    ),
  );
}