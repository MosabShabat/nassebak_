import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLocalController extends GetxController {
  final lang = GetStorage();
  Locale? initialLang;

  @override
  void onInit() {
    super.onInit();
    initialLang = lang.read('lang') == null
        ? Get.deviceLocale!
        : Locale(lang.read('lang'));
  }

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    lang.write("lang", codeLang);
    Get.updateLocale(locale);
  }
}
