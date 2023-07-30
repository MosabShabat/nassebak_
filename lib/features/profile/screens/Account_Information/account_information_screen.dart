import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../controller/profile_controller.dart';
import 'modify _the_account_screen.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;
  late TextEditingController _phoneTextController;

  final userController = Get.put(profileController());

  @override
  void initState() {
    super.initState();
    // _refreshData();

    if (userController.isInitAcc.value) {
      userController.getAccountData();
      userController.isInitAcc.value = false;
    }
    _emailTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  Future<void> _refreshData() async {
    userController.resetPagination();
    userController.getAccountData(refresh: true);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    _phoneTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: ModifyTheAccount.tr,
            onPressed: () {
              Get.to(
                () => ModifyTheAccountScreen(),
                transition: Transition.rightToLeft,
              );
            },
            textColor: whiteColor,
            backgroundColor: mainColor,
            borderColor: mainColor,
          ),
        ),
        appBar: AppBar(),
        body: Obx(
          () => userController.isDataAcLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountInformation.tr.text.black
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
                                userController.Acc_Var!.image! == ''
                                    //||
                                    //       UserData.image!.isEmpty
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                          profilePic,
                                        ))
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                          profilePic,
                                        )),
                                // CircleAvatar(
                                //     radius: 40,
                                //     backgroundImage: NetworkImage(
                                //       '${userController.Acc_Var!.image!}',
                                //     ),
                                //   ),
                                10.heightBox,
                                '${userController.Acc_Var!.fullName!}'
                                    .text
                                    .black
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                              ],
                            ),
                          ],
                        ),
                        20.heightBox,
                        Email.tr.text.black.fontFamily(medium).size(14).make(),
                        20.heightBox,
                        MyTextField(
                          readOnly: true,
                          obscureText: false,
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: '${userController.Acc_Var!.email!}',
                        ),
                        20.heightBox,
                        Countries.tr.text.black
                            .fontFamily(medium)
                            .size(14)
                            .make(),
                        20.heightBox,
                        MyTextField(
                          readOnly: true,
                          obscureText: false,
                          controller: _countryTextController,
                          keyboardType: TextInputType.text,
                          hintText: '${userController.Acc_Var!.countryName!}',
                        ),
                        20.heightBox,
                        City.tr.text.black.fontFamily(medium).size(14).make(),
                        20.heightBox,
                        MyTextField(
                          readOnly: true,
                          obscureText: false,
                          controller: _cityTextController,
                          keyboardType: TextInputType.text,
                          hintText: '${userController.Acc_Var!.cityName!}',
                        ),
                        20.heightBox,
                        MobileNumber.tr.text.black
                            .fontFamily(medium)
                            .size(14)
                            .make(),
                        20.heightBox,
                        MyTextField(
                          readOnly: true,
                          obscureText: false,
                          controller: _phoneTextController,
                          keyboardType: TextInputType.phone,
                          hintText: '${userController.Acc_Var!.mobile!}',
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
