import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/database/static_data/dropdown_data.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_field.dart';
import 'package:aktaris_app/presentation/widget/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helper/validator_helper.dart';
import '../../../../widget/custom_appbar.dart';
import '../../../../widget/custom_button.dart';

class ChangePersonalDataPage extends GetView<ChangePersonalDataController> {
  static String routeName = '/change-personaldata';
  const ChangePersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Ubah Data Pribadi',
          titleStyle: const TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 18),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: inputData()),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SkyButton(
                text: 'Simpan Perubahan',
                textColor: Colors.white,
                onPressed: () {
                  controller.requestSubmitData();
                }),
          )
        ],
      ),
    );
  }

  Widget inputData() {
    return SizedBox(
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return ListTile(
            title: Form(
              key: controller.formKeyChangeProfile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFieldForm(
                    controller: controller.nameController,
                    label: 'Nama Lengkap',
                    hint: 'Masukan nama',
                    keyboardType: TextInputType.name,
                    icon: Icons.person,
                    maxLines: 1,

                    // onChanged: (value) {
                    //   // controller.email.value = value;
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.birthPlaceController,
                    label: 'Tempat Lahir',
                    hint: 'Masukan tempat lahir',
                    keyboardType: TextInputType.text,
                    icon: Icons.location_city,
                    maxLines: 1,

                    // onChanged: (value) {
                    //   // controller.email.value = value;
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.addressController,
                    label: 'Alamat',
                    hint: 'Masukan Alamat',
                    keyboardType: TextInputType.text,
                    icon: Icons.location_city,
                    maxLines: 1,

                    // onChanged: (value) {
                    //   // controller.email.value = value;
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.birthDateController,
                    label: 'Tanggal Lahir',
                    hint: 'Masukan tanggal lahir',
                    keyboardType: TextInputType.datetime,
                    icon: Icons.date_range,
                    maxLines: 1,
                    onPress: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(1990),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        if (value == null) {
                          controller.birthDateController.text =
                              "Masukan tanggal lahir Anda";
                        } else {
                          var formatDate =
                              DateFormat('dd MMMM yyyy').format(value);
                          controller.birthDateController.text = formatDate;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRadioField(
                          title: "Laki-laki",
                          child: Radio(
                            value: 'M',
                            groupValue: controller.selectedGender.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          ),
                        ),
                        CustomRadioField(
                          title: "Perempuan",
                          child: Radio(
                            value: 'F',
                            groupValue: controller.selectedGender.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.nikController,
                    label: 'NIK',
                    hint: 'Masukan NIK',
                    keyboardType: TextInputType.number,
                    icon: Icons.credit_card,
                    maxLines: 1,
                    validator: (value) => ValidatorHelper.field(
                      title: 'NIK',
                      value: value.toString(),
                    ),
                    onChanged: (value) {
                      // controller.email.value = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.npwpController,
                    label: 'NPWP',
                    hint: 'Masukan npwp',
                    keyboardType: TextInputType.number,
                    icon: Icons.credit_card,
                    maxLines: 1,
                    validator: (value) => ValidatorHelper.field(
                      title: 'NPWP',
                      value: value.toString(),
                    ),
                    onChanged: (value) {
                      // controller.email.value = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status Pernikahan",
                            style: AppStyle.body2,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            width: 160,
                            child: DropdownButtonFormField(
                                hint: Text(
                                  "Status Menikah",
                                  style: AppStyle.body2,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.primary),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                items: controller.dataMarriageStatus
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.title!,
                                          style: AppStyle.body2,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (item) {
                                  controller.selectedMarriageStatus.value =
                                      item as DropdownData;
                                }),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Agama",
                            style: AppStyle.body2,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            width: 160,
                            child: DropdownButtonFormField(
                              hint: Text(
                                "Agama",
                                style: AppStyle.body2,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              items: controller.dataReligion
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.title!,
                                        style: AppStyle.body2,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedReligion.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomFieldForm(
                    controller: controller.motherNameController,
                    label: 'Nama Ibu Kandung',
                    hint: 'Masukan nama ibu kandung',
                    // keyboardType: TextInputType.emailAddress,
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    validator: (value) => ValidatorHelper.field(
                      title: 'Nama Ibu',
                      value: value.toString(),
                    ),
                    onChanged: (value) {
                      // controller.email.value = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
