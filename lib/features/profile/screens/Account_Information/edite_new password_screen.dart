import 'package:lottie/lottie.dart';
import '../../../../models/Response.dart' as Response;
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../auth/controller/auth_getx_controller.dart';
import 'modify _the_account_screen.dart';

class editNewPasswordScreen extends StatefulWidget {
  const editNewPasswordScreen({super.key});

  @override
  State<editNewPasswordScreen> createState() => _editNewPasswordScreenState();
}

class _editNewPasswordScreenState extends State<editNewPasswordScreen> {
  late TextEditingController _rightPasswordTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _passwordConfirmationTextController = TextEditingController();
    _rightPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _passwordConfirmationTextController.dispose();
    _rightPasswordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(Password),
              20.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewPassword.tr.text.black.fontFamily(bold).size(24).make(),
                  20.heightBox,
                  EnterAStrongPassword.tr.text.black
                      .fontFamily(medium)
                      .size(16)
                      .make(),
                  20.heightBox,
                  CurrentPassword.tr.text.black
                      .fontFamily(medium)
                      .size(16)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: _obscureText,
                    maxLines: 1,
                    controller: _rightPasswordTextController,
                    keyboardType: TextInputType.text,
                    hintText: CurrentPassword.tr,
                    suffixIcon: IconButton(
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  20.heightBox,
                  password.tr.text.black.fontFamily(medium).size(16).make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: _obscureText,
                    maxLines: 1,
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
                  confirmPassword.tr.text.black
                      .fontFamily(medium)
                      .size(16)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    readOnly: false,
                    obscureText: _obscureText,
                    maxLines: 1,
                    controller: _passwordConfirmationTextController,
                    keyboardType: TextInputType.text,
                    hintText: confirmPassword.tr,
                    suffixIcon: IconButton(
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  40.heightBox,
                  CustomButton(
                    text: Save.tr,
                    onPressed: () async => await _performResetPassword(),
                    textColor: whiteColor,
                    backgroundColor: mainColor,
                    borderColor: mainColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performResetPassword() async {
    if (_checkData()) {
      await _resetPassword();
    }
  }

  bool _checkData() {
    return _checkPassword();
  }

  bool _checkPassword() {
    if (_passwordTextController.text.isNotEmpty &&
        _rightPasswordTextController.text.isNotEmpty &&
        _passwordConfirmationTextController.text.isNotEmpty) {
      if (_passwordTextController.text ==
          _passwordConfirmationTextController.text) {
        return true;
      }
      Get.snackbar('Message', 'Password confirmation error');

      return false;
    }
    Get.snackbar('Message', 'Enter password & confirmation');
    return false;
  }

  Future<void> _resetPassword() async {
    Response.Response response =
        await Get.find<AuthGetxController>().EdPassword(
      current_password: _rightPasswordTextController.text,
      new_password: _passwordConfirmationTextController.text,
    );
    if (response.status!) {
      Get.off(
        () => const ModifyTheAccountScreen(),
        transition: Transition.rightToLeft,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
