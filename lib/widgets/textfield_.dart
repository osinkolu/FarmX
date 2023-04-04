import 'package:agrotech_hackat/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithConfig extends StatelessWidget {
  const TextFieldWithConfig(
      {Key? key,
      this.fieldController,
      required this.showTitle,
      this.title,
      this.validator,
      this.suffixIcon,
      this.type,
      this.prefixText,
      this.obscureText,
      this.maxLength,
      this.onChanged,
      this.prefixIcon,
      this.hintStyle,
      this.maxLines,
      this.borderRadius})
      : super(key: key);
  final TextEditingController? fieldController;
  final bool showTitle;
  final String? title;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType? type;
  final String? prefixText;
  final bool? obscureText;
  final int? maxLength;
  final Function(String)? onChanged;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        autofocus: false,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        onChanged: onChanged,
        obscuringCharacter: '*',
        controller: fieldController,
        validator: (e) => validator!(e),
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: grey, fontSize: 16.sm, fontWeight: FontWeight.w400),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          hintText: title,
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
            borderSide: BorderSide(
              color: const Color(0xff9C9C9C),
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
              borderSide: BorderSide(color: grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
            borderSide: BorderSide(
              color: black,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        keyboardType: type,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    ]);
  }
}
