import 'package:aktaris_app/data/datasource/auth_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/auth/login_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/register_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find<LoginUsecase>(), Get.find<RegisterUsecase>()));
    Get.lazyPut(() => LoginUsecase(repository:  AuthRepositoryImpl(authRemoteDatasource: AuthRemoteDatasourceImpl())));
    Get.lazyPut(() => RegisterUsecase(repository: AuthRepositoryImpl(authRemoteDatasource: AuthRemoteDatasourceImpl())));
  }

}