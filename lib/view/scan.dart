import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/view/iot/iot-analysis-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'Prediction/crop analysis/crop_analysis_form.dart';
import 'Prediction/crop recomendation/crop_recomendation_page.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Tools",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: white))),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 20.w,
          ),
          child: SizedBox(
            height: 0.9.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const CropRecomendationPage());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      alignment: Alignment.centerLeft,
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: plantLighter),
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/plant-recommendation.json",
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                            animate: true,
                            repeat: true,
                            reverse: false,
                          ),
                          SizedBox(height: 5.h),
                          SizedBox(
                            width: 150.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Crop Recommendation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Recommends what kind of crop to plant",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: plantDark),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Get.to(() => const CropAnalysisForm());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      alignment: Alignment.centerLeft,
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: plantLighter),
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Crop analysis",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Perform Detections on a selected image",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: plantDark),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Lottie.asset(
                            "assets/analysis.json",
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                            animate: true,
                            repeat: true,
                            reverse: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Get.to(() => const IOTPage());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      alignment: Alignment.centerLeft,
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: plantLighter),
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/iot.json",
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                            animate: true,
                            repeat: true,
                            reverse: false,
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 150.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "IOT Analysis",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Analyze soil and environment conditions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: plantDark),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
