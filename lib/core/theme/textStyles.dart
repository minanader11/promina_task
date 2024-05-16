import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';

abstract class Styles {
  static   TextStyle textStyle50 = GoogleFonts.balooThambi2(textStyle:TextStyle(
    fontSize: 50.sp, color: MyColors.greyColor ,fontWeight: FontWeight.bold)); //TextStyle(
  static TextStyle textStyle30 = GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 30.sp, color: MyColors.greyColor ,fontWeight: FontWeight.bold));
  static TextStyle textStyle32 = GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 32.sp, color: MyColors.greyColor ,fontWeight: FontWeight.w400));
  static TextStyle textStyle18 = GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 18.sp, color: MyColors.whiteColor ,fontWeight: FontWeight.bold));
  static TextStyle textStyle16 = GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 16.sp, color: MyColors.greyColor ,fontWeight: FontWeight.w400));
  static TextStyle textStyle20 = GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 20.sp, color: MyColors.greyColor ,fontWeight: FontWeight.w400));
  static TextStyle textStyle27 =  GoogleFonts.balooThambi2(textStyle:TextStyle(
      fontSize: 27.sp, color: MyColors.greyColor ,fontWeight: FontWeight.bold));
}