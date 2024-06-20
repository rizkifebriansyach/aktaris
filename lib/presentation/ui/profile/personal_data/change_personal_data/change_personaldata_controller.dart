import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/static_data/dropdown_data.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/profile/change_profile_data_usecase.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/personal_data_page.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePersonalDataController extends GetxController {
  final ChangeProfileDataUsecase changeProfileDataUsecase;
  ChangePersonalDataController(this.changeProfileDataUsecase);

  final formKeyChangeProfile = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final birthDateController = TextEditingController();
  final birthPlaceController = TextEditingController();
  final nameController = TextEditingController();
  final nikController = TextEditingController();
  final npwpController = TextEditingController();
  final motherNameController = TextEditingController();
  final addressController = TextEditingController();

  final selectedGender = Rxn<String?>();

  RxBool hiddenText = true.obs;
  RxBool hiddenText1 = true.obs;

  final selectedMarriageStatus = Rxn<DropdownData?>();
  final selectedReligion = Rxn<DropdownData?>();

  List<DropdownData> dataMarriageStatus = DropdownData.getMarriageStatus();
  List<DropdownData> dataReligion = DropdownData.getReligion();

  void requestSubmitData() async {
    LoadingDialog.show();
    final result =
        await changeProfileDataUsecase.execute(ChangeProfileDataParams(
      address: addressController.text,
      birthPlace: birthPlaceController.text,
      name: nameController.text,
      nik: nikController.text,
      marriageStatus: selectedMarriageStatus.value?.value,
      religion: selectedReligion.value?.value,
      dateOfBirth: birthDateController.text,
      gender: selectedGender.value,
      motherName: motherNameController.text,
      npwp: npwpController.text,
    ));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        title: "Gagal",
        message: error.toString(),
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      DialogHelper.success(
        title: "Berhasil",
        message: "Data berhasil diubah",
        onConfirm: () => Get.offNamedUntil(PersonalDataPage.routeName,
            ModalRoute.withName(BottomNavBarComponent.routeName)),
      );
    });
  }

  @override
  void dispose() {
    nameController.clear();
    nikController.clear();
    npwpController.clear();
    addressController.clear();
    birthDateController.clear();
    birthPlaceController.clear();
    motherNameController.clear();
    nameController.dispose();
    nikController.dispose();
    npwpController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    birthPlaceController.dispose();
    motherNameController.dispose();
    super.dispose();
  }
}
