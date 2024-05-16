import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/data/api/api_manager.dart';
import 'package:promina_agency_task/domain/data_source/home_data_source.dart';
import 'package:promina_agency_task/domain/entities/GetGalleryResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/UploadResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';

class HomeDataSourceImpl implements HomeDataSource{
  ApiManager apiManager;
  HomeDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, UploadResponseEntity>> uploadImage(String filepath, String token) async{
    var either = await apiManager.uploadImage(filepath, token);
    return either.fold((failure) {
     return Left(failure);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetGalleryResponseEntity>> getGallery(String token) async{
   var either = await apiManager.getGallery(token);
   return either.fold((failure) {
     return Left(failure);
   }, (response)
   {
     return Right(response);
   }
   );
  }

}