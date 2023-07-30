import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../consts/conste.dart';
import '../../../models/partners.dart';
import '../../api/api_helper.dart';
import '../../api/api_settings.dart';
import '../../../models/partners_details_controller.dart';

class partnerOffersController extends GetxController with ApiHelper {
  List<partners> Partners_Var = [];
  partnersDetails? Partners_details_var;
  var isPartners_details = false.obs;

  var isDataLoading = false.obs;
  RxBool isInit = true.obs;

  int currentPage = 1;
  int perPage = 15;
  bool isLoadingMore = false;

  getPartners({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        Partners_Var.clear();
      }
      Uri uri = Uri.parse('$partnersApi?page=$currentPage&per_page=$perPage');
      print('$partners?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        var totalPages = jsonData['pages']['total'];
        array.forEach((element) {
          Partners_Var.add(partners.fromJson(element));
        });
        // print(totalPages);
        // print('================  $currentPage ================');

        if (currentPage < totalPages && currentPage != currentPage) {
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

  void loadMorePackages() {
    if (!isLoadingMore) {
      isLoadingMore = true;
      getPartners(refresh: true).then((value) {
        isLoadingMore = false;
        update();
      });
    }
  }

  Future<void> getPartnersDetails(id) async {
    try {
      isPartners_details(true);
      Uri uri = Uri.parse("${baseUrl}partners/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        Partners_details_var = partnersDetails.fromJson(array);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isPartners_details(false);
    }
  }
}
