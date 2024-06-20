import 'package:aktaris_app/data/datasource/profile/profile_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/profile/profile_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/profile/change_profile_data_usecase.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_controller.dart';
import 'package:get/get.dart';

class ChangePersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        ChangePersonalDataController(Get.find<ChangeProfileDataUsecase>()));
    Get.lazyPut(() => ChangeProfileDataUsecase(
        repository: ProfileRepositoryImpl(
            profileRemoteDatasource: ProfileRemoteDatasourceImpl())));
  }
}
