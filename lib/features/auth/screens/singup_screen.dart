import 'package:flutter/gestures.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nassebak_/features/auth/screens/verification_singup_screen.dart';
import '../../../models/Response.dart'as Response;
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../api/api_controller.dart';
import '../controller/auth_getx_controller.dart';
import '../../../../models/countries.dart' as countriesCities;

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _userTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;

  bool _obscureText = true;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();
  late List<String> countryItems;
  late List<String> cityItems;
  @override
  void initState() {
    super.initState();

    controller.getCountries();
    cityItems = [];

    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _userTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _userTextController.dispose();
    _phoneTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    super.dispose();
  }

  var controller = Get.put(ApiController());
  // String _selectedItem = 'English';

  List<countriesCities.Cities> getCitiesByCountry(
      String country, List<countriesCities.Countries> countries) {
    final selectedCountry =
        countries.firstWhere((element) => element.name == country);
    return selectedCountry.cities!;
  }

  String? phoneNum;
  var CountryId;
  String? selectedCountry;
  String? selectedCity;
  String? selectedCountryId;
  @override
  Widget build(BuildContext context) {
    Get.put(AuthGetxController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isCountries.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final countriesData = controller.Countries_Var;
          countryItems = countriesData.map((country) => country.name!).toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreateAnAccount.tr.text.black
                      .fontFamily(bold)
                      .size(24)
                      .make(),
                  10.heightBox,
                  FullName.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    maxLines: 1,
                    obscureText: false,
                    controller: _nameTextController,
                    keyboardType: TextInputType.name,
                    hintText: FullName.tr,
                  ),
                  20.heightBox,
                  Email.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    maxLines: 1,
                    obscureText: false,
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: Email.tr,
                  ),
                  20.heightBox,
                  userName.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    maxLines: 1,
                    readOnly: false,
                    obscureText: false,
                    controller: _userTextController,
                    keyboardType: TextInputType.text,
                    hintText: EnterTheUsername.tr,
                  ),
                  20.heightBox,
                  MobileNumber.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntlPhoneField(
                          controller: _phoneTextController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: MobileNumber.tr,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: whiteColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          languageCode: GetStorage().read('lang') == null
                              ? 'en'
                              : GetStorage().read('lang'),
                          onChanged: (phone) {
                            phoneNum = phone.completeNumber;

                            CountryId = phone.countryCode;
                            CountryId = CountryId.substring(1);
                          },
                          onCountryChanged: (country) {
                            setState(() {});
                          },
                        ),
                        20.heightBox,
                        password.tr.text.black
                            .fontFamily(medium)
                            .size(16)
                            .make(),
                        20.heightBox,
                        MyTextField(
                          maxLines: 1,
                          readOnly: false,
                          obscureText: _obscureText,
                          controller: _passwordTextController,
                          keyboardType: TextInputType.text,
                          hintText: password.tr,
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        20.heightBox,
                        Countries.tr.text.black
                            .fontFamily(medium)
                            .size(16)
                            .make(),
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
                            hint: Countries.tr.text.make(),
                            items: countryItems.map((country) {
                              print('here');
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(
                                  country,
                                  style: TextStyle(
                                    fontFamily: (medium),
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
                                  _countryTextController.text =
                                      selectedCountryId!;
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
                        City.tr.text.black.fontFamily((medium)).size(16).make(),
                        20.heightBox,
                        // if (selectedCountry != null) ...[
                        Container(
                          width: context.screenWidth,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            hint: City.tr.text.black
                                .fontFamily((medium))
                                .size(16)
                                .make(),
                            value: selectedCity,
                            items: cityItems.map((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(
                                  city,
                                  style: TextStyle(
                                    fontFamily: (medium),
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
                        //     ],
                        20.heightBox,
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: _isChecked1,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked1 = value!;
                        });
                      },
                    ),
                    title: IUndertake.tr.text.black
                        .fontFamily(bold)
                        .size(12)
                        .make(),
                  ),
                  ListTile(
                      leading: Checkbox(
                        value: _isChecked2,
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked2 = value!;
                          });
                        },
                      ),
                      title: Container(
                        height: 40,
                        width: context.screenWidth - 10,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: IAgreeTo.tr),
                              TextSpan(
                                text: RegistrationTerms.tr,
                                style: TextStyle(
                                  color: yalowColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(text: And.tr),
                              TextSpan(
                                text: privacyPolicy.tr,
                                style: TextStyle(
                                  color: yalowColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      )),
                  20.heightBox,
                  CustomButton(
                    text: CreateAnAccount.tr,
                    onPressed: () async => await _performRegister(),
                    textColor: whiteColor,
                    backgroundColor: mainColor,
                    borderColor: mainColor,
                  ),
                  20.heightBox,
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _userTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _countryTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty &&
        _isChecked1 == true &&
        _isChecked2 == true) {
      return true;
    }
    Get.snackbar('Error', 'Enter required data!');
    return false;
  }

  Future<void> _register() async {
    String fullName = _nameTextController.text;
    List<String> nameParts = fullName.split(' ');

    String firstName = nameParts.first;
    String lastName = nameParts.last;
    Response.Response response = await Get.find<AuthGetxController>().register(
      first_name: firstName,
      last_name: lastName,
      email: _emailTextController.text,
      user_name: _userTextController.text,
      mobile: '$CountryId${_phoneTextController.text}',
      password: _passwordTextController.text,
      country_id: _countryTextController.text,
      city_id: _cityTextController.text,
    );
    if (response.status!) {
      Get.to(
          () => VerificationSingUp(
                email: _emailTextController.text,
              ),
          transition: Transition.downToUp);
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
