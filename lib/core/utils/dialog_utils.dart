import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:promina_agency_task/core/texts/imagePaths.dart';
import 'package:promina_agency_task/core/texts/texts.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';
import 'package:promina_agency_task/core/theme/textStyles.dart';
import 'package:promina_agency_task/presentation/home/view/widgets/actions_items.dart';

class DialogUtils {
  static showLoading(
      {required BuildContext context, bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.whiteColor,
          content: Row(children: [
            Text(
              'Loading',
              style: Styles.textStyle20.copyWith(color: MyColors.greyColor),
            ),
            SizedBox(
              width: 12,
            ),
            CircularProgressIndicator(
              color: MyColors.greyColor,
            )
          ]),
        );
      },
    );
  }

  static showUploading(
      {required BuildContext context, bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.whiteColor,
          content: Row(children: [
            Text(
              'Uploading image ',
              style: Styles.textStyle20.copyWith(color: MyColors.greyColor),
            ),
            SizedBox(
              width: 12,
            ),
            CircularProgressIndicator(
              color: MyColors.greyColor,
            )
          ]),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      required String actionName,
      Function? posActionFun}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.whiteColor,
          content: Text(
            message,
            style: Styles.textStyle20.copyWith(color: MyColors.greyColor),
          ),
          title: Text(title ?? ''),
          actions: [
            TextButton(
                onPressed: () {
                  if (posActionFun != null) {
                    posActionFun.call();
                  }
                  // Navigator.of(context).pop();
                },
                child: Text(
                  actionName,
                  style: Styles.textStyle16.copyWith(color: MyColors.greyColor),
                ))
          ],
        );
      },
    );
  }

  static showUploadSelection({
    required BuildContext context,
    required void Function()? onTapGallery,
    required void Function()? onTapCamera,
  }) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.2),
          content: Container(
            height: 200.h,
            width: 270.w,
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 184.w,
                    height: 65.h,
                    child: ActionItems(
                      textStyle: Styles.textStyle27,
                      color: MyColors.purpleColor,
                      onTap: onTapGallery,
                      imagePath: ImagesPaths.galleryIcon,
                      text: MyTexts.gallery,
                    ),
                  ),
                  SizedBox(
                    width: 184.w,
                    height: 65.h,
                    child: ActionItems(
                      textStyle: Styles.textStyle27,
                      color: MyColors.cyanColor,
                      onTap: onTapCamera,
                      imagePath: ImagesPaths.cameraIcon,
                      text: MyTexts.camera,
                    ),
                  ),
                ],
              ),
            ),

        ).asGlass();
      },
    );
  }
}
