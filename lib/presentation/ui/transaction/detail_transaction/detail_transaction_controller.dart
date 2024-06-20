import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/domain/usecase/transaction/create_transaction_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/getprice_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/payment_usecaase.dart';
import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTransactionController extends GetxController {
  final GetPriceUsecase getPriceUsecase;
  final CreateTransactionUsecase createTransactionUsecase;
  final PaymentUsecase paymentUsecase;
  DetailTransactionController(
      this.getPriceUsecase, this.createTransactionUsecase, this.paymentUsecase);

  late NotarisListEntity detailData;
  final titleKonsultasi = Rxn<String>();
  final priceKonsultasi = 50000.obs;
  var poinsIsActive = false.obs;
  var disabled = false.obs;
  final activeIndex = Rxn<int>();
  final totalPrice = 0.obs;

  late String deeplinkGopay;
  late String paymentType;

  var billerCode = Rxn<String>();
  var billerKey = Rxn<String>();

  final transactionId = Rxn<String>();
  var biayaLayanan = 0.obs;
  var totalFee = 0.obs;
  var taxFee = 0.obs;
  var totalPayment = Rxn<num>();
  var discount = 20000.obs;
  var paymentStatus = Rxn<String>();
  var userId = Rxn<int>();
  var expiredAt = Rxn<String>();


  @override
  void onReady() async {
    await getPrice();
    debugPrint("total payment : ${totalPayment.value}");
    super.onReady();
  }

  @override
  void onInit() {
    detailData = Get.arguments;
    debugPrint("Data : $detailData");
    debugPrint("price : ${priceKonsultasi.value}");
    super.onInit();
  }

  getPrice() async {
    LoadingDialog.show();
    final result = await getPriceUsecase
        .execute(const GetPriceParams(productName: "Konsultasi"));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      biayaLayanan.value = response["biaya_layanan"];
      totalFee.value = response["sub_total_fee"];
      taxFee.value = response["tax_fee"];
      totalPayment.value = priceKonsultasi.value +
          biayaLayanan.value +
          taxFee.value -
          discount.value;
      LoadingDialog.dismiss();
    });
  }

  createTransaction() async {
    // LoadingDialog.show();
    final result = await createTransactionUsecase
        .execute(const CreateTransactionParams(productName: "Konsultasi"));

    result.fold((error) {
      // LoadingDialog.dismiss();
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      transactionId.value = response["transaction_id"];
      // LoadingDialog.dismiss();
    });
  }

  requestPayment(String paymentType) async {
    LoadingDialog.show();
    final result = await paymentUsecase.execute(PaymentParams(
        transactionId: transactionId.value!, paymentType: paymentType));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      if (paymentType == "gopay") {
        deeplinkGopay = response["midtrans"]["actions"][1]["url"];
        debugPrint("deeplinkGopay : $deeplinkGopay");
        // prefs.setInt(KeyPrefs.userIdNotaris, response["transaction"]["user_id"]);
        canLaunchUrl(Uri.parse(deeplinkGopay));
      } else if (paymentType == "mandiri") {
        billerCode.value = response["midtrans"]["biller_code"];
        billerKey.value = response["midtrans"]["bill_key"];
        totalPayment.value = response["transaction"]["sub_total_fee"];
        paymentStatus.value = response["transaction"]["payment_status"];
        expiredAt.value = response["transaction"]["expired_at"];
        // prefs.setInt(KeyPrefs.userIdNotaris, response["transaction"]["user_id"]);
        Get.toNamed(
          DetailPaymentPage.routeName,
          arguments: [
            billerCode.value,
            billerKey.value,
            paymentType,
            totalPayment.value,
            paymentStatus.value,
            transactionId.value,
            expiredAt.value,  
          ],
        );
      }
    });
  }
}
