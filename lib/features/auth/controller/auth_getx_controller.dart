import 'dart:io';
import 'package:get_storage/get_storage.dart';
import '../../../consts/conste.dart';
import '../../../models/Response.dart'as Response;
import '../../api/api_controller.dart';

class AuthGetxController extends GetxController {
  Future<bool> login({email, password}) async {
    print('login');
    Response.Response response = await ApiController().loginNow(
      email: email,
      password: password,
    );
    var dataRes = response.data!;

    if (response.status!) {
      GetStorage().write("id", dataRes['id']);
      GetStorage().write("token", dataRes['token']);
      return response.status!;
    } else {
      return response.status!;
    }
  }

  Future<Response.Response> ForgetPass({email}) async {
    print('============== ForgetPass ==============');
    Response.Response response = await ApiController().EmailForgetPassword(
      email: email,
    );
    return response;
  }

  Future<Response.Response> PayMet({
    id,
    payment_method_id,
    code,
  }) async {
    Response.Response response = await ApiController().PaymentMet(
      id: id,
      payment_method_id: payment_method_id,
      code: code,
    );
    return response;
  }

  //PaymentMet

  Future<Response.Response> reset({email, code}) async {
    Response.Response response = await ApiController().resetPasswordNew(
      email: email,
      code: code,
    );
    return response;
  }

  Future<Response.Response> resetReg({code}) async {
    Response.Response response = await ApiController().resetCodeReg(
      code: code,
    );
    print('resetReg ============ ${response.status}');
    return response;
  }

  Future<Response.Response> resetPass(
      {email, code, password, c_password}) async {
    Response.Response response = await ApiController().resetNewPassword(
      email: email,
      code: code,
      Password: password,
      CPassword: c_password,
    );
    return response;
  }

  Future<Response.Response> register({
    first_name,
    last_name,
    email,
    user_name,
    mobile,
    password,
    country_id,
    city_id,
  }) async {
    Response.Response response = await ApiController().registerNew(
      first_name: first_name,
      last_name: last_name,
      email: email,
      user_name: user_name,
      mobile: mobile,
      password: password,
      country_id: country_id,
      city_id: city_id,
    );
    return response;
  }

  Future<Response.Response> EditProf({
    first_name,
    last_name,
    email,
    country_id,
    city_id,
    image,
  }) async {
    Response.Response response = await ApiController().UpdateProf(
      first_name: first_name,
      last_name: last_name,
      email: email,
      country_id: country_id,
      city_id: city_id,
      image: image,
    );
    return response;
  }

  Future<Response.Response> EditPhone({
    mobile,
  }) async {
    Response.Response response = await ApiController().changPhone(
      mobile: mobile,
    );
    return response;
  }

  Future<Response.Response> VeriPhone({
    code,
  }) async {
    Response.Response response = await ApiController().VerPhone(
      code: code,
    );
    return response;
  }

  Future<Response.Response> EdPassword({
    current_password,
    new_password,
  }) async {
    Response.Response response = await ApiController().EdPass(
      current_password: current_password,
      new_password: new_password,
    );
    return response;
  }

  Future<Response.Response> PostInterested({
    index,
    id,
  }) async {
    Response.Response response = await ApiController().PostInter(
      index: index,
      id: id,
    );
    return response;
  }

  Future<Response.Response> EdAddressFunc({
    title,
    home_number,
    description,
    zip_code,
    country_id,
    city_id,
  }) async {
    Response.Response response = await ApiController().EdAddress(
      title: title,
      home_number: home_number,
      description: description,
      zip_code: zip_code,
      country_id: country_id,
      city_id: city_id,
    );
    return response;
  }
  //EdAddress

  Future<Response.Response> logout() async {
    Response.Response response = await ApiController().logoutNow();
    return response;
  }
}
