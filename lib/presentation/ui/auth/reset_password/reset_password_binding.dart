import 'package:aktaris_app/data/datasource/auth_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/auth/reset_password_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController(Get.find<ResetPasswordUsecase>()));
    Get.lazyPut(() => ResetPasswordUsecase(repository: AuthRepositoryImpl(authRemoteDatasource: AuthRemoteDatasourceImpl())));
  }

}