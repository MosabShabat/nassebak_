import 'package:lottie/lottie.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../home/controller/home_controller.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screens/history_packages_screen.dart';

class successfullyScreen extends StatelessWidget {
  const successfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              done,
            ),
            10.heightBox,
            ThePackageHas.tr.text.black.bold.size(24).make(),
            10.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hasBeenAdded.tr.text.color(Colors.grey).medium.size(14).make(),
                ' 10 '.text.color(Colors.grey).medium.size(14).make(),
                ticketsAnd.tr.text.color(Colors.grey).medium.size(14).make(),
                ' 50 '.text.color(Colors.grey).medium.size(14).make(),
                pointToYourAccount.tr.text
                    .color(Colors.grey)
                    .medium
                    .size(16)
                    .make(),
              ],
            ),
            20.heightBox,
            CustomButton(
              text: Main.tr,
              onPressed: () {
                controller.currentNavIndex.value = 0;
                print(controller.currentNavIndex.value);
                Get.offAll(
                  () => HomeScreen(),
                  transition: Transition.leftToRight,
                );
              },
              textColor: whiteColor,
              backgroundColor: mainColor,
              borderColor: mainColor,
            ),
            20.heightBox,
            TextButton(
                onPressed: () {
                  Get.to(
                    () => historyPackagesScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: RegisterPackages.tr.text
                    .color(yalowColor)
                    .bold
                    .size(20)
                    .make()),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
