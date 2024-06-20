import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_binding.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_page.dart';
import 'package:get/get.dart';

final detailTransactionRoute = [
  GetPage(
    name: DetailTransactionPage.routeName,
    page: () => const DetailTransactionPage(),
    binding: DetailTransactionBinding(),
  )
];
