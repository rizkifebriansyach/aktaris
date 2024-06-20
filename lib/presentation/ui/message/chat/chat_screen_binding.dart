import 'package:aktaris_app/data/datasource/chat/chat_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/chat/chat_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/chat/chat_list_usecase.dart';
import 'package:aktaris_app/domain/usecase/chat/send_file_message_usecase.dart';
import 'package:aktaris_app/domain/usecase/chat/send_message_usecase.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_controller.dart';
import 'package:get/get.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController(Get.find<ChatListUsecase>(),
        Get.find<SendMessageUsecase>(), Get.find<SendFileMessageUsecase>()));
    Get.lazyPut(() => ChatListUsecase(
        repository: ChatRepositoryImpl(
            chatRemoteDatasource: ChatRemoteDatasourceImpl())));
    Get.lazyPut(() => SendMessageUsecase(
        chatRepository: ChatRepositoryImpl(
            chatRemoteDatasource: ChatRemoteDatasourceImpl())));
    Get.lazyPut(() => SendFileMessageUsecase(
        chatRepository: ChatRepositoryImpl(
            chatRemoteDatasource: ChatRemoteDatasourceImpl())));
  }
}
