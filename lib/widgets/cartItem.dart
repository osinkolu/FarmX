import 'package:agrotech_hackat/size_config.dart';
import 'package:agrotech_hackat/widgets/productAdd.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem({ Key? key, required this.image, required this.name, required this.price, required this.farm }  ) : super(key: key);
final   String name, price, image, farm;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int value = 1;

  increase() {
    setState(() {
      value++;
    });
  }

  reduce() {
    if (value > 1) {
      setState(() {
        value--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 0,
              child: Container(
                width: w(327, context),
                height: h(101, context),
                color: fill,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: w(15, context), left: w(15, context)),
                  child: Row(children: [
                    Container(
                      width: w(80, context),
                      height: h(80, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: w(10, context)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: h(10, context), bottom: h(10, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                  fontSize: w(14, context))),
                          Text(widget.farm,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: grey,
                                  fontSize: w(12, context))),
                          SizedBox(height: h(5, context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(child: productAdd(context, value, increase, reduce)),SizedBox(width: w(30, context)),
                              Text(
                                
                                widget.price,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: mainGreen,
                                    fontSize: w(16, context)),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ));
  }
}




