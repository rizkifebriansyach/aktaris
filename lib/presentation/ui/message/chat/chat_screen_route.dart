import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_binding.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_page.dart';
import 'package:get/get.dart';

final chatScreenRoute = [
  GetPage(
    name: ChatScreenPage.routeName,
    page: () => const ChatScreenPage(),
    binding: ChatScreenBinding(),
  )
];
