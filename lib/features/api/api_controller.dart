import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/Response.dart' as Response;
import '../../models/api_response.dart';
import '../../models/countries.dart' as countries;
import 'api_helper.dart';
import 'api_settings.dart';
import 'package:http/http.dart' as http;

class ApiController extends ApiHelper {
  var isCountries = false.obs;
  List<countries.Countries> Countries_Var = [];
  List<countries.Cities> Cities_Var = [];
  getCountries({bool refresh = false}) async {
    try {
      isCountries.value = true;
      if (refresh) {
        Countries_Var.clear();
        Cities_Var.clear();
      }
      Uri URI = Uri.parse(countriesCities);
      http.Response response = await http.get(
        URI,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body);
        var arrayCountries = array['data'] as List<dynamic>;
        var arrayCities = array['data'] as List<dynamic>;

        for (var element in arrayCountries) {
          Countries_Var.add(countries.Countries.fromJson(element));
        }

        for (var element in arrayCities) {
          Cities_Var.add(countries.Cities.fromJson(element));
        }
      } else {
        // Handle other status codes if needed
      }
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isCountries.value = false;
    }
  }

  Future<List<Intro>> getInit() async {
    List<Intro> intros = [];
    Uri URI = Uri.parse(intro);
    http.Response response = await http.get(
      URI,
      headers: headers(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> array = jsonDecode(response.body);

      List<dynamic> introsData = array['data']['intros'];
      intros = introsData.map((intro) => Intro.fromJson(intro)).toList();
      // print(array);
      // array.forEach((e) => intros.add(Intro.fromJson(e)));
      return intros;
    }
    return [];
  }

  Future<Response.Response> loginNow({email, password}) async {
    Uri uri = Uri.parse(login);
    http.post(uri);
    var data = {
      'email': email,
      'password': password,
      'fcm_token': 'fcm_token',
      'fcm_device': Platform.isAndroid ? 'android' : 'ios',
    };
    http.Response response = await http.post(uri, body: data);
    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> EmailForgetPassword({email}) async {
    Uri uri = Uri.parse(forgetPassword);
    http.post(uri);
    Map<String, dynamic> data = {
      'email': email,
    };
    http.Response response = await http.post(uri, body: data);
    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> PaymentMet({
    id,
    payment_method_id,
    String? code,
  }) async {
    String queryString = code != null && code.isNotEmpty ? "?code=$code" : "";

    Uri uri = Uri.parse("${baseUrl}packages/$id$queryString");
    http.post(uri);
    print('------------------------');
    print(code);
    print('------------------------');
    var data = {
      'payment_method_id': payment_method_id,
      'code': code,
    };
    http.Response response = await http.post(
      uri,
      body: data,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${GetStorage().read('token')}",
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: GetStorage().read('lang') == null
            ? 'en'
            : GetStorage().read('lang'),
      },
    );

    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> resetPasswordNew({
    required String email,
    required String code,
  }) async {
    Uri uri = Uri.parse(forgetVerifyCode);
    var response = await http.post(uri, body: {
      'email': email,
      'code': code,
    });

    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> registerNew({
    first_name,
    last_name,
    email,
    user_name,
    mobile,
    password,
    country_id,
    city_id,
  }) async {
    Uri uri = Uri.parse(register);
    http.post(uri);
    var data = {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'user_name': user_name,
      'mobile': mobile,
      'password': password,
      'country_id': country_id,
      'city_id': city_id,
      'fcm_token': 'fcm_token',
      'fcm_device': Platform.isAndroid ? 'android' : 'ios',
    };

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String token = responseData['data']['token'];
      GetStorage().write('token', token);

      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> changPhone({
    mobile,
  }) async {
    Uri uri = Uri.parse(changeMobile);
    http.post(uri);
    var data = {
      'mobile': mobile,
    };

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> VerPhone({
    code,
  }) async {
    Uri uri = Uri.parse(verifyChangeMobile);
    http.post(uri);
    var data = {
      'code': code,
    };

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> EdAddress({
    title,
    home_number,
    description,
    zip_code,
    country_id,
    city_id,
  }) async {
    Uri uri = Uri.parse(addressUpdate);
    http.post(uri);
    var data = {
      'title': title,
      'home_number': home_number,
      'description': description,
      'zip_code': zip_code,
      'country_id': country_id,
      'city_id': city_id,
    };

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> EdPass({
    current_password,
    new_password,
  }) async {
    Uri uri = Uri.parse(EditPassword);
    http.post(uri);
    var data = {
      'current_password': current_password,
      'new_password': new_password,
    };

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

// utils.dart
  Map<String, dynamic> mapToQuery(Map<String, dynamic> params) {
    Map<String, dynamic> query = {};
    params.forEach((key, value) {
      if (value != null) {
        if (value is int) {
          query[key] = value.toString(); // Convert int to String
        } else {
          query[key] = value;
        }
      }
    });
    return query;
  }

  Future<Response.Response> PostInter({
    int? index,
    int? id,
  }) async {
    Uri uri = Uri.parse(interestsGet);
    http.post(uri);
    Map<String, dynamic> data = mapToQuery({
      'interests_ids[$index]': id,
    });

    http.Response response =
        await http.post(uri, body: data, headers: headers());

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> UpdateProf({
    first_name,
    last_name,
    email,
    country_id,
    city_id,
    image,
  }) async {
    Uri uri = Uri.parse(updateProf);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['first_name'] = first_name;
    request.fields['last_name'] = last_name;
    request.fields['email'] = email;
    request.fields['country_id'] = country_id;
    request.fields['city_id'] = city_id;

    request.files.add(await http.MultipartFile.fromPath("image", image!));

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.acceptLanguageHeader] =
        GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = await response.stream.transform(utf8.decoder).join();

      var jsonResponse = jsonDecode(body);

      return Response.Response.fromJson(jsonResponse);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> resetCodeReg({
    required String code,
  }) async {
    Uri uri = Uri.parse(verifyCode);
    var response = await http.post(uri,
        body: {
          'code': code,
        },
        headers: headers());

    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> resetNewPassword({
    required String email,
    required String code,
    required String Password,
    required String CPassword,
  }) async {
    Uri uri = Uri.parse(resetPassword);
    var response = await http.post(uri, body: {
      'email': email,
      'code': code,
      'Password': Password,
      'c_password': CPassword,
    });

    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> logoutNow() async {
    Uri uri = Uri.parse(logout);
    var response = await http.get(uri, headers: headers());
    if (response.statusCode == 200 || response.statusCode == 401) {
      await GetStorage().erase();
      var jsonResponse = jsonDecode(response.body);
      return Response.Response(
          message: response.statusCode == 200
              ? jsonResponse['message']
              : 'Logged out successfully',
          status: true,
          data: []);
    }
    return failedResponse;
  }
}
