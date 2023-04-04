import 'package:agrotech_hackat/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Prediction/crop analysis/crop_analysis_form.dart';
import 'Prediction/crop recomendation/crop_recomendation_page.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Analysis",
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
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 16.sp)
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
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
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
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 16.sp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
