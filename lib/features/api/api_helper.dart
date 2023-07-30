import 'dart:io';
import 'package:get_storage/get_storage.dart';

import '../../consts/conste.dart';
import '../../local/my_local_controller.dart';
import '../../models/Response.dart' as Response;

class ApiHelper {
  MyLocalController controller = Get.put(MyLocalController());

  Response.Response get failedResponse => Response.Response(
      message: 'Something went wrong, try again', status: false, data: []);
  Map<String, String> headers() {
    String? token = GetStorage().read('token');
    return {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.acceptLanguageHeader:
          GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang'),
    };
  }
}
