import "package:agrotech_hackat/constants/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "controller.dart";

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecommendationController r = Get.put(RecommendationController());
    return Scaffold(
        appBar: AppBar(
            title: Text("Recommendation results",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600))),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Crop Recommendation",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: r.recommendations.value.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            height: 100.h,
                            decoration: BoxDecoration(
                              // Use random colors
                              color: Color.fromARGB(255, 10, 62, 50),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Crop Name",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(r.recommendations.value.data![index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600))
                              ],
                            ));
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  r.datadump.value.description ?? "",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Climate data",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "Temperature",
                      value: r.datadump.value.climate!.main!.temp!.toString(),
                      color: const Color.fromARGB(255, 133, 45, 38),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "Humidity",
                      value:
                          r.datadump.value.climate!.main!.humidity!.toString(),
                      color: const Color(0xffDADBDD),
                      valueColor: black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "Pressure",
                      value:
                          r.datadump.value.climate!.main!.pressure!.toString(),
                      color: const Color(0xffC8A2C8),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "Wind Speed",
                      value: r.datadump.value.climate!.wind!.speed!.toString(),
                      color: black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "Wind Direction",
                      value: r.datadump.value.climate!.wind!.deg!.toString(),
                      color: Color.fromARGB(255, 9, 60, 10),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "Clouds",
                      value: r.datadump.value.climate!.clouds!.all!.toString(),
                      color: const Color(0xffAA4A44),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Soil data",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "Ca",
                      value: r.datadump.value.soil![0].ca!.toString(),
                      color: const Color(0xffAA4A44),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "Mg",
                      value: r.datadump.value.soil![0].mg!.toString(),
                      color: const Color(0xffDADBDD),
                      valueColor: black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "K",
                      value: r.datadump.value.soil![0].k!.toString(),
                      color: const Color(0xffC8A2C8),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "P",
                      value: r.datadump.value.soil![0].p!.toString(),
                      color: black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    DataCard(
                      title: "Farm",
                      value: r.datadump.value.soil![0].farm ?? "",
                      color: Color.fromARGB(255, 9, 60, 10),
                    ),
                    const Spacer(),
                    DataCard(
                      title: "Cu",
                      value: r.datadump.value.soil![0].cu!.toString(),
                      color: const Color(0xFFB87333),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class DataCard extends StatelessWidget {
  const DataCard(
      {Key? key,
      required this.title,
      required this.value,
      this.color,
      this.valueColor})
      : super(key: key);
  final String title;
  final String value;
  final Color? color;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      height: 100.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: color ?? grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 5.h,
          ),
          Text(value,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: valueColor ?? white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
