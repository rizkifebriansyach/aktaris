import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_binding.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_page.dart';
import 'package:get/get.dart';

final detailHistoryRoute = [
  GetPage(
    name: DetailHistoryPage.routeName,
    page: () => const DetailHistoryPage(),
    binding: DetailHistoryBinding(),
  )
];
