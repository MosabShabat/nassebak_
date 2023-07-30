import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../models/Package.dart';
import '../../api/api_helper.dart';
import '../../api/api_settings.dart';

class packageController extends GetxController with ApiHelper {
  List<Package> Package_Var = [];
  var isInitPay = true.obs;
  var MainPackage_Var = 0.obs;
  Package? Package_Det;
  PromoCode? Promo_Code;
  Bill? Bill_Var;
  List<PaymentMethods> Payment_Var = [];

  //promo_code

  var isDataLoading = false.obs;
  var isPackageDetailsLoading = false.obs;

  RxBool isInit = true.obs;

  int currentPage = 1;
  int perPage = 15;
  bool isLoadingMore = false;

  Future<void> getPackageDetails(id) async {
    try {
      isPackageDetailsLoading(true);
      Payment_Var.clear();
      Uri uri = Uri.parse("${baseUrl}packages/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body)['data'];
        var arrayPayment = jsonData['payment_methods'];

        Package_Det = Package.fromJson(jsonData['package']);
        Promo_Code = PromoCode.fromJson(jsonData['promo_code']);
        Bill_Var = Bill.fromJson(jsonData['bill']);

        arrayPayment.forEach((element) {
          Payment_Var.add(PaymentMethods.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isPackageDetailsLoading(false);
    }
  }

  getTickets({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        MainPackage_Var.value = 0;
      }
      Uri uri = Uri.parse('$packages?page=$currentPage&per_page=$perPage');
      print('$packages?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data'];
        var totalPages = jsonData['pages']['total'];
        MainPackage_Var.value = array['tickets'];
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

  getPackage({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        Package_Var.clear();
      }
      Uri uri = Uri.parse('$packages?page=$currentPage&per_page=$perPage');
      print('$packages?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['packages'];
        var totalPages = jsonData['pages']['last_page'];
        array.forEach((element) {
          Package_Var.add(Package.fromJson(element));
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
      //getTickets
      getTickets(refresh: true).then((value) {
        isLoadingMore = false;
        update();
      });
      getPackage(refresh: true).then((value) {
        isLoadingMore = false;
        update();
      });
    }
  }
}
