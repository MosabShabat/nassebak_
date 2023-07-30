import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../../models/Response.dart' as Response;
import '../../../auth/controller/auth_getx_controller.dart';
import 'edite_verification_code_screen.dart';

class ChangeTheMobileNumberScreen extends StatefulWidget {
  const ChangeTheMobileNumberScreen({super.key});

  @override
  State<ChangeTheMobileNumberScreen> createState() =>
      _ChangeTheMobileNumberScreenState();
}

class _ChangeTheMobileNumberScreenState
    extends State<ChangeTheMobileNumberScreen> {
  late TextEditingController _phoneTextController;

  @override
  void initState() {
    super.initState();

    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneTextController.dispose();

    super.dispose();
  }

  FocusNode focusNode = FocusNode();

  String? phoneNum;
  var CountryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeTheMobile.tr.text.fontFamily(bold).size(24).make(),
            40.heightBox,
            EnterTheNew.tr.text.fontFamily(medium).size(14).make(),
            40.heightBox,
            MobileNumber.tr.text.black.fontFamily(medium).size(14).make(),
            40.heightBox,
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
            40.heightBox,
            CustomButton(
              text: Tracking.tr,
              onPressed: () async => await _performEditPhone(),
              textColor: whiteColor,
              backgroundColor: mainColor,
              borderColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performEditPhone() async {
    if (_checkData()) {
      await _EditPhone();
    }
  }

  bool _checkData() {
    if (_phoneTextController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar('Error', 'Enter required data!');
    return false;
  }

  Future<void> _EditPhone() async {
    print('here ');
    Response.Response response = await Get.find<AuthGetxController>().EditPhone(
      mobile: '$CountryId${_phoneTextController.text}',
    );
    if (response.status!) {
      Get.off(
        () => EditVerificationCodeScreen(),
        transition: Transition.rightToLeft,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
