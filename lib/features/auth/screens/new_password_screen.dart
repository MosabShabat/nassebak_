import 'package:lottie/lottie.dart';
import 'package:nassebak_/features/auth/screens/login_screen.dart';
import '../../../models/Response.dart'as Response;
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../controller/auth_getx_controller.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const NewPasswordScreen({super.key, required this.email, required this.code});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _passwordConfirmationTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
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
                    NewPassword.tr.text.black.bold.size(24).make(),
                    10.heightBox,
                    EnterAStrongPassword.tr.text.black.medium.size(16).make(),
                    10.heightBox,
                    password.tr.text.black.medium.size(16).make(),
                    10.heightBox,
                    MyTextField(
                      maxLines: 1,              readOnly: false,

                      controller: _passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      hintText: password.tr,
                      suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    20.heightBox,
                    confirmPassword.tr.text.black.medium.size(16).make(),
                    10.heightBox,
                    MyTextField(              readOnly: false,

                      maxLines: 1,
                      controller: _passwordConfirmationTextController,
                      keyboardType: TextInputType.text,
                      hintText: confirmPassword.tr,
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    40.heightBox,
                    CustomButton(
                      text: Recovery.tr,
                      onPressed:
                          () async => await _performResetPassword(),
                      textColor: whiteColor,
                      backgroundColor: mainColor,
                      borderColor: mainColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
    Response.Response response = await Get.find<AuthGetxController>().resetPass(
        email: widget.email,
        code: widget.code,
        password: _passwordTextController.text,
        c_password: _passwordConfirmationTextController.text);
    if (response.status!) {
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.downToUp,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
