import 'package:lottie/lottie.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import '../my_deals/my_deals_details_screen.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(Winner1),
            40.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CongratulationsOnWinning.tr.text.bold.black.size(18).make(),
                20.heightBox,
                'حقيبة قماش للسفر حقيبة تسوق الكتف'
                    .text
                    .bold
                    .black
                    .size(18)
                    .make(),
                10.heightBox,
                hoursAgo.tr.text.color(Colors.grey).medium.size(14).make(),
                30.heightBox,
                WeHopeToComplete.tr.text.medium
                    .maxLines(2)
                    .black
                    .size(14)
                    .make(),
                40.heightBox,
                CustomButton(
                  text: ViewTheDeal.tr,
                  textColor: whiteColor,
                  backgroundColor: mainColor,
                  borderColor: mainColor,
                  onPressed: () {
                    Get.to(
                      () => myDealsDetailsScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
