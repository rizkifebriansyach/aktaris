import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/entities/transaction/transaction_history_entity.dart';
import 'package:aktaris_app/domain/usecase/transaction/get_list_history_order_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final GetListHistoryOrderUsecase getListHistoryOrderUsecase;
  TransactionController(this.getListHistoryOrderUsecase);

  final role = Rxn<String>();
  RxList<TransactionHistoryEntity> responseListNotaris =
      <TransactionHistoryEntity>[].obs;

  requestListHistoryOrder() async {
    LoadingDialog.show();
    final result = await getListHistoryOrderUsecase.execute();

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        title: 'Gagal',
        message: error.toString(),
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      responseListNotaris.value = response;
    });
  }

  getStatusColor(String status) {
    switch (status) {
      case 'unpaid':
        return Colors.red.withOpacity(0.2);
      case 'pending':
       return Colors.yellow.withOpacity(0.2);
      case 'failed':
       return Colors.red.withOpacity(0.2);
      case 'success':
        return AppColors.primary.withOpacity(0.2);
      default:
        return Colors.blue.withOpacity(0.2);
    }
  }

  // switch (controller.paymentStatus.value) {
  //                       case 'unpaid':
  //                         return Text(
  //                           "Belum Bayar",
  //                           style: AppStyle.body2.copyWith(color: Colors.red),
  //                         );
  //                       case 'pending':
  //                         return Text(
  //                           "Menunggu Pembayaran",
  //                           style: AppStyle.body2
  //                               .copyWith(color: Colors.red, fontSize: 10),
  //                         );
  //                       case 'failed':
  //                         return Text(
  //                           "Gagal",
  //                           style: AppStyle.body2.copyWith(color: Colors.red),
  //                         );
  //                       case 'success':
  //                         return Text(
  //                           "Berhasil",
  //                           style: AppStyle.body2.copyWith(color: Colors.green),
  //                         );
  //                       default:
  //                         return const Text("");
  //                     }

  convertStatusValue(String status){
    switch (status) {
      // case 'unpaid':
      //   return "Menunggu";
      // case 'pending':
      //  return "Menunggu";
      case 'failed':
       return "Gagal";
      case 'success':
        return "Berhasil";
      default:
        return "Menunggu";
    }
  }

   getStatusTextColor(String status) {
    switch (status) {
      case 'unpaid':
        return Colors.red;
      case 'pending':
       return Colors.yellow;
      case 'failed':
       return Colors.red;
      case 'success':
        return AppColors.primary;
      default:
        return Colors.blue;
    }
  }

  @override
  void onReady() {
    requestListHistoryOrder();
    super.onReady();
  }
}
