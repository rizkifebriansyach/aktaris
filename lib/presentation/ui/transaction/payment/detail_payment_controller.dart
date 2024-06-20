import 'dart:async';

import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/chat/create_room_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/check_status_payment_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/create_room_chat_transaction_usecase.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/database/secure_storage/secure_storage_manager.dart';

class DetailPaymentController extends GetxController {
  final CheckStatusPaymentUsecase checkStatusPaymentUsecase;
  final CreateRoomUsecase createRoomUsecase;
  final CreateRoomChatTransactionUsecase createRoomChatTransactionUsecase;
  DetailPaymentController(this.checkStatusPaymentUsecase,
      this.createRoomUsecase, this.createRoomChatTransactionUsecase);

  final billerCode = Rxn<String>();
  final billerKey = Rxn<String>();
  final paymentType = Rxn<String>();
  final totalPayment = Rxn<num>();
  final paymentStatus = Rxn<String>();
  final transactionId = Rxn<String>();

  final expiredAt = Rxn<String>();
  DateTime? expiredDate;

  RxInt minutes = 0.obs;
  var seconds = Rxn<num>();
  RxString userName = ''.obs;
  RxString roomId = ''.obs;
  var userIdNotaris = LocalStorage.to.getDetailsNotaris()?.userId;

  @override
  void onInit() {
    billerCode.value = Get.arguments[0];
    billerKey.value = Get.arguments[1];
    paymentType.value = Get.arguments[2];
    totalPayment.value = Get.arguments[3];
    paymentStatus.value = Get.arguments[4];
    transactionId.value = Get.arguments[5];
    expiredAt.value = Get.arguments[6];
    expiredDate = DateTime.parse(expiredAt.value!);
    super.onInit();
  }

  @override
  void onReady() {
    int secondsDifferent = expiredDate!.difference(DateTime.now()).inSeconds;
    setTimer(secondsDifferent);
    super.onReady();
  }

  setTimer(int timerDuration) {
    // Output pertama kali
    // printDuration(seconds);

    // Buat timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timerDuration--;
      // printDuration(seconds);

      // Hentikan timer ketika waktu habis
      if (timerDuration <= 0) {
        print("Waktu telah habis!");
        timer.cancel();
      } else {
        seconds.value = timerDuration % 60;
        minutes.value = (timerDuration ~/ 60) % 60;
      }
    });
  }

  checkPaymentStatus() async {
    LoadingDialog.show();
    final result = await checkStatusPaymentUsecase
        .execute(CheckStatusPaymentParams(transactionId: transactionId.value!));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        title: "Gagal",
        message: error.toString(),
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      paymentStatus.value = response["payment_status"];
      if (paymentStatus.value == "success") {
        createRoomTransaction(userIdNotaris!);
      }
    });
  }

  createRoomTransaction(int userId) async {
    LoadingDialog.show();
    final result = await createRoomChatTransactionUsecase.execute(
        CreateRoomChatTransactionParams(
            userId: userId, transactionId: transactionId.value!));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
          title: "Gagal",
          message: error.toString(),
          onConfirm: () => Get.back());
    }, (response) {
      userName.value = response["chat"]["room"]["usernames"][0];
      roomId.value = response["chat"]["room"]["rid"];
      SecureStorageManager.find.setUsernameUser(value: userName.value);
      LoadingDialog.dismiss();
      DialogHelper.success(
        message: "Room Berhasil Dibuat",
        title: "Berhasil",
        onConfirm: () => Get.offNamedUntil(
          ChatScreenPage.routeName,
          arguments: roomId,
          ModalRoute.withName(BottomNavBarComponent.routeName),
        ),
      );
    });
  }
}
