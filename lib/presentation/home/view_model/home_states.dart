abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class ChooseUploadImageSourceState extends HomeStates{}
class UploadImageSuccessState extends HomeStates{}
class UploadImageErrorState extends HomeStates{
  String errMsg;
  UploadImageErrorState({required this.errMsg});
}
class UploadImageLoadingState extends HomeStates{}
class GetGalleryLoadingState extends HomeStates{}
class GetGallerySuccessState extends HomeStates{}
class GetGalleryErrorState extends HomeStates{
  String errMsg;
  GetGalleryErrorState({required this.errMsg});
}