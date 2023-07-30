import 'package:lottie/lottie.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../home/screens/home_screen.dart';

class doneEditingScreen extends StatelessWidget {
  const doneEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            ThePriceHasBeen.tr.text.black.bold.size(24).make(),
            10.heightBox,
            YouCanAdjustThe.tr.text.color(Colors.grey).medium.size(14).make(),
            20.heightBox,
            CustomButton(
              text: MyDeals.tr,
              onPressed: () {
                Get.offAll(() => HomeScreen(page: 2),
                    transition: Transition.leftToRight);
              },
              textColor: whiteColor,
              backgroundColor: mainColor,
              borderColor: mainColor,
            ),
            20.heightBox,
            Main.tr.text.color(yalowColor).bold.size(20).make().onTap(() {
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
