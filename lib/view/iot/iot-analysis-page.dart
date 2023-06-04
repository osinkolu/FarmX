import 'package:agrotech_hackat/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller.dart';

class IOTPage extends GetView<IotController> {
  const IOTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IOT"),
      ),
      body: GetBuilder<IotController>(
          init: IotController(),
          builder: (c) {
            return c.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 20.sp),
                    child: Column(
                      children: [
                        /// Pressure card

                        /// grid view
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.sp,
                            mainAxisSpacing: 20.sp,
                            children: [
                              IOTCard(
                                icon: Icons.water,
                                title: "Pressure",
                                value:
                                    "${c.result["Pressure"].toStringAsFixed(2)}Pa",
                              ),
                              IOTCard(
                                icon: Icons.wb_sunny,
                                title: "Humidity",
                                value:
                                    "${c.result["humidity"].toStringAsFixed(2)}%",
                              ),
                              IOTCard(
                                icon: Icons.water_drop,
                                title: "Soil moisture",
                                value:
                                    "${c.result["SoilMoisture"].toStringAsFixed(2)}%",
                              ),
                              IOTCard(
                                icon: Icons.height,
                                title: "Altitude",
                                value:
                                    "${c.result["Altitude"].toStringAsFixed(2)}m",
                              ),
                              IOTCard(
                                icon: Icons.thermostat,
                                title: "Temperature",
                                value:
                                    "${c.result["temperature"].toStringAsFixed(2)}°C ",
                              ),
                              IOTCard(
                                icon: Icons.waves,
                                title: "Digital Pin rain sensor",
                                value: c.result["digital_pin_rain_sensor"]
                                            .toString() ==
                                        "1"
                                    ? "Not Raining"
                                    : "Raining",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}

class IOTCard extends StatelessWidget {
  const IOTCard(
      {Key? key, required this.icon, required this.title, required this.value})
      : super(key: key);
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon
            Icon(
              icon,
              size: 50.sp,
              color: plantDark,
            ),

            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp)),

            Text(value, //c.result["Pressure"].toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: plantLight)),
          ],
        ),
      ),
    );
  }
}
