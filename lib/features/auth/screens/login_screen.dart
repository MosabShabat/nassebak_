
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../home/controller/home_controller.dart';
import '../../home/screens/home_screen.dart';
import '../controller/auth_getx_controller.dart';
import 'forgot_pass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  var controller = Get.put(HomeController());

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthGetxController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignIn.tr.text.black.fontFamily(bold).size(24).make(),
                10.heightBox,
                PleaseLoginToContinue.tr.text.black
                    .fontFamily(medium)
                    .size(16)
                    .make(),
                20.heightBox,
                emailOrPhone.tr.text.black.fontFamily(medium).size(16).make(),
                10.heightBox,
                MyTextField(
                  readOnly: false,
                  controller: _emailTextController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: EnterYourEmailOrPhone.tr,
                ),
                20.heightBox,
                password.tr.text.black.fontFamily(medium).size(16).make(),
                10.heightBox,
                MyTextField(
                  readOnly: false,
                  controller: _passwordTextController,
                  obscureText: _obscureText,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  hintText: password.tr,
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => const ForgotPasswordScreen(),
                      transition: Transition.fade,
                    );
                  },
                  child: forgetYourPassword.tr.text.black
                      .fontFamily(medium)
                      .size(16)
                      .make(),
                ),
                20.heightBox,
                CustomButton(
                  text: SignIn.tr,
                  onPressed: () async => await _performLogin(),
                  textColor: whiteColor,
                  backgroundColor: mainColor,
                  borderColor: mainColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _login() async {
    print('_login');
    controller.currentNavIndex.value = 0;

    bool isSucess = await Get.find<AuthGetxController>().login(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    isSucess
        ? Get.offAll(
            () => HomeScreen(),
            transition: Transition.downToUp,
          )
        : Get.snackbar("error", " Something is error");
  }
}
