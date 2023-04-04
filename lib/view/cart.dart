import 'package:agrotech_hackat/widgets/button.dart';
import 'package:agrotech_hackat/widgets/cartItem.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../size_config.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text('Cart',
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w600,
                fontSize: w(16, context))),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: h(15, context), right: w(15, context), left: w(15, context)),
        child: Column(
          children: [
            Expanded(
              flex: 13,
              child: ListView(children: const [
                CartItem(
                    image: "assets/svgs/onions.jpg",
                    name: "Onions",
                    price: "N3,500.00",
                    farm: "Zebra farms"),
                CartItem(
                    image: "assets/svgs/palm.jpg",
                    name: "Palm Kernel",
                    price: "N1,500.00",
                    farm: "Zebra farms"),
                CartItem(
                    image: "assets/images/cherrypepper.jpeg",
                    name: "Tomato",
                    price: "N2,500.00",
                    farm: "Brook farms"),
                CartItem(
                    image: "assets/images/greenpeas.jpeg",
                    name: "Green Peas",
                    price: "N500.00",
                    farm: "Great farms"),
              ]),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: h(49,context),
                  child: button("Proceed to Checkout", () {}, white, mainGreen,
                      mainGreen, h(49, context), w(327, context)),
                )),
               const Expanded(child: SizedBox(), flex:1),
          ],
        ),
      ),
    );
  }
}
