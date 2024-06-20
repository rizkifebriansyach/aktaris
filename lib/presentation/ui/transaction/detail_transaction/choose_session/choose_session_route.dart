import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/choose_session/choose_session_page.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_binding.dart';
import 'package:get/get.dart';

final chooseSessionRoute = [
  GetPage(
    name: ChooseSessionPage.routeName,
    page: () => const ChooseSessionPage(),
    binding: DetailTransactionBinding(),
  )
];
