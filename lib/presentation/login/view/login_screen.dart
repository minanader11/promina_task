import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:promina_agency_task/core/texts/imagePaths.dart';
import 'package:promina_agency_task/core/texts/texts.dart';
import 'package:promina_agency_task/core/theme/Colors.dart';
import 'package:promina_agency_task/core/theme/textStyles.dart';
import 'package:promina_agency_task/core/utils/dialog_utils.dart';
import 'package:promina_agency_task/presentation/home/view/home_screen.dart';
import 'package:promina_agency_task/presentation/login/view/widgets/custom_text_field.dart';
import 'package:promina_agency_task/presentation/login/view_model/login_States.dart';
import 'package:promina_agency_task/presentation/login/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'loginScreenRouteName';

  @override
  Widget build(BuildContext context) {
    var loginViewModel=BlocProvider.of<LoginViewModel>(context);
    return BlocListener<LoginViewModel,LoginStates>(listener: (context, state) {
      if (state is LoginLoadingState) {
        DialogUtils.showLoading(context: context);
      } else if (state is LoginErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            actionName: 'ok',
            posActionFun: () {

              Navigator.of(context).pop();
            });
      } else if(state is LoginSuccessState){
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            actionName: 'ok',
            posActionFun: () {

              Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
            });
      }
    },child: Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPaths.loginBackGround),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 200.h),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                MyTexts.my,
                style: Styles.textStyle50,
              ),
              Text(
                MyTexts.gallery,
                style: Styles.textStyle50,
              ),
              // SizedBox(
              //   height: 27.h,
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.4,
                    ),
                    borderRadius: BorderRadius.circular(20.r)
                ),
                margin: EdgeInsets.only(top: 17.h,left: 41.w, right: 42.w),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 48.h, top: 48.h, left: 31.w, right: 31.w),
                  child: Form(key: loginViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          MyTexts.login,
                          style: Styles.textStyle30,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        Container(
                            height: 46.h,
                            child: CustomTextField(
                                hint: MyTexts.username,
                                controller: loginViewModel.emailController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please Enter Your Email';
                                  }
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailValid) {
                                    return 'Please enter Valid Email';
                                  }
                                  return null;
                                })),
                        SizedBox(
                          height: 37,
                        ),
                        Container(
                            height: 46.h,
                            child: CustomTextField(obscureText: true,
                                hint: MyTexts.password,
                                controller: loginViewModel.passwordController,
                                validator:(text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please Enter Your Password';
                                  }
                                  if (text.trim().length < 6) {
                                    return 'Password must contains at least 6 characters';
                                  }
                                  return null;
                                })),
                        SizedBox(
                          height: 37,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            loginViewModel.login();
                          },
                          child: Text(
                            MyTexts.submit,
                            style: Styles.textStyle18,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.lightBlue,
                              foregroundColor: MyColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                        )
                      ],
                    ),
                  ),
                ),
              ).asGlass(enabled: true, blurX: 6, blurY: 6)
            ]),
          ),
        ),
      ),
    ]) ,);

  }
}
