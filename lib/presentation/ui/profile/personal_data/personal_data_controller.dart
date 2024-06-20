import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:get/get.dart';

class PersonalDataController extends GetxController{

  
  
  var userDetail = LocalStorage.to.getUser().obs;
}