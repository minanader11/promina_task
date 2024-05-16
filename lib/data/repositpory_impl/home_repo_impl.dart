import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/data_source/home_data_source.dart';
import 'package:promina_agency_task/domain/entities/GetGalleryResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/UploadResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:promina_agency_task/domain/repository/Home_repo.dart';

class HomeRepoImpl implements HomeRepository{
  HomeDataSource homeDataSource;
  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failures, UploadResponseEntity>> uploadImage(String filepath, String token) {
    return homeDataSource.uploadImage(filepath, token);
  }

  @override
  Future<Either<Failures, GetGalleryResponseEntity>> getGallery(String token) {
    return homeDataSource.getGallery(token);
  }

}