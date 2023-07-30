import 'package:lottie/lottie.dart';
import '../../../../consts/conste.dart';
import '../../../../models/Response.dart' as Response;
import '../../../../common/widgets/code_text_field.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../auth/controller/auth_getx_controller.dart';
import 'modify _the_account_screen.dart';

class EditVerificationCodeScreen extends StatefulWidget {
  const EditVerificationCodeScreen({super.key});

  @override
  State<EditVerificationCodeScreen> createState() =>
      _EditVerificationCodeScreenState();
}

class _EditVerificationCodeScreenState
    extends State<EditVerificationCodeScreen> {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  String _code = '';
  @override
  void initState() {
    super.initState();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(OTP),
              20.heightBox,
              verificationCode.tr.text.black.fontFamily(bold).size(24).make(),
              10.heightBox,
              EnterTheVerificationCode.tr.text.black
                  .fontFamily(medium)
                  .size(14)
                  .make(),
              10.heightBox,
              'Naseebak@gmail.com'.text.black.medium.size(14).make(),
              30.heightBox,
              Row(
                children: [
                  CodeTextField(
                    controller: _firstCodeTextController,
                    focusNode: _firstFocusNode,
                    onChanged: (String value) {
                      if (value.isNotEmpty) {
                        _secondFocusNode.requestFocus();
                      }
                    },
                    onSubmitted: (String value) {},
                  ),
                  const SizedBox(width: 10),
                  CodeTextField(
                    controller: _secondCodeTextController,
                    focusNode: _secondFocusNode,
                    onChanged: (String value) {
                      value.isNotEmpty
                          ? _thirdFocusNode.requestFocus()
                          : _firstFocusNode.requestFocus();
                    },
                    onSubmitted: (String value) {},
                  ),
                  const SizedBox(width: 10),
                  CodeTextField(
                    controller: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChanged: (String value) {
                      value.isNotEmpty
                          ? _fourthFocusNode.requestFocus()
                          : _secondFocusNode.requestFocus();
                    },
                    onSubmitted: (String value) {},
                  ),
                  const SizedBox(width: 10),
                  CodeTextField(
                    controller: _fourthCodeTextController,
                    focusNode: _fourthFocusNode,
                    onChanged: (String value) {
                      if (value.isEmpty) {
                        _thirdFocusNode.requestFocus();
                      }
                    },
                    onSubmitted: (String value) {},
                  ),
                ],
              ),
              30.heightBox,
              CustomButton(
                text: verification.tr,
                onPressed: () async => _performResetVerification(),
                textColor: whiteColor,
                backgroundColor: mainColor,
                borderColor: mainColor,
              ),
              10.heightBox,
              Row(
                children: [
                  IDidNotReceiveTheCode.tr.text.black.medium.size(16).make(),
                  TextButton(
                    onPressed: () {},
                    child: Resend.tr.text.black.medium
                        .color(yalowColor)
                        .size(16)
                        .make(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performResetVerification() async {
    if (_checkData()) {
      await _resetVerification();
    }
  }

  bool _checkData() {
    return _checkCode();
  }

  bool _checkCode() {
    _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    if (_code.length == 4) {
      return true;
    }
    Get.snackbar('Message', 'Code is not correct');
    return false;
  }

  Future<void> _resetVerification() async {
    Response.Response response = await Get.find<AuthGetxController>().VeriPhone(
      code: _code,
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

    //VeriPhone
  }
}
