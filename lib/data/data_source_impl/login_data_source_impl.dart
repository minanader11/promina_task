import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/data/api/api_manager.dart';
import 'package:promina_agency_task/domain/data_source/login_data_source.dart';
import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';

class LoginDataSourceImpl implements LoginDataSource{
  ApiManager apiManager;
  LoginDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password)async {
    var either = await apiManager.login(email, password);
    return either.fold((failure) => Left(failure), (response) => Right(response));
  }

}