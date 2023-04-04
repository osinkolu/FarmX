import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/view/Prediction/crop%20recomendation/controller.dart';
import 'package:agrotech_hackat/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CropRecomendationPage extends StatelessWidget {
  const CropRecomendationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecommendationController reg = Get.put(RecommendationController());
    return GetBuilder<RecommendationController>(builder: (reg) {
      return Scaffold(
          appBar: AppBar(
              title: Text("Crop Recommendation",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: white))),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            onChanged: (e) {
                              reg.searchPlace();
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                            controller: reg.searchController,
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              hintText: "Enter Location",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide(
                                  color: const Color(0xff9C9C9C),
                                  width: 1.w,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(color: grey)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide(
                                  color: black,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                        SizedBox(
                            height: 0.6.sh,
                            child: ListView.builder(
                                itemCount: reg.predictions.length,
                                itemBuilder: (_, i) {
                                  return ListTile(
                                      onTap: () {
                                        reg.fetchPlace(reg.predictions[i]);
                                        reg.searchController.text =
                                            reg.predictions[i].fullText;

                                        reg.predictions.value = [];
                                      },
                                      title: Text(reg.predictions[i].fullText));
                                }))
                      ],
                    ),
                  ),
                  button(
                      reg.placeSearched.value
                          ? "Proceed to Predictions"
                          : "Search Place", () {
                    reg.proceed();
                  }, white, mainGreen, mainGreen, 50.h, double.infinity),
                  SizedBox(
                    height: 10.h,
                  ),
                  button("Use current location", () {
                    reg.getCurrentLocation();
                  }, white, mainGreen, mainGreen, 50.h, double.infinity)
                ],
              ),
            ),
          ));
    });
  }
}
