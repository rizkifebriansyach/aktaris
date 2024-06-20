import 'package:aktaris_app/data/datasource/profile/profile_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/profile/profile_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/profile/change_password_usecase.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ChangePasswordController(Get.find<ChangePasswordUsecase>()));
    Get.lazyPut(() => ChangePasswordUsecase(
        repository: ProfileRepositoryImpl(
            profileRemoteDatasource: ProfileRemoteDatasourceImpl())));
  }
}
