import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/home_page/screens/deals/subscribed_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/positioned_stack.dart';
import '../../../../consts/conste.dart';
import '../../controller/home_page_controller.dart';

class BonusReplacementScreen extends StatefulWidget {
  final int id;
  BonusReplacementScreen({super.key, required this.id});

  @override
  State<BonusReplacementScreen> createState() => _BonusReplacementScreenState();
}

class _BonusReplacementScreenState extends State<BonusReplacementScreen> {
  var controllerHomePage = Get.put(HomePageController());

  final controller = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controllerHomePage.getDealsDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: EnteringTheDeal.tr,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: whiteColor,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: context.screenHeight / 2.7,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EnteringTheDeal.tr.text.black.medium.size(16).make(),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${WhenYouEnter.tr} ${controllerHomePage.Deals_details!.tickets} ${ticketFrom.tr} ${andYou.tr} ${controllerHomePage.Deals_details!.points}  ${rewardPoint.tr}',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )
                                  .box
                                  .height(40)
                                  .width(context.screenWidth - 40)
                                  .make(),
                            ],
                          ),
                          20.heightBox,
                          setYourPrice.tr.text.black.medium.size(16).make(),
                          20.heightBox,
                          MyTextField(
                            readOnly: false,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            hintText: thePrice.tr,
                          ),
                          20.heightBox,
                          CustomButton(
                            text: send.tr,
                            onPressed: () {
                              Get.to(
                                () => SubscribedScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            textColor: whiteColor,
                            backgroundColor: mainColor,
                            borderColor: mainColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            textColor: whiteColor,
            backgroundColor: mainColor,
            borderColor: mainColor,
          ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Obx(
          () {
            if (controllerHomePage.isDeals_details.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controllerHomePage.Deals_details == null) {
              return Center(
                child: Text('No data available'),
              );
            } else {
        
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        leading: SizedBox(),
                        expandedHeight: context.screenHeight / 1.5,
                        flexibleSpace: FlexibleSpaceBar(
                          background: PageView.builder(
                            controller: controller,
                            itemCount: controllerHomePage
                                .Deals_details!.images!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = controllerHomePage.Deals_details!;
                              return Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Image.network(
                                          data.images![index],
                                          height: context.screenHeight / 1.5,
                                          fit: BoxFit.fill,
                                        ),
                                        data.status == 2
                                            ? PositionedStack(
                                                widthSize: 50.0,
                                                heightSize: 50.0,
                                                firstBox: Column(
                                                  children: [
                                                    '0'
                                                        .text
                                                        .medium
                                                        .medium
                                                        .size(12)
                                                        .make(),
                                                    secondTime
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
                                                    minuteTime
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
                                                    hourTime
                                                        .tr.text.black.medium
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
                                                    dayTime.tr.text.black.medium
                                                        .size(12)
                                                        .make(),
                                                  ],
                                                ),
                                              )
                                                .box
                                                .margin(
                                                    const EdgeInsets.symmetric(
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
                                                    widthSize: 50.0,
                                                    heightSize: 50.0,
                                                    firstBox: Column(
                                                      children: [
                                                        '${time.sec}'
                                                            .text
                                                            .black
                                                            .bold
                                                            .size(12)
                                                            .make(),
                                                        secondTime.tr.text.black
                                                            .fontFamily(regular)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                    secondBox: Column(
                                                      children: [
                                                        '${time.min}'
                                                            .text
                                                            .black
                                                            .bold
                                                            .size(12)
                                                            .make(),
                                                        minuteTime.tr.text.black
                                                            .fontFamily(regular)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                    thirdBox: Column(
                                                      children: [
                                                        '${time.hours}'
                                                            .text
                                                            .black
                                                            .bold
                                                            .size(12)
                                                            .make(),
                                                        hourTime.tr.text.black
                                                            .fontFamily(regular)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                    fourthBox: Column(
                                                      children: [
                                                        '${time.days}'
                                                            .text
                                                            .black
                                                            .bold
                                                            .size(12)
                                                            .make(),
                                                        dayTime.tr.text.black
                                                            .fontFamily(regular)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                                .box
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 5,
                                                ))
                                                .alignment(
                                                    Alignment.bottomCenter)
                                                .make(),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            var data = controllerHomePage.Deals_details!;
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SmoothPageIndicator(
                                          controller: controller,
                                          count: controllerHomePage
                                              .Deals_details!.images!.length,
                                          effect: ExpandingDotsEffect(
                                            activeDotColor: blackColor,
                                            dotHeight: 7,
                                            dotColor: lightColor,
                                            dotWidth: 20,
                                          )),
                                    ],
                                  ),
                                  10.heightBox,
                                  '${data.title}'
                                      .tr
                                      .text
                                      .maxLines(2)
                                      .black
                                      .bold
                                      .size(18)
                                      .make(),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      SvgPicture.asset(vuesaxOutlineCoin),
                                      youWillGet.tr.text.black.medium
                                          .size(14)
                                          .make(),
                                      ' ${data.points} ${Point.tr}'
                                          .tr
                                          .text
                                          .medium
                                          .color(yalowColor)
                                          .size(14)
                                          .make(),
                                    ],
                                  ),
                                  20.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              '${data.originalPrice} ${Rial.tr}'
                                                  .tr
                                                  .text
                                                  .black
                                                  .medium
                                                  .size(14)
                                                  .make(),
                                            ],
                                          ),
                                          20.heightBox,
                                          TheOriginalPrice.tr.text.medium
                                              .color(Colors.grey)
                                              .size(16)
                                              .make(),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        width: 5,
                                        thickness: 10,
                                        indent: 20,
                                        endIndent: 0,
                                        color: Colors.pink,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              '${data.initialPrice} ${Rial.tr}'
                                                  .tr
                                                  .text
                                                  .black
                                                  .medium
                                                  .size(16)
                                                  .make(),
                                            ],
                                          ),
                                          20.heightBox,
                                          StartingPrice.tr.text.medium
                                              .color(Colors.grey)
                                              .size(16)
                                              .make(),
                                        ],
                                      ),
                                      VerticalDivider(
                                        color: Colors.pink,
                                        thickness: 10,
                                        width: 5,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              '${data.tickets} ${tickets.tr}'
                                                  .tr
                                                  .text
                                                  .black
                                                  .medium
                                                  .size(16)
                                                  .make(),
                                            ],
                                          ),
                                          20.heightBox,
                                          numberOfTickets.tr.text.medium
                                              .color(Colors.grey)
                                              .size(16)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  20.heightBox,
                                  SingleChildScrollView(
                                    child: Container(
                                      height: 280,
                                      width: context.screenWidth,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    color: lightColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0)),
                                                child: TabBar(
                                                  indicator: BoxDecoration(
                                                      color: yalowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0)),
                                                  labelColor: Colors.white,
                                                  unselectedLabelColor:
                                                      Colors.black,
                                                  tabs: [
                                                    Tab(
                                                      text:
                                                          ProductInformation.tr,
                                                    ),
                                                    Tab(
                                                      text:
                                                          TransactionInformation
                                                              .tr,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            TabBarView(
                                              children: [
                                                SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      '${data.description} '
                                                          .text
                                                          .maxLines(20)
                                                          .black
                                                          .bold
                                                          .size(12)
                                                          .make(),
                                                      50.heightBox,
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    '${data.info} '
                                                        .text
                                                        .maxLines(20)
                                                        .black
                                                        .bold
                                                        .size(12)
                                                        .make(),
                                                    50.heightBox,
                                                  ],
                                                )),
                                              ],
                                            ).box.height(250).make()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
