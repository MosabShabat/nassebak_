import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../common/widgets/positioned_stack.dart';
import '../../../consts/conste.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../../home_page/screens/deals/bonus_replacement_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var controller = Get.find<HomePageController>();
  @override
  void initState() {
    super.initState();
    // _refreshData();
    // if (controller.isInitFav.value) {
    controller.getFavData();

    //   controller.isInitFav.value = false;
    // };
  }

  Future<void> _refreshData() async {
    controller.resetPagination();
    await controller.getFavData(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(),
        body: Obx(
          () => controller.isFavLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Favorite.tr.text.size(24).black.bold.make(),
                          ),
                          20.heightBox,
                          controller.Fav_Var.isEmpty
                              ? Center(
                                  child: Column(
                                  children: [
                                    Lottie.asset(
                                      NoData,
                                      // width: context.screenWidth / 1.5,
                                      // height: context.screenHeight / 3,
                                    ),
                                    10.heightBox,
                                    PleaseAddYourFavoritesProducts.tr.text
                                        .size(18)
                                        .black
                                        .fontFamily(Black)
                                        .make(),
                                  ],
                                ))
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 400,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 1,
                                  ),
                                  itemCount: controller.Fav_Var.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.Fav_Var[index];
                                    print(
                                      controller.Fav_Var.length,
                                    );
                                    print(data.isFavorite!);

                                    //    if (data.isFavorite!) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
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
                                                    width: 250,
                                                    height: 280,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            'https://dev-app.naseebk.com/img/86ed1cfed503fab1df7c22a29e35d1b4.JPG'),

                                                        //  NetworkImage(
                                                        //   "${data.image}",
                                                        // ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: data.status == 2
                                                        ? PositionedStack(
                                                            widthSize: 40.0,
                                                            heightSize: 40.0,
                                                            firstBox: Column(
                                                              children: [
                                                                '0'
                                                                    .text
                                                                    .medium
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                                second
                                                                    .tr
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                              ],
                                                            ),
                                                            secondBox: Column(
                                                              children: [
                                                                '0'
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                                minute
                                                                    .tr
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                              ],
                                                            ),
                                                            thirdBox: Column(
                                                              children: [
                                                                '0'
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                                hour
                                                                    .tr
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                              ],
                                                            ),
                                                            fourthBox: Column(
                                                              children: [
                                                                '0'
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                                day
                                                                    .tr
                                                                    .text
                                                                    .black
                                                                    .medium
                                                                    .size(12)
                                                                    .make(),
                                                              ],
                                                            ),
                                                          )
                                                            .box
                                                            .margin(
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10,
                                                              horizontal: 5,
                                                            ))
                                                            .alignment(Alignment
                                                                .bottomCenter)
                                                            .make()
                                                        : CountdownTimer(
                                                            endTime: DateTime
                                                                        .now()
                                                                    .millisecondsSinceEpoch +
                                                                (data.remainingTime! *
                                                                    1000),
                                                            widgetBuilder: (_,
                                                                CurrentRemainingTime?
                                                                    time) {
                                                              if (time ==
                                                                  null) {
                                                                return Container();
                                                              }
                                                              return PositionedStack(
                                                                widthSize: 40.0,
                                                                heightSize:
                                                                    40.0,
                                                                firstBox:
                                                                    Column(
                                                                  children: [
                                                                    '${time.sec}'
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                    second
                                                                        .tr
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                  ],
                                                                ),
                                                                secondBox:
                                                                    Column(
                                                                  children: [
                                                                    '${time.min}'
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                    minute
                                                                        .tr
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                  ],
                                                                ),
                                                                thirdBox:
                                                                    Column(
                                                                  children: [
                                                                    '${time.hours}'
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                    hour
                                                                        .tr
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                  ],
                                                                ),
                                                                fourthBox:
                                                                    Column(
                                                                  children: [
                                                                    '${time.days}'
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                    day
                                                                        .tr
                                                                        .text
                                                                        .black
                                                                        .medium
                                                                        .size(
                                                                            12)
                                                                        .make(),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          )
                                                            .box
                                                            .margin(
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10,
                                                              horizontal: 5,
                                                            ))
                                                            .alignment(Alignment
                                                                .bottomCenter)
                                                            .make(),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  '${data.title}'
                                                      .text
                                                      .medium
                                                      .size(14)
                                                      .make(),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      StartsFrom.tr.text
                                                          .color(blackColor)
                                                          .medium
                                                          .size(14)
                                                          .make(),
                                                      const SizedBox(width: 5),
                                                      '${data.initialPrice} ${data.currency} '
                                                          .text
                                                          .color(blackColor)
                                                          .medium
                                                          .size(14)
                                                          .make(),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          vuesaxOutlineTicket),
                                                      const SizedBox(width: 5),
                                                      '${data.tickets} ${Ticket.tr}'
                                                          .tr
                                                          .text
                                                          .medium
                                                          .size(16)
                                                          .make(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                top: 5,
                                                left: 5,
                                                child: Container(
                                                  height: 34,
                                                  width: 34,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(17),
                                                    ),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        controller
                                                            .isFav(data.id!);
                                                        data.isFavorite =
                                                            !data.isFavorite!;
                                                        _refreshData();
                                                      });
                                                    },
                                                    //mosab
                                                    icon: Icon(
                                                      data.isFavorite!
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: data.isFavorite!
                                                          ? Colors.red
                                                          : mainColor,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).onTap(
                                            () {
                                              print(data.id);
                                              Get.to(
                                                () => BonusReplacementScreen(
                                                  id: data.id!,
                                                ),
                                                transition:
                                                    Transition.leftToRight,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  // else {
                                  //   return ''.text.make();
                                  // }
                                  //  return;
                                  //      },
                                  ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
