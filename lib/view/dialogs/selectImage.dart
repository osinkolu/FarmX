import 'package:agrotech_hackat/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';


selectImageDialog(BuildContext context, Function function) {
  return Get.defaultDialog(
      titleStyle:  TextStyle(color: mainGreen),
      title: "Upload Image",
      backgroundColor: white,
      content: SizedBox(
          height: h(150,context),
          width: w(296,context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      function(ImageSource.camera);
                    },
                    child: Row(children: [
                      Icon(Icons.camera_alt, color: mainGreen),
                   SizedBox(width: w(23, context)),
                      Text(
                        "CAMERA",
                        style: TextStyle(
                            fontSize: w(21,context), fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                const   Divider(
                    thickness: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      function(ImageSource.gallery);
                    },
                    child: Row(children: [
                      Icon(Icons.photo_library, color: mainGreen),
                      SizedBox(width: w(23, context)),
                      Text(
                        "GALLERY",
                        style: TextStyle(
                            fontSize: w(21,context), fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                ]),
          )));
}
