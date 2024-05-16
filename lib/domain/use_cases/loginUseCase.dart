import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:promina_agency_task/domain/repository/login_repo.dart';

class LoginUseCase{
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
  Future<Either<Failures,LoginResponseEntity>> invoke(String email,String password){
    return loginRepository.login(email, password);
  }
}