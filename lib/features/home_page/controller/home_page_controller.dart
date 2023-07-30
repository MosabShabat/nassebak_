import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../consts/conste.dart';
import '../../../models/deals.dart';
import '../../../models/deals_details.dart';
import '../../api/api_helper.dart';
import '../../api/api_settings.dart';
import 'dart:convert';
import '../../../models/Response.dart' as Response;

class HomePageController extends GetxController with ApiHelper {
  RxBool isInit = true.obs;
  RxBool isInitFav = true.obs;
  RxBool initFav = false.obs;

  var isDataLoading = false.obs;
  var isDeals_details = false.obs;
  var isFavLoading = false.obs;

  RxList<DealsVar> favVar = <DealsVar>[].obs;
  List<DealsVar> deals_Var = [];
  List<DealsVar> Fav_Var = [];
  DealsDetails? Deals_details;

  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;
  bool isLoadingMore = false;

  Future<void> getHomeDeals({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        deals_Var.clear();
      }

      Uri uri = Uri.parse('$home?page=$currentPage&per_page=$perPage');
      //    print('$home?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data']['deals'];
        totalDeals = responseData['pages']['total'];
        array.forEach((element) {
          deals_Var.add(DealsVar.fromJson(element));
        });

        if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  void resetPagination() {
    currentPage = 1;
  }

  Future<void> getDealsDetails(id) async {
    try {
      isDeals_details(true);
      Uri uri = Uri.parse("${baseUrl}deals/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        Deals_details = DealsDetails.fromJson(array);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDeals_details(false);
    }
  }

  Future<Response.Response> isFav(id) async {
    initFav.value = true;

    Uri uri = Uri.parse("${baseUrl}favorites/$id");
    http.Response response = await http.post(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${GetStorage().read('token')}",
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: GetStorage().read('lang') == null
            ? 'en'
            : GetStorage().read('lang'),
      },
    );

    if (response.statusCode == 200) {
      var responseData = Response.Response.fromJson(jsonDecode(response.body));

      // if (responseData.status!) {
      //   var itemIndex = favVar.indexWhere((item) => item.id == id);
      //   if (itemIndex != -1) {
      //     favVar[itemIndex].isFavorite = !favVar[itemIndex].isFavorite!;
      //   }
      // }
      print('----------- here -----------------');
      // print(response.body.['is_favorite']);
      print(favVar.length);
      print('----------- here -----------------');
      return responseData;
    } else {
      throw Exception('Failed to post favorite');
    }
  }

  Future<void> getFavData({bool refresh = false}) async {
    try {
      Fav_Var.clear();
      isFavLoading(true);
      if (refresh && currentPage == 1) {
        Fav_Var.clear();
      }

      Uri uri = Uri.parse(favorites);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var arrayFav = responseData['data']['items'];
        var totalPages = responseData['pages']['total'];
        arrayFav.forEach((element) {
          Fav_Var.add(DealsVar.fromJson(element));
        });
        print('<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');
        print(Fav_Var.length);
        print('<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');

        if (currentPage < totalPages && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting favorite data: $e');
    } finally {
      isFavLoading(false);
    }
  }
}
