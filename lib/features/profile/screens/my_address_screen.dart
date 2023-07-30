import '../../../../models/countries.dart' as countriesCities;
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../../models/address_data.dart';
import '../../api/api_controller.dart';
import '../../auth/controller/auth_getx_controller.dart';
import '../controller/profile_controller.dart';
import '../../../../models/Response.dart' as Response;

class myAddressScreen extends StatefulWidget {
  const myAddressScreen({super.key});

  @override
  State<myAddressScreen> createState() => _myAddressScreenState();
}

class _myAddressScreenState extends State<myAddressScreen> {
  // final controller = Get.put(ApiController());
  final AddController = Get.put(profileController());
  // final userController = Get.put(profileController());

  late TextEditingController _addressTextController;
  late TextEditingController _homeNumberTextController;
  late TextEditingController _addressDetailsTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;
  late TextEditingController _PostalCodeTextController;

  @override
  void initState() {
    super.initState();
    // controller.getCountries();
    cityItems = [];
    AddController.getAddress();

    // userController.getAccountDataEd();

    _addressTextController = TextEditingController();
    _homeNumberTextController = TextEditingController();
    _addressDetailsTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _PostalCodeTextController = TextEditingController();
  }

  List<String> cityItemsVar = [];

  @override
  void dispose() {
    _addressTextController.dispose();
    _homeNumberTextController.dispose();
    _addressDetailsTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    _PostalCodeTextController.dispose();

    super.dispose();
  }

  List<countriesCities.Cities> getCitiesByCountry(
      String country, List<countriesCities.Countries> countries) {
    final selectedCountry =
        countries.firstWhere((element) => element.name == country);
    return selectedCountry.cities!;
  }

  List<AddressData> addData = [];
  late List<String> countryItems;
  late List<String> cityItems;
  String? selectedCountry;
  String? selectedCity;
  String? selectedCountryId;

  @override
  Widget build(BuildContext context) {
    Get.put(AuthGetxController());
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: Save.tr,
          onPressed: () async => await _performResetAddress(),
          textColor: whiteColor,
          backgroundColor: mainColor,
          borderColor: mainColor,
        ),
      ),
      appBar: AppBar(),
      body: Obx(() {
        if (AddController.isCountriesCities.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final countriesData = AddController.Countries_Var;
          var countryData = AddController.Countries_Var;
          var cityData = AddController.Cities_Var;

          var addData = AddController.addData_Var;

          countryItems = countriesData.map((country) => country.name!).toList();
          final selectedCountryName = countryData
              .firstWhereOrNull((country) => country.id == addData.countryId)
              ?.name;
          final selectedCityName = cityData
              .firstWhereOrNull((city) => city.id == addData.cityId)
              ?.name;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyAddress.tr.text.black.fontFamily(bold).size(30).make(),
                  10.heightBox,
                  HomeAddress.tr.text
                      .color(Colors.grey)
                      .fontFamily(bold)
                      .size(20)
                      .make(),
                  40.heightBox,
                  theAddress.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: false,
                    controller: _addressTextController,
                    keyboardType: TextInputType.text,
                    hintText:
                        addData.title == null ? theAddress.tr : addData.title,
                  ),
                  40.heightBox,
                  houseNumber.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: false,
                    controller: _homeNumberTextController,
                    keyboardType: TextInputType.text,
                    hintText: addData.homeNumber == null
                        ? houseNumber.tr
                        : addData.homeNumber,

                    //  houseNumber.tr,
                  ),
                  40.heightBox,
                  AddressDetails.tr.text.black
                      .fontFamily(medium)
                      .size(16)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: false,
                    controller: _addressDetailsTextController,
                    keyboardType: TextInputType.text,
                    hintText: addData.description == null
                        ? AddressDetails.tr
                        : addData.description,

                    // AddressDetails.tr,
                  ),
                  40.heightBox,
                  Countries.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  Container(
                    width: context.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      value: selectedCountry,
                      hint: selectedCountryName == null
                          ? Countries.tr.text.black
                              .fontFamily(medium)
                              .size(16)
                              .make()
                          : '${selectedCountryName}'
                              .text
                              .black
                              .fontFamily(medium)
                              .size(16)
                              .make(),
                      items: countryItems.map((country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(
                            country,
                            style: TextStyle(
                              fontFamily: medium,
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          selectedCity = null;
                          final selectedCountryData =
                              countriesData.firstWhereOrNull(
                            (country) => country.name == selectedCountry,
                          );
                          if (selectedCountryData != null) {
                            selectedCountryId =
                                selectedCountryData.id.toString();
                            _countryTextController.text = selectedCountryId!;
                            cityItems = selectedCountryData.cities!
                                .map((city) => city.name!)
                                .toList();
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      isExpanded: true,
                    ),
                  ),
                  20.heightBox,

                  City.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  //  if (selectedCountry != null) ...[
                  Container(
                    width: context.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      hint: selectedCityName == null
                          ? City.tr.text.black
                              .fontFamily(medium)
                              .size(16)
                              .make()
                          : '${selectedCityName}'
                              .text
                              .black
                              .fontFamily(medium)
                              .size(16)
                              .make(),
                      value: selectedCity,
                      items: cityItems.map((city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(
                            city,
                            style: TextStyle(
                              fontFamily: medium,
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                          final selectedCountryData = countriesData.firstWhere(
                            (country) => country.name == selectedCountry,
                          );

                          if (selectedCountryData != null) {
                            final selectedCityData =
                                selectedCountryData.cities!.firstWhere(
                              (city) => city.name == selectedCity,
                              orElse: () =>
                                  countriesCities.Cities(id: 0, name: ''),
                            );

                            selectedCountryId = selectedCityData.id.toString();
                            _cityTextController.text = selectedCountryId!;
                          } else {
                            selectedCountryId = null;
                            _cityTextController.text = '';
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      isExpanded: true,
                      underline: SizedBox(),
                    ),
                  ),
                  //  ],
                  40.heightBox,
                  PostalCode.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: false,
                    controller: _PostalCodeTextController,
                    keyboardType: TextInputType.text,
                    hintText: addData.zipCode == null
                        ? PostalCode.tr
                        : addData.zipCode,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _performResetAddress() async {
    if (_checkData()) {
      await _resetAddress();
    }
  }

  bool _checkData() {
    return _checkAddress();
  }

  bool _checkAddress() {
    if (_addressTextController.text.isNotEmpty &&
        _homeNumberTextController.text.isNotEmpty &&
        _addressDetailsTextController.text.isNotEmpty &&
        _countryTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty &&
        _PostalCodeTextController.text.isNotEmpty) {
      {
        return true;
      }
    }
    Get.snackbar('Message', 'Enter all Filed Correctly');
    return false;
  }

  Future<void> _resetAddress() async {
    Response.Response response =
        await Get.find<AuthGetxController>().EdAddressFunc(
      title: _addressTextController.text,
      home_number: _homeNumberTextController.text,
      description: _addressDetailsTextController.text,
      country_id: _countryTextController.text,
      city_id: _cityTextController.text,
      zip_code: _PostalCodeTextController.text,
    );
    if (response.status!) {
      print(addData);
      Get.back();
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
