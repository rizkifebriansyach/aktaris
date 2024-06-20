import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_binding.dart';
import 'package:aktaris_app/presentation/ui/message/preview_file_message/preview_file_message_page.dart';
import 'package:get/get.dart';

final previewFileRoute = [
  GetPage(
    name: PreviewFileMessagePage.routeName,
    page: () => const PreviewFileMessagePage(),
    binding: ChatScreenBinding(),
  )
];
