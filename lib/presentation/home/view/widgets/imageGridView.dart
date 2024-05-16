import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/presentation/home/view/widgets/imageItem.dart';

class ImageGridView extends StatelessWidget{
  List<String> images;
  ImageGridView({required this.images});
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 24.w, mainAxisSpacing: 16),
        itemBuilder: (context, index) => InkWell(
            onTap:(){},
            child: ImageItem(imagePath:images[index] ),
      )),
    );

  }
}