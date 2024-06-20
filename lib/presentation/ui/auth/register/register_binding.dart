import 'package:aktaris_app/data/datasource/auth_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/auth/register_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find<RegisterUsecase>()));
    Get.lazyPut(() => RegisterUsecase(repository: AuthRepositoryImpl(authRemoteDatasource: AuthRemoteDatasourceImpl())));
  }

}