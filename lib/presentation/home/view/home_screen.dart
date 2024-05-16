import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_agency_task/core/texts/imagePaths.dart';
import 'package:promina_agency_task/core/texts/texts.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';
import 'package:promina_agency_task/core/theme/textStyles.dart';
import 'package:promina_agency_task/core/utils/dialog_utils.dart';
import 'package:promina_agency_task/presentation/home/view/widgets/actions_items.dart';
import 'package:promina_agency_task/presentation/home/view/widgets/imageGridView.dart';
import 'package:promina_agency_task/presentation/home/view_model/home_states.dart';
import 'package:promina_agency_task/presentation/home/view_model/home_view_model.dart';
import 'package:promina_agency_task/presentation/login/view/login_screen.dart';
import 'package:promina_agency_task/presentation/login/view_model/login_view_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreenRouteName';

  @override
  Widget build(BuildContext context) {

    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    var homeCubit=BlocProvider.of<HomeViewModel>(context)..getGallery(loginCubit.loginResponseEntity.token!);

    return BlocConsumer<HomeViewModel,HomeStates>(
      listener: (context, state) {
        if(state is ChooseUploadImageSourceState){
          DialogUtils.showUploadSelection(context: context,onTapCamera: (){homeCubit.pickImage(ImageSource.camera,loginCubit.loginResponseEntity.token!);},onTapGallery: (){
            homeCubit.pickImage(ImageSource.gallery,loginCubit.loginResponseEntity.token!);
          });

        } else  if(state is UploadImageLoadingState){
          DialogUtils.hideLoading(context);
          DialogUtils.showUploading(context: context);
        } else if (state is UploadImageSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: 'Image Uploaded Successfuly', actionName: 'ok',posActionFun: (){
            homeCubit.getGallery(loginCubit.loginResponseEntity.token!);
            Navigator.of(context).pop();
          });
        } else if(state is UploadImageErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.errMsg, actionName: 'ok',posActionFun: (){
            homeCubit.getGallery(loginCubit.loginResponseEntity.token!);

            Navigator.of(context).pop();
          });
        }
      },
      builder:(context, state) =>  Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPaths.homeBackGround),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(left: 27.w, top: 40.h, right: 32.w),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyTexts.welcomeMina,
                      style: Styles.textStyle32,
                    ),
                    Spacer(),
                    ClipRRect(
                      child: Image.asset(width: 66.w,height: 66.h,
                        ImagesPaths.imageProfile,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 44,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionItems(textStyle: Styles.textStyle20,color: MyColors.whiteColor,onTap: () {
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      },
                        imagePath: ImagesPaths.logoutIcon,
                        text: MyTexts.logout,
                      ),
                      ActionItems(textStyle: Styles.textStyle20,color: MyColors.whiteColor,
                        onTap: () {
                        homeCubit.emitChooseImageUploadSource();
                        },
                        imagePath:ImagesPaths.uploadIcon,
                        text: MyTexts.upload,
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 34,),
                //Image.file(File('/data/user/0/com.example.promina_agency_task/cache/611f14e9-aa61-41b3-8664-4ae49f36165a/IMG_20240515_231455.jpg')),
                //Image.network("https://flutter.prominaagency.com/media/857/Screenshot-2024-04-06-213738.png"),
                if (state is GetGalleryErrorState) Center(child: Text(state.errMsg,style: Styles.textStyle50,),)

                else
                  ImageGridView(images: homeCubit.images,),

                
                
              ],
            ),
          ),
        )
      ]),
    );
  }
}
