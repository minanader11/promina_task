import 'package:promina_agency_task/data/model/response/ErrorUpload.dart';
import 'package:promina_agency_task/domain/entities/UploadResponseEntity.dart';

class UploadResponseDto extends  UploadResponseEntity{
  UploadResponseDto({
      super.status,
      super.data,
      super.message,this.errorDto});

  UploadResponseDto.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v.fromJson(v));
      });
    }
    message = json['message'];
    errorDto= json['errors'] != null ? ErrorDto.fromJson(json['errors']) : null;
  }
 ErrorDto? errorDto;



}