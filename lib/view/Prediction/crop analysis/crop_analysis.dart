import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import 'controller.dart';

class CropAnalysis extends StatelessWidget {
  const CropAnalysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CropAnalysisController c = Get.put(CropAnalysisController());
    return Scaffold(
        appBar: AppBar(
            title: Text("Analysis results",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600))),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      //border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  height: 300,
                  width: 300,
                  child: c.selectedImage.value.isEmpty
                      ? const Text('No image selected.')
                      : Image.file(File(c.selectedImage.value)),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Label",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: ": ${c.resp.value.mainData!.label}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400))
                        ]),
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Confidence",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: ": ${c.resp.value.mainData!.confidence}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400))
                        ]),
                  ),
                ),
                SizedBox(height: 8.h),
                Text("About",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 8.h),
                Text(c.resp.value.moreDetails!.about ?? "",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 10.h),
                Text(c.resp.value.moreDetails!.extraTopic ?? "More Details",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 8.h),
                Text(c.resp.value.moreDetails!.topicDescription ?? "",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ));
  }
}
