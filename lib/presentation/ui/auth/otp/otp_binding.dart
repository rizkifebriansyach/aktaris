import 'package:aktaris_app/data/datasource/auth_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/auth/resend_login_otp_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/resend_register_otp_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/verify_login_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/verify_register_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_controller.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController(
          Get.find<VerifyLoginUsecase>(),
          Get.find<VerifyRegisterUsecase>(),
          Get.find<ResendLoginOtpUsecase>(),
          Get.find<ResendRegisterOtpUsecase>(),
        ));
    Get.lazyPut(() => VerifyLoginUsecase(
        repository: AuthRepositoryImpl(
            authRemoteDatasource: AuthRemoteDatasourceImpl())));
    Get.lazyPut(() => VerifyRegisterUsecase(
        repository: AuthRepositoryImpl(
            authRemoteDatasource: AuthRemoteDatasourceImpl())));
    Get.lazyPut(() => ResendLoginOtpUsecase(
        repository: AuthRepositoryImpl(
            authRemoteDatasource: AuthRemoteDatasourceImpl())));
    Get.lazyPut(() => ResendRegisterOtpUsecase(
        repository: AuthRepositoryImpl(
            authRemoteDatasource: AuthRemoteDatasourceImpl())));
  }
}
