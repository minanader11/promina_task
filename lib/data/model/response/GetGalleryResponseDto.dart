import 'package:promina_agency_task/domain/entities/GetGalleryResponseEntity.dart';

class GetGalleryResponseDto extends GetGalleryResponseEntity {
  GetGalleryResponseDto({
      super.status,
      super.data,
      super.message,});

  GetGalleryResponseDto.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? ImagesResponseDto.fromJson(json['data']) : null;
    message = json['message'];
  }




}

class ImagesResponseDto extends ImagesResponseEntity {
  ImagesResponseDto({
      super.images,});

  ImagesResponseDto.fromJson(dynamic json) {
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }




}