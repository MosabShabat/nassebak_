import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/conste.dart';
import '../controller/partner_offers_controller.dart';

class PartnerOfferDetailsScreen extends StatefulWidget {
  final int id;
  PartnerOfferDetailsScreen({super.key, required this.id});

  @override
  State<PartnerOfferDetailsScreen> createState() =>
      _PartnerOfferDetailsScreenState();
}

class _PartnerOfferDetailsScreenState extends State<PartnerOfferDetailsScreen> {
  var partnerController = Get.put(partnerOffersController());
  final controller = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await partnerController.getPartnersDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: MoreAboutThe.tr,
          onPressed: () async {
            String url = '${partnerController.Partners_details_var!.link}';

            await launch(url);
          },
          textColor: whiteColor,
          backgroundColor: mainColor,
          borderColor: mainColor,
        ),
      ),
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.screenHeight / 4),
        child: Obx(
          () => partnerController.isPartners_details.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : AppBar(
                  flexibleSpace: PageView.builder(
                    controller: controller,
                    itemCount: partnerController
                            .Partners_details_var?.images?.length ??
                        0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = partnerController.Partners_details_var!;
                      return Center(
                          child: Column(
                        children: [
                          Image.network(
                            data.images![index],
                            height: 250,
                            fit: BoxFit.fill,
                          )
                        ],
                      ));
                    },
                  ),
                ),
        ),
      ),
      body: Obx(
        () => partnerController.isPartners_details.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if (partnerController.Partners_details_var == null) {
                      return const SizedBox();
                    }
                    var PartnersData = partnerController.Partners_details_var!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                                controller: controller,
                                count: PartnersData.images?.length ?? 0,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: blackColor,
                                  dotHeight: 7,
                                  dotColor: lightColor,
                                  dotWidth: 20,
                                )),
                          ],
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${partnerController.Partners_details_var?.logo ?? 0}'),
                                    fit: BoxFit.fill,
                                  )),
                            ).box.margin(EdgeInsets.all(12)).make(),
                            20.widthBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '${partnerController.Partners_details_var!.name!}'
                                    .text
                                    .black
                                    .fontFamily(bold)
                                    .size(18)
                                    .make(),
                                10.heightBox,
                                '${partnerController.Partners_details_var!.description!}'
                                    .text
                                    .color(Colors.grey)
                                    .fontFamily(medium)
                                    .size(14)
                                    .make(),
                              ],
                            )
                          ],
                        ),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:
                              '${partnerController.Partners_details_var!.title!}'
                                  .text
                                  .black
                                  .fontFamily(bold)
                                  .size(14)
                                  .make(),
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            '${partnerController.Partners_details_var!.value!}'
                                .text
                                .fontFamily(medium)
                                .size(14)
                                .black
                                .make(),
                          ],
                        )
                            .box
                            .height(70)
                            .width(context.screenWidth)
                            .color(lightColor)
                            .make(),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${partnerController.Partners_details_var!.details!}',
                                  maxLines: 200,
                                  style: TextStyle(
                                      fontFamily: medium,
                                      fontSize: 12,
                                      color: blackColor),
                                ),
                                40.heightBox,
                              ],
                            ),
                          ).box.height(context.screenHeight / 4).make(),
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ExpiryDate.tr.text
                                .size(14)
                                .fontFamily(bold)
                                .black
                                .make(),
                            '${partnerController.Partners_details_var!.expiryDate!}'
                                .text
                                .size(14)
                                .fontFamily(bold)
                                .black
                                .make(),
                          ],
                        )
                            .box
                            .height(70)
                            .width(context.screenWidth)
                            .padding(EdgeInsets.symmetric(horizontal: 20))
                            .color(lightColor)
                            .make(),
                      ],
                    );
                  },
                ).box.height(context.screenHeight / 1.3).make(),
              ),
      ),
    );
  }
}
