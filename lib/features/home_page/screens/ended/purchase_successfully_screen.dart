import 'package:lottie/lottie.dart';
import 'package:nassebak_/features/home_page/screens/ended/shipping_tracking_screen.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../../../home/screens/home_screen.dart';

class PurchaseSuccessfullyScreen extends StatelessWidget {
  const PurchaseSuccessfullyScreen({super.key});

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
            PurchaseCompleted.tr.text.black.bold.size(24).make(),
            10.heightBox,
            YouCanView.tr.text.color(Colors.grey).medium.size(14).make(),
            20.heightBox,
            CustomButton(
              text: ShippingTracking.tr,
              onPressed: () {
                Get.to(
                  () => ShippingTrackingScreen(),
                  transition: Transition.rightToLeft,
                );
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
