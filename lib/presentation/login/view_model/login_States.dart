
abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{

}
class LoginErrorState extends LoginStates{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}