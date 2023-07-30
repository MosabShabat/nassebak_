import 'package:flutter_svg/svg.dart';

import '../../../consts/conste.dart';
import '../../home_page/screens/ended/shipping_tracking_screen.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransactionHistory.tr.text.bold.size(30).black.make(),
              SizedBox(
                height: context.screenHeight,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                  ScrollGroup14,
                                ),
                                fit: BoxFit.fill,
                              )),
                        ),
                        20.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'حقيبة قماش للسفر حقيبة تسوق الكتف',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                                fontSize: 16,
                              ),
                            ).box.height(40).width(200).make(),
                            // 'حقيبة قماش للسفر حقيبة تسوق الكتف'
                            //     .text
                            //     .bold
                            //     .maxLines(2)
                            //     .black
                            //     .size(16)
                            //     .make(),
                            20.heightBox,
                            Row(
                              children: [
                                SvgPicture.asset(vuesaxOutlineTicket),
                                10.widthBox,
                                ' 10 '
                                    .text
                                    .bold
                                    .color(yalowColor)
                                    .size(16)
                                    .make(),
                                Ticket.tr.text.bold
                                    .color(yalowColor)
                                    .size(16)
                                    .size(16)
                                    .make(),
                              ],
                            ),
                            40.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Date.tr.text.bold.black.medium
                                        .size(16)
                                        .make(),
                                    5.widthBox,
                                    ' 25/05/2023 '
                                        .text
                                        .black
                                        .medium
                                        .size(18)
                                        .make(),
                                  ],
                                ),
                                30.widthBox,
                                '#5332'.text.black.medium.size(16).make(),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                        .box
                        .height(160)
                        .width(context.screenWidth - 20)
                        .margin(EdgeInsets.symmetric(
                          vertical: 20,
                        ))
                        .make()
                        .onTap(() {
                      Get.to(
                        () => ShippingTrackingScreen(),
                        transition: Transition.rightToLeft,
                      );
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
