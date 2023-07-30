import 'dart:async';

import 'package:flutter_svg/svg.dart';
import '../../../../common/widgets/positioned_stack.dart';
import '../../../../consts/conste.dart';
import 'my_deals_details_screen.dart';

class MyDealsScreen extends StatefulWidget {
  const MyDealsScreen({super.key});

  @override
  State<MyDealsScreen> createState() => _MyDealsScreenState();
}

class _MyDealsScreenState extends State<MyDealsScreen> {
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

  Future<void> _refreshData() async {
    // Simulate an asynchronous data fetch
    await Future.delayed(Duration(seconds: 2));

    // setState(() {
    //   // Update the data
    //   // items = List.generate(20, (index) => 'Item ${index + 1} (Refreshed)');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 400,
              mainAxisSpacing: 0,
              crossAxisSpacing: 1,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              height: 280,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(onboarding1),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: PositionedStack(
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
                                      vertical: 10, horizontal: 5))
                                  .alignment(Alignment.bottomCenter)
                                  .make(),
                            ),
                            10.heightBox,
                            "وصف المنتج"
                                .split(' ')
                                .take(3)
                                .join(' ')
                                .text
                                .fontFamily(Black)
                                .size(14)
                                .make(),
                            5.heightBox,
                            Row(
                              children: [
                                StartsFrom.tr.text
                                    .color(blackColor)
                                    .fontFamily(bold)
                                    .size(14)
                                    .make(),
                                " سعر المنتج"
                                    .text
                                    .color(blackColor)
                                    .fontFamily(bold)
                                    .size(14)
                                    .make(),
                              ],
                            ),
                            5.heightBox,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  vuesaxOutlineTicket,
                                ),
                                5.widthBox,
                                'تذكرة 1'.text.medium.size(16).make(),
                              ],
                            )
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17))),
                              child: Center(
                                child: IconButton(
                                    onPressed: () async {
                                      // bool b =
                                      //     await FirestorServices().deleteFavourate(
                                      //         // AuthController()
                                      //         //     .auth
                                      //         //     .currentUser!
                                      //         //     .uid,
                                      //         p);
                                      // if (b) {
                                      //   controller.delete(p);
                                      // }
                                      // VxToast.show(context,
                                      //     msg: "Removed from wishlist");
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: mainColor,
                                      size: 15,
                                    )),
                              ),
                            ))
                      ],
                    ).onTap(() {
                      Get.to(
                        () => myDealsDetailsScreen(),
                        transition: Transition.leftToRight,
                      );
                    })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
