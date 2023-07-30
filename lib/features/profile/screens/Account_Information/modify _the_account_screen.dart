import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../../models/countries.dart' as countriesCities;
import '../../../api/api_controller.dart';
import '../../../auth/controller/auth_getx_controller.dart';
import '../../controller/profile_controller.dart';
import '../profile_screen.dart';
import 'change_the_mobile_number_screen.dart';
import 'edite_new password_screen.dart';

class ModifyTheAccountScreen extends StatefulWidget {
  const ModifyTheAccountScreen({Key? key}) : super(key: key);

  @override
  State<ModifyTheAccountScreen> createState() => _ModifyTheAccountScreenState();
}

class _ModifyTheAccountScreenState extends State<ModifyTheAccountScreen> {
  final controller = Get.put(ApiController());
  final userController = Get.put(profileController());
  final userControllerEd = Get.put(profileController());

  late TextEditingController _emailTextController;
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;
  late List<String> countryItems;
  late List<String> cityItems = [];

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    if (userController.isInitAccEd.value) {
      userController.getAccountDataEd();
      controller.getCountries();
      userController.isInitAccEd.value = false;
    }
    if (userControllerEd.isInitAcc.value) {
      userControllerEd.getAccountData();
      userControllerEd.isInitAcc.value = false;
    }
    cityItems = [];
    _emailTextController = TextEditingController();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _phoneTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    super.dispose();
  }

  List<countriesCities.Cities> getCitiesByCountry(
      String country, List<countriesCities.Countries> countries) {
    final selectedCountry =
        countries.firstWhere((element) => element.name == country);
    return selectedCountry.cities!;
  }

  String? selectedCountry;
  String? selectedCity;
  String? selectedCountryId;

  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    Get.put(AuthGetxController());
    ImageProvider? backgroundImage;
    if (_pickedImage != null) {
      backgroundImage = FileImage(File(_pickedImage!.path));
    } else if (userController.AccEd_Var?.image?.isEmpty ?? true) {
      backgroundImage = AssetImage(profilePic);
    } else {
      backgroundImage = AssetImage(profilePic);
    }
    print(controller.Countries_Var);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: SaveModifications.tr,
          onPressed: () async {
            await _performEdProf();
          },
          textColor: whiteColor,
          backgroundColor: mainColor,
          borderColor: mainColor,
        ),
      ),
      body: Obx(
        () {
          if (userController.isDataAcEdLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final countriesData = controller.Countries_Var;
            countryItems =
                countriesData.map((country) => country.name!).toList();
            print('**************');
            //   print('${userController.AccEd_Var?.fullName!}');
            print('**************');
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModifyTheAccount.tr.text.black
                        .fontFamily(bold)
                        .size(24)
                        .make(),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async => await _pickImage(),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: backgroundImage,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: whiteColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            10.heightBox,
                          ],
                        ),
                      ],
                    ),
                    20.heightBox,
                    FirstName.tr.text.black.medium.size(16).make(),
                    20.heightBox,
                    MyTextField(
                      readOnly: false,
                      obscureText: false,
                      controller: _firstNameTextController,
                      keyboardType: TextInputType.name,
                      
                      hintText: '${userControllerEd.Acc_Var!.fullName!}',
                    ),
                    20.heightBox,
                    lastName.tr.text.black.medium.size(16).make(),
                    20.heightBox,
                    MyTextField(
                      readOnly: false,
                      obscureText: false,
                      controller: _lastNameTextController,
                      keyboardType: TextInputType.name,
                      hintText: '${userControllerEd.Acc_Var!.fullName!}',
                    ),
                    20.heightBox,
                    Email.tr.text.black.medium.size(16).make(),
                    20.heightBox,
                    MyTextField(
                      readOnly: false,
                      obscureText: false,
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: '${userController.AccEd_Var?.email ?? ''}',
                    ),
                    20.heightBox,
                    Countries.tr.text.black.medium.size(16).make(),
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
                        hint: Text(
                          '${userController.AccEd_Var?.countryName}',
                          style: TextStyle(color: blackColor),
                        ),
                        items: countryItems.map((country) {
                          print('here');
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
                              // List<String> cityItems = [];
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
                    //    if (selectedCountry != null) ...[
                    Container(
                      width: context.screenWidth,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        hint: Text(
                          '${userController.AccEd_Var?.cityName}',
                          style: TextStyle(
                            fontFamily: medium,
                            fontSize: 16,
                          ),
                        ),
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
                            final selectedCountryData =
                                countriesData.firstWhere(
                              (country) => country.name == selectedCountry,
                            );

                            if (selectedCountryData != null) {
                              final selectedCityData =
                                  selectedCountryData.cities!.firstWhere(
                                (city) => city.name == selectedCity,
                                orElse: () =>
                                    countriesCities.Cities(id: 0, name: ''),
                              );

                              selectedCountryId =
                                  selectedCityData.id.toString();
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
                    //    ],
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MobileNumber.tr.text.black
                            .fontFamily(medium)
                            .size(14)
                            .make(),
                        TextButton(
                          onPressed: () {
                            Get.to(
                              () => ChangeTheMobileNumberScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: DoYouWantToChange.tr.text.black
                              .fontFamily(medium)
                              .size(12)
                              .make(),
                        ),
                      ],
                    ),
                    20.heightBox,
                    MyTextField(
                      readOnly: true,
                      obscureText: false,
                      controller: _phoneTextController,
                      keyboardType: TextInputType.phone,
                      hintText: '${userController.AccEd_Var?.mobile ?? ''}',
                    ),
                    40.heightBox,
                    CustomButton(
                      text: changePassword.tr,
                      onPressed: () {
                        Get.to(
                          () => editNewPasswordScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      textColor: blackColor,
                      backgroundColor: lightColor,
                      borderColor: lightColor,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _performEdProf() async {
    print('============== here we go =============');

    if (_checkData()) {
      await _EdProf();
    }
  }

  bool _checkData() {
    if (_firstNameTextController.text.isNotEmpty &&
        _lastNameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _countryTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar('Error', 'Enter required data!');
    return false;
  }

  Future<void> _EdProf() async {
    print(_pickedImage!.path);

    final response = await Get.find<AuthGetxController>().EditProf(
      first_name: _firstNameTextController.text,
      last_name: _lastNameTextController.text,
      email: _emailTextController.text,
      country_id: _countryTextController.text,
      city_id: _cityTextController.text,
      image: _pickedImage!.path,
    );

    if (response.status!) {
      VxToast.show(context, msg: 'Edit Profile Successfully');
      Get.off(
        () => const ProfileScreen(),
        transition: Transition.leftToRight,
      );
    }

    Get.snackbar(
      "message",
      response.message!,
      backgroundColor: response.status! ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }

  Future<void> _pickImage() async {
    final imageFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (imageFile != null) {
      setState(() {
        _pickedImage = imageFile;
      });
    }
  }
}
