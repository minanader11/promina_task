class LoginResponseEntity {
  LoginResponseEntity({
      this.user, 
      this.token,});


  UserEntity? user;
  String? token;



}

class UserEntity {
  UserEntity({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});


  num? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;



}