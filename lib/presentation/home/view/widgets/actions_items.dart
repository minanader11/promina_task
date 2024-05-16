import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/core/texts/imagePaths.dart';
import 'package:promina_agency_task/core/texts/texts.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';
import 'package:promina_agency_task/core/theme/textStyles.dart';

class ActionItems extends StatelessWidget {
  String imagePath;
  String text;
  void Function()? onTap;
  Color color;
  TextStyle textStyle;

  ActionItems(
      {required this.textStyle,required this.color,required this.text, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            Image.asset(imagePath,
              fit: BoxFit.fill,),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
