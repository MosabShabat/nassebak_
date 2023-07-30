import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../consts/conste.dart';
import '../../../models/award.dart';
import '../../../models/awards.dart' as Awards;
import '../../api/api_helper.dart';
import '../../api/api_settings.dart';

class AwardsController extends GetxController with ApiHelper {
  List<Awards.Awards> Awards_Var = [];
  var MainAwards_Var = 0.obs;

  var isDataLoading = false.obs;
  RxBool isInit = true.obs;
  RxBool isInitAward = true.obs;

  var isAwardLoad = false.obs;

  Award AwardDet_Var = Award();

  //Award

  int currentPage = 1;
  int perPage = 15;
  bool isLoadingMore = false;

  getPoints({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        MainAwards_Var.value = 0;
      }
      Uri uri = Uri.parse('$awards?page=$currentPage&per_page=$perPage');
      print('$awards?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data'];
        var totalPages = jsonData['pages']['total'];
        MainAwards_Var.value = array['points'];
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

  Future<void> getAward(id) async {
    try {
      isAwardLoad(true);
      // AwardDet_Var.description = '';
      // AwardDet_Var.id = 0;
      // AwardDet_Var.image = '';
      // AwardDet_Var.title = '';
      // AwardDet_Var.expiryDate = '';
      // AwardDet_Var.points = 0;
      // AwardDet_Var.quantity = 0;

      Uri uri = Uri.parse("${baseUrl}awards/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var awardData = jsonData['data'];
        AwardDet_Var = Award.fromJson(awardData);
        // print('***************');
        // print(AwardDet_Var.image);
        // AwardDet_Var.image = AwardDet_Var.image;
        // print('***************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isAwardLoad(false);
    }
  }

  getAwards({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        Awards_Var.clear();
      }
      Uri uri = Uri.parse('$awards?page=$currentPage&per_page=$perPage');
      print('$packages?page=$currentPage&per_page=$perPage');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['awards'];
        var totalPages = jsonData['pages']['last_page'];
        array.forEach((element) {
          Awards_Var.add(Awards.Awards.fromJson(element));
        });
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
      getPoints(refresh: true).then((value) {
        isLoadingMore = false;
        update();
      });
      getAwards(refresh: true).then((value) {
        isLoadingMore = false;
        update();
      });
    }
  }
}
