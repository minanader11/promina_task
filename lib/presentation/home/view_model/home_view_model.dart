
import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_agency_task/data/api/api_manager.dart';
import 'package:promina_agency_task/domain/use_cases/getGalleryUseCase.dart';
import 'package:promina_agency_task/domain/use_cases/uploadImageUseCase.dart';
import 'package:promina_agency_task/presentation/home/view_model/home_states.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel({required this.uploadImageUseCase,required this.getGalleryUseCase}):super(HomeInitialState());
  final ImagePicker picker = ImagePicker();
  List<String>images=[];
  UploadImageUseCase uploadImageUseCase;
  GetGalleryUseCase getGalleryUseCase;
  void pickImage(ImageSource source,String token)async{
    var selected= await picker.pickImage(source: source);
    if(selected !=null){
      emit(UploadImageLoadingState());
   var either= await uploadImageUseCase.invoke(selected.path, token);
    either.fold((l) {
      emit(UploadImageErrorState(errMsg: l.errMsg));
    }, (r) {
      emit(UploadImageSuccessState());
    });
    } else{
      getGallery(token);
    }

  }
  void emitChooseImageUploadSource(){
    emit(ChooseUploadImageSourceState());
  }
  void getGallery(String token)async{
    emit(GetGalleryLoadingState());
    var either = await getGalleryUseCase.invoke(token);
    either.fold((failure) {
      emit(GetGalleryErrorState(errMsg: failure.errMsg));
    }, (response) {
      images=response.data!.images!;

      emit(GetGallerySuccessState());
    });
  }
}