import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_binding.dart';
import 'package:aktaris_app/presentation/ui/transaction/transaction_page.dart';
import 'package:get/get.dart';

final transactionRoute = [
  GetPage(
    name: TransactionPage.routeName,
    page: () => const TransactionPage(),
    binding: NavbarBinding(),
  )
];
