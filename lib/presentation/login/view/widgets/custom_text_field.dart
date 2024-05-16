
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';
import 'package:promina_agency_task/core/theme/textStyles.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType = TextInputType.text,
      required this.controller,
      required this.validator,
      this.obscureText = false});

  String hint;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: MyColors.brownColor),
      decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),filled: true,fillColor: MyColors.whiteColor,
        hintText: hint,
        hintStyle: Styles.textStyle18.copyWith(color: MyColors.brownColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: MyColors.whiteColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: MyColors.whiteColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.redColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:MyColors.redColor, width: 2),
        ),
      ),
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,

    );
  }
}
