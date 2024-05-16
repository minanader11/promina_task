import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';

abstract class LoginRepository{
  Future<Either<Failures,LoginResponseEntity>> login(String email,String password);
}