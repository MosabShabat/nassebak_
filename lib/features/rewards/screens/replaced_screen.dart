import 'package:lottie/lottie.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../home/controller/home_controller.dart';
import '../../home/screens/home_screen.dart';

class replacedScreen extends StatelessWidget {
  const replacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
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
            RewardRedemption.tr.text.black.bold.size(24).make(),
            10.heightBox,
            YouWillBe.tr.text.color(Colors.grey).medium.size(14).make(),
            20.heightBox,
            CustomButton(
              text: Tracking.tr,
              onPressed: () {
                controller.currentNavIndex.value = 2;
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
            Main.tr.text.color(yalowColor).bold.size(20).make().onTap(() {
              controller.currentNavIndex.value = 0;
              Get.offAll(() => HomeScreen(),
                  transition: Transition.leftToRight);
            }),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
