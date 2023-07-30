import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/positioned_stack.dart';
import '../../../../consts/conste.dart';
import 'done_editing_screen.dart';

class myDealsDetailsScreen extends StatefulWidget {
  const myDealsDetailsScreen({super.key});

  @override
  State<myDealsDetailsScreen> createState() => _myDealsDetailsScreenState();
}

class _myDealsDetailsScreenState extends State<myDealsDetailsScreen> {
  final controller = PageController(initialPage: 1);
  final List items = [
    ScrollGroup14,
    ScrollGroup14,
    ScrollGroup14,
  ];

  DateTime _targetTime = DateTime.now().add(Duration(days: 15));
  Timer? _timer;

  String _getRemainingTime() {
    final now = DateTime.now();
    final remainingTime = _targetTime.difference(now);

    final days = remainingTime.inDays;
    final hours = remainingTime.inHours.remainder(24);
    final minutes = remainingTime.inMinutes.remainder(60);
    final seconds = remainingTime.inSeconds.remainder(60);

    return '$seconds'.padLeft(2, '0') +
        ' : ' +
        '$minutes'.padLeft(2, '0') +
        ' : ' +
        '$hours'.padLeft(2, '0') +
        ' : ' +
        '$days'.padLeft(2, '0');
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: AdjustThePrice.tr,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: whiteColor,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: context.screenHeight / 2.5,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AdjustThePrice.tr.text.black.medium.size(16).make(),
                          20.heightBox,
                          Text(
                            '${WhenAdjusting.tr} 3 ${ticketFrom.tr} ',
                            maxLines: 3,
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
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              currentPrice.tr.text.black.medium.size(16).make(),
                              Row(
                                children: [
                                  ' 30 '
                                      .text
                                      .color(yalowColor)
                                      .bold
                                      .size(18)
                                      .make(),
                                  Rial.tr.text
                                      .color(yalowColor)
                                      .bold
                                      .size(18)
                                      .make(),
                                ],
                              )
                            ],
                          ),
                          20.heightBox,
                          TheNewPrice.tr.text.black.medium.size(16).make(),
                          20.heightBox,
                          MyTextField(
                            readOnly: false,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            hintText: thePrice.tr,
                          ),
                          20.heightBox,
                          CustomButton(
                            text: SaveTheModification.tr,
                            onPressed: () {
                              Get.to(
                                () => doneEditingScreen(),
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: true,
                leading: SizedBox(),
                expandedHeight: context.screenHeight / 1.5,
                flexibleSpace: FlexibleSpaceBar(
                  background: PageView.builder(
                    controller: controller,
                    itemCount: items.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Center(
                          child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                items[index],
                                height: context.screenHeight / 1.5,
                                fit: BoxFit.fill,
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
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                        ),
                                      ))),
                              PositionedStack(
                                widthSize: 40.0,
                                heightSize: 60.0,
                                firstBox: Column(
                                  children: [
                                    '${_getRemainingTime().split(':')[0]}'
                                        .text
                                        .black
                                        .bold
                                        .size(20)
                                        .make(),
                                    second.tr.text.black.bold.size(20).make(),
                                  ],
                                ),
                                secondBox: Column(
                                  children: [
                                    '${_getRemainingTime().split(':')[1]}'
                                        .text
                                        .black
                                        .bold
                                        .size(20)
                                        .make(),
                                    minute.tr.text.black.bold.size(20).make(),
                                  ],
                                ),
                                thirdBox: Column(
                                  children: [
                                    '${_getRemainingTime().split(':')[2]}'
                                        .text
                                        .black
                                        .bold
                                        .size(20)
                                        .make(),
                                    hour.tr.text.black.bold.size(20).make(),
                                  ],
                                ),
                                fourthBox: Column(
                                  children: [
                                    '${_getRemainingTime().split(':')[3]}'
                                        .text
                                        .black
                                        .bold
                                        .size(20)
                                        .make(),
                                    day.tr.text.black.bold.size(20).make(),
                                  ],
                                ),
                              )
                                  .box
                                  .margin(EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20))
                                  .alignment(Alignment.bottomCenter)
                                  .make(),
                            ],
                          )
                        ],
                      ));
                    },
                  ),
                )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                                count: items.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: blackColor,
                                  dotHeight: 7,
                                  dotColor: lightColor,
                                  dotWidth: 20,
                                )),
                          ],
                        ),
                        10.heightBox,
                        'حقيبة قماش للسفر حقيبة تسوق الكتف'
                            .tr
                            .text
                            .maxLines(2)
                            .black
                            .bold
                            .size(24)
                            .make(),
                        10.heightBox,
                        Row(
                          children: [
                            SvgPicture.asset(vuesaxOutlineCoin),
                            youWillGet.tr.text.black.medium.size(16).make(),
                            ' 700 '
                                .tr
                                .text
                                .medium
                                .color(yalowColor)
                                .size(16)
                                .make(),
                            Point.tr.text.medium
                                .color(yalowColor)
                                .size(16)
                                .make(),
                          ],
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    '30 '.tr.text.black.medium.size(16).make(),
                                    Rial.tr.text.black.medium.size(16).make(),
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
                                    '5 '.tr.text.black.medium.size(16).make(),
                                    Rial.tr.text.black.medium.size(16).make(),
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
                                    '5 '.tr.text.black.medium.size(16).make(),
                                    tickets.tr.text.black.medium
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
                        Container(
                          height: 200,
                          width: context.screenWidth,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: lightColor,
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                        color: yalowColor,
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      Tab(
                                        text: ProductInformation.tr,
                                      ),
                                      Tab(
                                        text: TransactionInformation.tr,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TabBarView(
                                children: [
                                  Center(
                                    child:
                                        'قماش للسفر حقيبة تسوق قماش للسفر حقيبة تسوق قماش للسفر حقيبة تسوق قماش للسفر حقيبة تسوق قماش للسفر حقيبة تسوق حقيبة قماش للسفر حقيبة تسوق الكتف'
                                            .tr
                                            .text
                                            .maxLines(5)
                                            .black
                                            .bold
                                            .size(18)
                                            .make(),
                                  ),
                                  Center(
                                    child: Ended.tr.text.make(),
                                  ),
                                ],
                              ))
                            ],
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
      ),
    );
  }
}
