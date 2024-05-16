import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';
import 'package:promina_agency_task/domain/use_cases/loginUseCase.dart';
import 'package:promina_agency_task/presentation/login/view_model/login_States.dart';

class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel({required this.loginUseCase}):super(LoginInitialState());
  LoginUseCase loginUseCase;
  TextEditingController emailController=TextEditingController(text: 'mwisoky@example.net');
  TextEditingController passwordController=TextEditingController(text: 'password');
  LoginResponseEntity loginResponseEntity=LoginResponseEntity();
  final formKey = GlobalKey<FormState>();
  void login()async{
    bool validate=  formKey.currentState!.validate();
    if(validate){
    emit(LoginLoadingState());
    var either=await loginUseCase.invoke(emailController.text, passwordController.text);
    either.fold((l) {
      emit(LoginErrorState(errorMsg: l.errMsg));
    }, (r) {
      loginResponseEntity= r;
      emit(LoginSuccessState());
    });
    }
  }

}