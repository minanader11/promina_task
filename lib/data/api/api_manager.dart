import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/data/api/api_constants.dart';
import 'package:promina_agency_task/data/model/request/LoginRequest.dart';
import 'package:promina_agency_task/data/model/response/GetGalleryResponseDto.dart';
import 'package:promina_agency_task/data/model/response/LoginResponseDto.dart';
import 'package:promina_agency_task/data/model/response/UploadResponseDto.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  static ApiManager? _instance;
ApiManager._();
static ApiManager getInstance() {
  _instance ??= ApiManager._();
  return _instance!;
}
  Future<Either<Failures,LoginResponseDto>> login(String email,String password)async{
    var connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
    var uri= Uri.https(ApiConstants.baseUrl,ApiConstants.loginApi);
    var loginRequest=LoginRequest(password: password,email: email);
    var response = await http.post(uri,body: loginRequest.toJson());
    var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
   if(response.statusCode>=200 && response.statusCode <300 && loginResponse.errMsg==null ){
     return Right(loginResponse);
   }else{
     return Left(ServerFailure(errMsg: loginResponse.errMsg!));
   }
    }else {
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,UploadResponseDto>>uploadImage(String filepath,String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      String addimageUrl = 'https://flutter.prominaagency.com/api/upload';
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('img', filepath));
      var response = await request.send();
      var uploadResponse =await http.Response.fromStream(response);
      var uploadResponseData=UploadResponseDto.fromJson(jsonDecode(uploadResponse.body));
      if(response.statusCode>=200 && response.statusCode <300 ){

        return Right(uploadResponseData);
      }else{

        return Left(ServerFailure(errMsg: uploadResponseData.errorDto?.img?[0] ?? 'error upload image'));
      }
    }else {
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,GetGalleryResponseDto>> getGallery(String token)async{
    var connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      var uri= Uri.https(ApiConstants.baseUrl,ApiConstants.getGallery);

      var response = await http.get(uri,headers:{ 'Authorization': 'Bearer $token'});
      var getGalleryResponse = GetGalleryResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(getGalleryResponse);
      }else{
        return Left(ServerFailure(errMsg: 'Cannot Load Images'));
      }
    }else {
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
}