import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../consts/conste.dart';
import '../../../models/about_app.dart';
import '../../../models/account.dart';
import '../../../models/acoount_info.dart';
import '../../../models/address_data.dart';
import '../../../models/countries.dart' as countries;
import '../../../models/deals.dart';
import '../../../models/inter_item.dart';
import '../../../models/purchase_packages.dart';
import '../../../models/sections_items.dart';
import '../../api/api_helper.dart';
import '../../api/api_settings.dart';

class profileController extends GetxController with ApiHelper {
  User? user_Var;
  AccountInfo? Acc_Var;
  AccountInfo? AccEd_Var;

  List<SocialMediaData> socialMediaList_var = [];
  List<sectionsItems> sectionsItems_var = [];
  List<InterItem> InterItem_var = [];
  List<DealsVar> sub_sections_var = [];
  List<AboutApp> AboutApp_var = [];
  List<AboutApp> AboutAppTaps_var = [];
  List<sectionsItems> sections_details = [];
  List<PurchasedPackages> purchased_packages_var = [];

  RxString SectionDet_Var = '0'.obs;
  RxString SubSections_var = '0'.obs;

  //PurchasedPackages

  var isDataLoading = false.obs;
  var isDataAcLoading = false.obs;
  var isDataAcEdLoading = false.obs;
  var isDataSections = false.obs;
  var isInter = false.obs;
  var isSection_details = false.obs;
  var isSubSections_details = false.obs;
  var isAboutApp = false.obs;
  var isAboutAppTaps = false.obs;
  var isPurchasedPackages = false.obs;

  RxBool isInit = true.obs;
  RxBool isInitAcc = true.obs;
  RxBool isInitHis = true.obs;
  RxBool isInitAccEd = true.obs;
  RxBool isInitPrivacyPolicy = true.obs;
  RxBool isInitTermsAndConditions = true.obs;
  RxBool isInitAboutTheApplication = true.obs;
  RxBool isInitSections = true.obs;
  RxBool isInitDet = true.obs;
  RxBool isInitSubSections = true.obs;
  RxBool isInitCountriesCities = true.obs;
  RxBool isInitInter = true.obs;

  int currentPage = 1;
  int perPage = 15;
  bool isLoadingMore = false;
  bool isLoadingMoreSec = false;

  var profileImgPath = ''.obs;

  var isCountriesCities = false.obs;
  List<countries.Countries> Countries_Var = [];
  List<countries.Cities> Cities_Var = [];
  AddressData addData_Var = AddressData();

