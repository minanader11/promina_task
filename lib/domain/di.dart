import 'package:promina_agency_task/data/api/api_manager.dart';
import 'package:promina_agency_task/data/data_source_impl/home_data_source_impl.dart';
import 'package:promina_agency_task/data/data_source_impl/login_data_source_impl.dart';
import 'package:promina_agency_task/data/repositpory_impl/home_repo_impl.dart';
import 'package:promina_agency_task/data/repositpory_impl/login_repo_impl.dart';
import 'package:promina_agency_task/domain/data_source/home_data_source.dart';
import 'package:promina_agency_task/domain/data_source/login_data_source.dart';
import 'package:promina_agency_task/domain/repository/Home_repo.dart';
import 'package:promina_agency_task/domain/repository/login_repo.dart';
import 'package:promina_agency_task/domain/use_cases/getGalleryUseCase.dart';
import 'package:promina_agency_task/domain/use_cases/loginUseCase.dart';
import 'package:promina_agency_task/domain/use_cases/uploadImageUseCase.dart';

LoginUseCase injectLoginUseCase(){
return LoginUseCase(loginRepository: injectLoginRepository());
}
LoginRepository injectLoginRepository(){
  return LoginRepositoryImpl(loginDataSource: injectLoginDataSource());
}
LoginDataSource injectLoginDataSource(){
  return LoginDataSourceImpl(apiManager: ApiManager.getInstance());
}
UploadImageUseCase injectUploadImageUseCase(){
  return UploadImageUseCase(homeRepository: injectHomeRepository());
}
HomeRepository injectHomeRepository(){
  return HomeRepoImpl(homeDataSource: injectHomeDataSource());
}
HomeDataSource injectHomeDataSource(){
  return HomeDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetGalleryUseCase injectGetGalleryUseCase(){
  return GetGalleryUseCase(homeRepository: injectHomeRepository());
}