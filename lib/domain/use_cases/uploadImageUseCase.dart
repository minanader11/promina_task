import 'package:dartz/dartz.dart';
import 'package:promina_agency_task/domain/entities/UploadResponseEntity.dart';
import 'package:promina_agency_task/domain/entities/failure.dart';
import 'package:promina_agency_task/domain/repository/Home_repo.dart';

class UploadImageUseCase{
  HomeRepository homeRepository;
  UploadImageUseCase({required this.homeRepository});
  Future<Either<Failures,UploadResponseEntity>>invoke(String filepath,String token) {
    return homeRepository.uploadImage(filepath, token);
  }
  }
