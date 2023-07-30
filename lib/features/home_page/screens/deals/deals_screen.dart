import 'dart:async';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/widgets/positioned_stack.dart';
import '../../../../consts/conste.dart';
import '../../controller/home_page_controller.dart';
import 'bonus_replacement_screen.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({Key? key}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  final controller = Get.find<HomePageController>();

  @override
  void initState() {
    // _refreshData();
    controller.deals_Var.clear();
    // if (controller.isInit.value) {
    controller.getHomeDeals();
    controller.isInit.value = false;
    // }

    super.initState();
  }

  Future<void> _refreshData() async {
    controller.resetPagination();
    await controller.getHomeDeals(refresh: true);
    // await controller.deals_Var.clear();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.isDataLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
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
                        itemCount: controller.deals_Var.length,
                        itemBuilder: (context, index) {
                          print(controller.deals_Var.length);

                          var data = controller.deals_Var[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                          .tr.text.black.medium
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
                                                          .tr.text.black.medium
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
                                                      hour.tr.text.black.medium
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
                                                      day.tr.text.black.medium
                                                          .size(12)
                                                          .make(),
                                                    ],
                                                  ),
                                                )
                                                  .box
                                                  .margin(const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                    horizontal: 5,
                                                  ))
                                                  .alignment(
                                                      Alignment.bottomCenter)
                                                  .make()
                                              : CountdownTimer(
                                                  endTime: DateTime.now()
                                                          .millisecondsSinceEpoch +
                                                      (data.remainingTime! *
                                                          1000),
                                                  widgetBuilder: (_,
                                                      CurrentRemainingTime?
                                                          time) {
                                                    if (time == null) {
                                                      return Container();
                                                    }
                                                    return PositionedStack(
                                                      widthSize: 40.0,
                                                      heightSize: 40.0,
                                                      firstBox: Column(
                                                        children: [
                                                          '${time.sec}'
                                                              .text
                                                              .black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                          second.tr.text.black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                        ],
                                                      ),
                                                      secondBox: Column(
                                                        children: [
                                                          '${time.min}'
                                                              .text
                                                              .black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                          minute.tr.text.black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                        ],
                                                      ),
                                                      thirdBox: Column(
                                                        children: [
                                                          '${time.hours}'
                                                              .text
                                                              .black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                          hour.tr.text.black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                        ],
                                                      ),
                                                      fourthBox: Column(
                                                        children: [
                                                          '${time.days}'
                                                              .text
                                                              .black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                          day.tr.text.black
                                                              .medium
                                                              .size(12)
                                                              .make(),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )
                                                  .box
                                                  .margin(const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                    horizontal: 5,
                                                  ))
                                                  .alignment(
                                                      Alignment.bottomCenter)
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
                                            '${data.tickets} ${'$Ticket'.tr}'
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
                                        decoration: const BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(17),
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              controller.isFav(data.id!);
                                              data.isFavorite!
                                                  ? VxToast.show(context,
                                                      msg:
                                                          'Removed Successfully')
                                                  : VxToast.show(context,
                                                      msg:
                                                          'Added Successfully');

                                              data.isFavorite =
                                                  !data.isFavorite!;
                                            });
                                          },
                                          icon: Icon(
                                            data.isFavorite!
                                                ? Icons.favorite
                                                : Icons.favorite_border,
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
                                    Get.to(
                                      () => BonusReplacementScreen(
                                        id: data.id!,
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
