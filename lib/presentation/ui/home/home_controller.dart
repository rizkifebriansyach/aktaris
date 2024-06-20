import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/helper/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
   RxBool disabled = false.obs;
   final activeIndex = Rxn<int>();
   final totalPrice = 0.obs;

   var user = LocalStorage.to.getUser();

   final dotController = PageController(viewportFraction: 0.8, keepPage: true);
}