  void getAddress({bool refresh = false}) async {
    try {
      isCountriesCities.value = true;

      if (addData_Var == null) {
        addData_Var.title = theAddress.tr;
        addData_Var.cityId = 2;
        addData_Var.countryId = 4;
        addData_Var.zipCode = PostalCode.tr;
        addData_Var.description = AddressDetails.tr;
        addData_Var.homeNumber = houseNumber.tr;
      }

      Uri URI = Uri.parse(addressGet);
      http.Response response = await http.get(
        URI,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['data']['item'] != null) {
          var itemData = jsonData['data']['item'];
          addData_Var = AddressData.fromJson(itemData);
        }

        var countriesData = jsonData['data']['countries'];
        Countries_Var = List<countries.Countries>.from(countriesData
            .map((country) => countries.Countries.fromJson(country)));

        var citiesData = jsonData['data']['countries']['cities'];
        Cities_Var = List<countries.Cities>.from(
            citiesData.map((city) => countries.Cities.fromJson(city)));
      } else {
        throw Exception('Invalid JSON data');
      }
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isCountriesCities.value = false;
    }
  }

  changeImage(context) async {
    try {
      XFile? img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  getProfileData({bool refresh = false}) async {
    try {
      isDataLoading(true);
      if (refresh && currentPage == 1) {
        user_Var!.fullName = '';
        user_Var!.image = '';
      }

      Uri uri = Uri.parse(account);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var arrayUser = responseData['data']['user'];
        var arraySocial = responseData['data']['social_media'];
        user_Var = User.fromJson(arrayUser);
        arraySocial.forEach((element) {
          socialMediaList_var.add(SocialMediaData.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  getInterested() async {
    try {
      isInter(true);
      InterItem_var.clear();

      Uri uri = Uri.parse(interestsGet);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        array.forEach((element) {
          InterItem_var.add(InterItem.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isInter(false);
    }
  }

  getSections({bool refresh = false}) async {
    try {
      isDataSections(true);
      if (refresh && currentPage == 1) {
        sectionsItems_var.clear();
      }
      Uri uri = Uri.parse(sections);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        var totalPages = jsonData['pages']['total'];
        array.forEach((element) {
          sectionsItems_var.add(sectionsItems.fromJson(element));
        });

        if (currentPage < totalPages && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataSections(false);
    }
  }

  Future<void> getSectionDetails({id, bool refresh = false}) async {
    try {
      isSection_details(true);
      if (refresh && currentPage == 1) {
        sections_details.clear();
        SectionDet_Var.value = '0';
      }
      Uri uri = Uri.parse("${baseUrl}sections/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        SectionDet_Var.value = jsonData['data']['title'];
        var totalPages = jsonData['pages']['total'];
        array.forEach((element) {
          sections_details.add(sectionsItems.fromJson(element));
        });
        print(sections_details);

        if (currentPage < totalPages && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isSection_details(false);
    }
  }

  Future<void> getSubSections({id, bool refresh = false}) async {
    try {
      sub_sections_var.clear();
      SubSections_var.value = '0';
      isSubSections_details(true);
      if (refresh && currentPage == 1) {
        sub_sections_var.clear();
        SubSections_var.value = '0';
      }
      Uri uri = Uri.parse("${baseUrl}sub_sections/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        SubSections_var.value = jsonData['data']['title'];
        var totalPages = jsonData['pages']['total'];
        array.forEach((element) {
          sub_sections_var.add(DealsVar.fromJson(element));
        });

        if (currentPage < totalPages && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isSubSections_details(false);
    }
  }

  Future<void> getPurchasedPackages({id, bool refresh = false}) async {
    try {
      purchased_packages_var.clear();
      isPurchasedPackages(true);
      if (refresh && currentPage == 1) {
        purchased_packages_var.clear();
      }
      Uri uri = Uri.parse(purchasedPackages);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        var totalPages = jsonData['pages']['total'];
        array.forEach((element) {
          purchased_packages_var.add(PurchasedPackages.fromJson(element));
        });
        print('<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');
        print(purchased_packages_var.length);
        print('<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');

        if (currentPage < totalPages && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isPurchasedPackages(false);
    }
  }
  //isPurchasedPackages

  getAboutAppTaps(id) async {
    try {
      isAboutAppTaps(true);
      AboutAppTaps_var.clear();

      Uri uri = Uri.parse("${baseUrl}pages/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        array.forEach((element) {
          AboutAppTaps_var.add(AboutApp.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isAboutAppTaps(false);
    }
  }

  void resetPagination() {
    currentPage = 1;
  }

  getAboutApp(id) async {
    try {
      isAboutApp(true);
      AboutApp_var.clear();

      Uri uri = Uri.parse("${baseUrl}pages/$id");
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var array = jsonData['data']['items'];
        array.forEach((element) {
          AboutApp_var.add(AboutApp.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isAboutApp(false);
    }
  }

  getAccountData({bool refresh = false}) async {
    try {
      isDataAcLoading(true);
      if (refresh && currentPage == 1) {
        Acc_Var!.fullName = '';
        Acc_Var!.email = '';
        Acc_Var!.countryName = '';
        Acc_Var!.cityName = '';
        Acc_Var!.mobile = '';
      }

      Uri uri = Uri.parse(profile);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var arrayUser = responseData['data'];

        Acc_Var = AccountInfo.fromJson(arrayUser);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      print('=========== isDataAcLoading ===========');
      isDataAcLoading(false);
    }
  }

  getAccountDataEd() async {
    try {
      isDataAcEdLoading(true);

      Uri uri = Uri.parse(edit);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var arrayUser = responseData['data']['user'];

        AccEd_Var = AccountInfo.fromJson(arrayUser);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataAcEdLoading(false);
    }
  }
}
