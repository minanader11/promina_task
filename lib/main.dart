import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/domain/di.dart';
import 'package:promina_agency_task/presentation/home/view/home_screen.dart';
import 'package:promina_agency_task/presentation/home/view_model/home_view_model.dart';
import 'package:promina_agency_task/presentation/login/view/login_screen.dart';
import 'package:promina_agency_task/presentation/login/view_model/login_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginViewModel>(
      create: (context) => LoginViewModel(loginUseCase: injectLoginUseCase()),
    ),
    BlocProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
          uploadImageUseCase: injectUploadImageUseCase(),
          getGalleryUseCase: injectGetGalleryUseCase()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
