import 'package:flutter_svg/svg.dart';
import '../../../consts/conste.dart';
import '../../home/controller/home_controller.dart';
import '../../home/screens/home_screen.dart';
import '../controller/awards_controller.dart';
import 'bonus_product_screen.dart';

class RewardsScreens extends StatefulWidget {
  const RewardsScreens({super.key});

  @override
  State<RewardsScreens> createState() => _RewardsScreensState();
}

class _RewardsScreensState extends State<RewardsScreens> {
  var controller = Get.put(HomeController());
  var controllerAwards = Get.put(AwardsController());

  @override
  void initState() {
    super.initState();
    if (controllerAwards.isInit.value) {
      controllerAwards.getAwards();
      controllerAwards.getPoints();
      controllerAwards.isInit.value = false;
    }
  }

  Future<void> _refreshData() async {
    controllerAwards.resetPagination();
    controllerAwards.getAwards(refresh: true);
    controllerAwards.getPoints(refresh: true);
  }

  Future<void> _loadMoreData() async {
    controllerAwards.loadMorePackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: RefreshIndicator(
            onRefresh: _refreshData,
            child: Obx(
              () => controllerAwards.isDataLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Rewards.tr.text.black
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            RedeemOurRewards.tr.text
                                .color(Colors.grey)
                                .fontFamily(medium)
                                .size(12)
                                .make(),
                            20.heightBox,
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyCredit.tr.text.white
                                          .fontFamily(bold)
                                          .size(14)
                                          .make(),
                                      10.heightBox,
                                      Row(
                                        children: [
                                          SvgPicture.asset(Currency),
                                          20.widthBox,
                                          '${controllerAwards.MainAwards_Var}'
                                              .text
                                              .white
                                              .fontFamily(bold)
                                              .size(20)
                                              .make(),
                                          20.widthBox,
                                          Point.tr.text.white
                                              .fontFamily(bold)
                                              .size(12)
                                              .make(),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 91,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Shipping.tr.text.black
                                          .fontFamily(bold)
                                          .size(12)
                                          .make(),
                                    ),
                                  ).onTap(() {
                                    controller.currentNavIndex.value = 1;
                                    Get.to(
                                      () => HomeScreen(),
                                      transition: Transition.rightToLeft,
                                    );
                                  })
                                ],
                              ),
                            )
                                .box
                                .height(100)
                                .rounded
                                .padding(EdgeInsets.all(12))
                                .width(double.infinity)
                                .color(mainColor)
                                .make(),
                            20.heightBox,
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 350,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 1,
                              ),
                              itemCount: controllerAwards.Awards_Var.length,
                              itemBuilder: (context, index) {
                                print(controllerAwards.Awards_Var.length);
                                var AwardsData =
                                    controllerAwards.Awards_Var[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 170,
                                                height: 250,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          '${AwardsData.image}'),

                                                      //  AssetImage(
                                                      //   onboarding1,
                                                      // )
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                              20.heightBox,
                                              '${AwardsData.title}'
                                                  .split(' ')
                                                  .take(3)
                                                  .join(' ')
                                                  .text
                                                  .fontFamily(medium)
                                                  .size(14)
                                                  .make(),
                                              10.heightBox,
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      vuesaxOutlineCoin),
                                                  Opposite.tr.text.black
                                                      .fontFamily(medium)
                                                      .size(14)
                                                      .make(),
                                                  ' ${AwardsData.points} '
                                                      .tr
                                                      .text
                                                      .fontFamily(bold)
                                                      .color(yalowColor)
                                                      .size(16)
                                                      .make(),
                                                  Point.tr.text
                                                      .fontFamily(medium)
                                                      .color(yalowColor)
                                                      .size(12)
                                                      .make(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ).onTap(() {
                                  Get.to(
                                      () => BonusProductScreen(
                                            id: AwardsData.id!,
                                          ),
                                      transition: Transition.fadeIn);
                                });
                              },
                            )
                          ],
                        ),
                      )),
                    ),
            )));
  }
}
