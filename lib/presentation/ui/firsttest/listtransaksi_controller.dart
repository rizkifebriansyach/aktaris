import 'package:aktaris_app/core/database/static_data/dropdown_data.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/domain/usecase/notaris_list_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/database/get_storage.dart';
import '../../../data.dart';

// ignore: camel_case_types
class listtransaksiController extends GetxController
    {
  final NotarisListUsecase notarisListUsecase;
  listtransaksiController(this.notarisListUsecase);

  RxBool isSearchOpen = false.obs;
  TextEditingController searchController = TextEditingController();
  List<DropdownData> dataSortLocation = DropdownData.getSortLocation();

  RxBool isDropdownActive = false.obs;
  RxBool isAllSelected = false.obs;
  RxBool isNearlySelected = false.obs;
  RxBool isOnlineSelected = false.obs;

  RxString sortList = "".obs;
  RxString selectedValue = "".obs;
  final selectedSortLocation = Rxn<DropdownData?>();
  late TabController tabController;
  RxList dataNotaris = [].obs;
  RxList filteredNotaris = [].obs;
  RxList<NotarisListEntity> responseListNotaris = <NotarisListEntity>[].obs;
  RxString image = ''.obs;

  @override
  void onReady() {
    getNotarisList();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    // Set the initial filtered items to be the same as the full list
    // filterItems();
    // getNotarisList();
  }

  getNotarisList() async {
    debugPrint("masuk sini");
    LoadingDialog.show();
     debugPrint("masuk sini5");
    final result = await notarisListUsecase.execute();
    debugPrint("masuk sini1");
    
    result.fold((error) {
      debugPrint("masuk sini2");
      var token = LocalStorage.to.getToken();
      LoadingDialog.dismiss();
      debugPrint(error.message);
      debugPrint("Token local $token");
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      responseListNotaris.value = response;
      LoadingDialog.dismiss();
      debugPrint("response data : ${response.toString()}");
    });
  }

  void filterItems() {
    // if (isSearchOpen.value) {
    dataNotaris.value = notarisList;
    String searchText = searchController.text.toLowerCase();

    if (isSearchOpen.value) {
      return filteredNotaris.assignAll(dataNotaris.where((notaris) {
        final name = notaris['name'].toString().toLowerCase();
        final status = notaris['status'].toString().toLowerCase();
        final pengalaman = notaris['pengalaman'].toString().toLowerCase();

        return name.contains(searchText) ||
            status.contains(searchText) ||
            pengalaman.contains(searchText);
      }).toList());
    } else if (isOnlineSelected.value) {
      return filteredNotaris.assignAll(dataNotaris.where((notaris) {
        return notaris['status'].toString().toLowerCase() == 'online';
      }).toList());
    } else {
      return filteredNotaris.assignAll(dataNotaris);
    }
  }

  @override
  void onClose() {
    // Dispose the TextEditingController when the controller is disposed
    searchController.dispose();
    super.onClose();
  }
}
