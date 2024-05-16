import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageItem extends StatelessWidget {
  String imagePath;
  ImageItem({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(width: 60.w,
      height: 80.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: CachedNetworkImage(fit: BoxFit.fill,
          imageUrl: imagePath,
          placeholder: (context, url) => SizedBox(width: 30.w,child: Center(child: CircularProgressIndicator())),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
      ),
    );
  }
}
