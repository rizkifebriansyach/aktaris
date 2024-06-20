import 'dart:async';
import 'dart:io';

import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/secure_storage/secure_storage_manager.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/data/model/chat/chat_model.dart';
import 'package:aktaris_app/domain/entities/chat/list_message_entity.dart';
import 'package:aktaris_app/domain/usecase/chat/chat_list_usecase.dart';
import 'package:aktaris_app/domain/usecase/chat/send_file_message_usecase.dart';
import 'package:aktaris_app/domain/usecase/chat/send_message_usecase.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_page.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  final ChatListUsecase chatListUsecase;
  final SendMessageUsecase sendMessageUsecase;
  final SendFileMessageUsecase sendFileMessageUsecase;

  ChatScreenController(this.chatListUsecase, this.sendMessageUsecase,
      this.sendFileMessageUsecase);

  RxList<Message> listMessage = <Message>[].obs;
  final inputMessageController = TextEditingController();
  final inputMessageFileController = TextEditingController();
  String? chatMessage;
  var roomId = ''.obs;
  Timer? timer;
  var username = ''.obs;
  var isSendByMe = ''.obs;

  RxInt timerDuration = 0.obs;
  RxInt minutes = 0.obs;
  var seconds = Rxn<num>();
  var cardHeight = 0.0.obs;

  File? filePath; 
  final exists = true.obs;
  final totalPages = 0.obs;
  final currentPage = 0.obs;
  final pdfReady = false.obs;
  final loaded = false.obs;
  PDFViewController? pdfViewController;

  @override
  void onInit() async {
    // setTimer();
    roomId = Get.arguments;
    isSendByMe.value = (await SecureStorageManager.find.getUsernameUser())!;
    super.onInit();
  }

  getListMessage() async {
    final result = await chatListUsecase.execute(
      ChatListParams(
        roomId: roomId.value,
      ),
    );

    result.fold((error) {
      debugPrint("error: ${error.toString()}");
      // DialogHelper.failed(message: error.toString(), onConfirm: () => Get.back(),);
    }, (response) {
      listMessage.value = response.messages!;
      debugPrint("Message nya mana : ${listMessage.value}");
    });
  }

  sendMessage() async {
    final result = await sendMessageUsecase.execute(SendMessageParams(
        roomId: roomId.value,
        message: inputMessageController.text));

    result.fold((error) {
      debugPrint("error: ${error.toString()}");
    }, (response) {});
  }

  sendFile(File? file) async {
    LoadingDialog.show();
    final result = await sendFileMessageUsecase.execute(SendFileMessageParams(
        docFile: file!.path,
        message: inputMessageFileController.text));
    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
          title: "Gagal",
          message: error.toString(),
          onConfirm: () => Get.back());
    }, (response) {
      LoadingDialog.dismiss();
      debugPrint("Chat file");
      Get.toNamed(ChatScreenPage.routeName);
    });
  }

  setTimer() {
    timerDuration.value = 1800;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timerDuration.value--;
      if (timerDuration.value <= 0) {
        timer.cancel();
      } else {
        seconds.value = timerDuration % 60;
        minutes.value = (timerDuration ~/ 60) % 60;
      }
    });
  }


  @override
  void onReady() {
    setTimer();
    getListMessage();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      getListMessage();
    });

    super.onReady();
  }

  @override
  void dispose() {
    inputMessageController.dispose();
    setTimer();
    timer?.cancel();
    super.dispose();
  }
}
