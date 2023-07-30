import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../auth/screens/login_screen.dart';

class DeleteMyAccountScreen extends StatelessWidget {
  const DeleteMyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(40.0),
        child: CustomButton(
          text: DeleteMyAccount.tr,
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: whiteColor,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: context.screenHeight / 2.5,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DeleteMyAccount.tr.text.black.medium.size(16).make(),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AreYouSureTo.tr.text.black.bold.size(18).make(),
                          ],
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ThisStepCannot.tr.text.black.medium.size(14).make(),
                          ],
                        ),
                        20.heightBox,
                        CustomButton(
                          text: YesDelete.tr,
                          onPressed: () {
                            Get.offAll(
                              () => LoginScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          textColor: whiteColor,
                          backgroundColor: Colors.red,
                          borderColor: Colors.red,
                        ),
                        20.heightBox,
                        CustomButton(
                          text: cancel.tr,
                          onPressed: () {
                            Get.back();
                          },
                          textColor: blackColor,
                          backgroundColor: lightColor,
                          borderColor: lightColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          textColor: whiteColor,
          backgroundColor: Colors.red,
          borderColor: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeleteMyAccount.tr.text.bold.black.size(30).make(),
            10.heightBox,
            WhatWillYouLose.tr.text.bold.black.size(20).make(),
            10.heightBox,
            MyAccount.tr.text.medium.color(Colors.grey).size(16).make(),
            10.heightBox,
            purchaseHistory.tr.text.medium.color(Colors.grey).size(16).make(),
            10.heightBox,
            TheRightToAccess.tr.text.medium.color(Colors.grey).size(16).make(),
            10.heightBox,
            ThisTextIsAnExample.tr.text.medium
                .color(Colors.grey)
                .size(16)
                .make(),
            10.heightBox,
            Container()
          ],
        ),
      ),
    );
  }
}
