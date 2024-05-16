import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/data_source/login_data_source.dart';
import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:promina_agency_task/domain/repository/login_repo.dart';

class LoginRepositoryImpl implements LoginRepository{
  LoginDataSource loginDataSource;
  LoginRepositoryImpl({required this.loginDataSource});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) {
   return loginDataSource.login(email, password);
  }

}