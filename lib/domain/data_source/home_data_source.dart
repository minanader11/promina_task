import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/entities/GetGalleryResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/UploadResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';

abstract class HomeDataSource{
  Future<Either<Failures,UploadResponseEntity>>uploadImage(String filepath,String token);
  Future<Either<Failures,GetGalleryResponseEntity>> getGallery(String token);

}