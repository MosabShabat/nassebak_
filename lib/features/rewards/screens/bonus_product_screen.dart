import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/rewards/screens/replaced_screen.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../controller/awards_controller.dart';

class BonusProductScreen extends StatefulWidget {
  final int id;

  BonusProductScreen({super.key, required this.id});

  @override
  State<BonusProductScreen> createState() => _BonusProductScreenState();
}

class _BonusProductScreenState extends State<BonusProductScreen> {
  final controller = PageController(initialPage: 1);

  var controllerAward = Get.put(AwardsController());

  @override
  void initState() {
    super.initState();
    // if (controllerAward.isInitAward.value) {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controllerAward.getAward(
        widget.id,
      );
    });
    //controllerAward.isInitAward.value = false;
    // }
  }

  final List items = [
    ScrollGroup,
    ScrollGroup,
    ScrollGroup,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: Obx(
        () => controllerAward.isAwardLoad.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: whiteColor,
                      context: context,
                      builder: (BuildContext context) {
                        print('=================');
                        print('${controllerAward.AwardDet_Var.image}');
                        print('=================');
                        return Container(
                          height: context.screenHeight / 2.3,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BonusReplacement.tr.text.black
                                        .fontFamily(medium)
                                        .size(14)
                                        .make(),
                                  ],
                                ),
                                TheRewardWill.tr.text.black
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                                40.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ' ${controllerAward.AwardDet_Var.points ?? ''} '
                                        .text
                                        .color(yalowColor)
                                        .fontFamily(bold)
                                        .size(24)
                                        .make(),
                                    Point.tr.text
                                        .color(yalowColor)
                                        .fontFamily(medium)
                                        .size(12)
                                        .make(),
                                  ],
                                ),
                                40.heightBox,
                                DoYouWantToReplace.tr.text.black
                                    .fontFamily(medium)
                                    .size(16)
                                    .make(),
                                40.heightBox,
                                CustomButton(
                                  text: YesRedeemTheBonus.tr,
                                  onPressed: () {
                                    Get.to(
                                      () => replacedScreen(),
                                      transition: Transition.fadeIn,
                                    );
                                  },
                                  textColor: whiteColor,
                                  backgroundColor: mainColor,
                                  borderColor: mainColor,
                                ),
                                40.heightBox,
                                CustomButton(
                                  text: no.tr,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  textColor: blackColor,
                                  backgroundColor: lightColor,
                                  borderColor: lightColor,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: mainColor, width: 2),
                    ),
                    primary: mainColor,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Replacing.tr.text.white.size(18).make(),
                      Row(
                        children: [
                          ' ${controllerAward.AwardDet_Var.points ?? ''} '
                              .text
                              .white
                              .size(18)
                              .make(),
                          Point.tr.text.white.size(18).make(),
                        ],
                      )
                    ],
                  ),
                )),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.screenHeight / 2),
        child: Obx(
          () => controllerAward.isAwardLoad.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : AppBar(
                  flexibleSpace: Center(
                      child: Column(
                    children: [
                      // Container()
                      // '${controllerAward.AwardDet_Var.title ?? ''}'
                      //     .text
                      //     .maxLines(2)
                      //     .black
                      //     .fontFamily(bold)
                      //     .size(16)
                      //     .make(),
                      Image.network(
                        '${controllerAward.AwardDet_Var.image ?? ''}'.trim(),
                        height: context.screenHeight / 2,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return const Icon(Icons.error);
                        },
                      ),
                    ],
                  )),
                ),
        ),
      ),
      body: Obx(
        () => controllerAward.isAwardLoad.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      '${controllerAward.AwardDet_Var.title ?? ''}'
                          .tr
                          .text
                          .maxLines(2)
                          .black
                          .fontFamily(bold)
                          .size(16)
                          .make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(vuesaxOutlineCoin),
                              Opposite.tr.text.black
                                  .fontFamily(medium)
                                  .size(14)
                                  .make(),
                              ' ${controllerAward.AwardDet_Var.points ?? ''} '
                                  .tr
                                  .text
                                  .fontFamily(medium)
                                  .color(yalowColor)
                                  .size(14)
                                  .make(),
                              Point.tr.text
                                  .fontFamily(medium)
                                  .color(yalowColor)
                                  .size(14)
                                  .make(),
                            ],
                          ),
                          Row(
                            children: [
                              Available.tr.text.black
                                  .fontFamily(medium)
                                  .size(12)
                                  .make(),
                              ' ${controllerAward.AwardDet_Var.quantity ?? ''} '
                                  .tr
                                  .text
                                  .fontFamily(medium)
                                  .color(blackColor)
                                  .size(12)
                                  .make(),
                            ],
                          )
                              .box
                              .rounded
                              .color(lightColor)
                              .padding(EdgeInsets.all(10))
                              .make()
                        ],
                      ),
                      10.heightBox,
                      SingleChildScrollView(
                              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ' ${controllerAward.AwardDet_Var.description ?? ''} '
                              .tr
                              .text
                              .maxLines(50)
                              .fontFamily(medium)
                              .size(12)
                              .make(),
                        ],
                      ))
                          .box
                          .height(context.screenHeight / 5)
                          .width(context.screenWidth)
                          .make(),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              5.widthBox,
                              ExpiryDate.tr.text
                                  .size(12)
                                  .fontFamily(medium)
                                  .black
                                  .make(),
                            ],
                          ),
                          ' ${controllerAward.AwardDet_Var.expiryDate ?? ''} '
                              .text
                              .size(14)
                              .fontFamily(bold)
                              .black
                              .make(),
                        ],
                      )
                      // Available
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
