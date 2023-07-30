import '../../../models/Response.dart'as Response;
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../controller/auth_getx_controller.dart';
import 'Verification _screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            forgetYourPassword.tr.text.black.bold.size(24).make(),
            10.heightBox,
            EnterOurRegisteredEmail.tr.text.black.medium.size(16).make(),
            20.heightBox,
            Email.tr.text.black.medium.size(16).make(),
            10.heightBox,
            MyTextField(
              readOnly: false,
              controller: _emailTextController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              hintText: EnterYourEmailOrPhone.tr,
            ),
            20.heightBox,
            CustomButton(
              text: Recovery.tr,
              onPressed: () async => await _performForgotPassword(),
              textColor: whiteColor,
              backgroundColor: mainColor,
              borderColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performForgotPassword() async {
    if (_checkData()) {
      await _forgotPassword();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _forgotPassword() async {
    Response.Response response = await Get.find<AuthGetxController>()
        .ForgetPass(email: _emailTextController.text);
    if (response.status!) {
      // GetStorage().write("code", response.code);
      Get.to(
        () => VerificationScreen(
          email: _emailTextController.text,
        ),
        transition: Transition.rightToLeft,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor:
            response.status! ? Colors.greenAccent : Colors.redAccent,
        colorText: Colors.white);
  }
}
