import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_binding.dart';
import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_page.dart';
import 'package:get/get.dart';

final detailPaymentRoute = [
  GetPage(
    name: DetailPaymentPage.routeName,
    page: () => const DetailPaymentPage(),
    binding: DetailPaymentBinding(),
  )
];
