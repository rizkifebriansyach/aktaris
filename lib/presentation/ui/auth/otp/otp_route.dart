import 'package:aktaris_app/presentation/ui/auth/otp/otp_binding.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_page.dart';
import 'package:get/get.dart';

final otpRoute = [
  GetPage(
    name: OtpPage.routeName,
    page: () => const OtpPage(),
    binding: OtpBinding(),
  )
];
