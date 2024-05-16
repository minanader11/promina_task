class GetGalleryResponseEntity {
  GetGalleryResponseEntity({
      this.status, 
      this.data, 
      this.message,});


  String? status;
  ImagesResponseEntity? data;
  String? message;



}

class ImagesResponseEntity {
  ImagesResponseEntity({
      this.images,});


  List<String>? images;



}