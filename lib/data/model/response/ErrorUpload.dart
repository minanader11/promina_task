class ErrorUploadDto {
  ErrorUploadDto({
      this.message, 
      this.errors,});

  ErrorUploadDto.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? ErrorDto.fromJson(json['errors']) : null;
  }
  String? message;
  ErrorDto? errors;



}

class ErrorDto {
  ErrorDto({
      this.img,});

  ErrorDto.fromJson(dynamic json) {
    img = json['img'] != null ? json['img'].cast<String>() : [];
  }
  List<String>? img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = img;
    return map;
  }

}