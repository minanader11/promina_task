import 'package:promina_agency_task/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity{
  LoginResponseDto({
      super.user,
      super.token,this.errMsg});

  LoginResponseDto.fromJson(dynamic json) {
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    errMsg=json['error_message'];
  }
String? errMsg;



}

class UserDto extends UserEntity {
  UserDto({
      super.id,
      super.name,
      super.email,
      super.emailVerifiedAt,
      super.createdAt,
      super.updatedAt,});

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }




}