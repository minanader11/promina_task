import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/entities/GetGalleryResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:promina_agency_task/domain/repository/Home_repo.dart';

class GetGalleryUseCase{
  HomeRepository homeRepository;
  GetGalleryUseCase({required this.homeRepository});
  Future<Either<Failures,GetGalleryResponseEntity>> invoke(String token){
    return homeRepository.getGallery(token);
  }

}