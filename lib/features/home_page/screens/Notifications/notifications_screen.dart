import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/home_page/screens/Notifications/top_offers_screen.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';
import 'congratulations_screen.dart';
import 'gift_screen.dart';
import 'minutes_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool showCancel = false;
  bool selectAll = false;
  List<String> notifications = [
    CongratulationsOnWinning,
    CongratulationsYouAreAmong,
    minutesLeft,
    BestOfLuck,
  ];
  List<String> images = [
    trophy,
    x336hourglass,
    Ellipse489,
    circle,
  ];
  List<bool> selectedItems = [];

  var screens = [
    CongratulationsScreen(),
    topOffersScreen(),
    minutesScreen(),
    giftScreen(),
  ];

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(notifications.length, false);
  }

  void clearNotifications() {
    setState(() {
      if (!showCancel) {
        showCancel = true;
      } else {
        showCancel = false;
        selectedItems = List<bool>.filled(notifications.length, false);
      }
    });
  }

  void toggleSelectAll(bool value) {
    setState(() {
      selectAll = value;
      selectedItems = List<bool>.filled(notifications.length, value);
    });
  }

  Future<void> _refreshData() async {
    // Simulate an asynchronous data fetch
    await Future.delayed(Duration(seconds: 2));

    // setState(() {

      // RefreshIndicator(
      //   onRefresh: _refreshData,
    //   // Update the data
    //   // items = List.generate(20, (index) => 'Item ${index + 1} (Refreshed)');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: showCancel,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: ClearNotifications.tr,
            textColor: whiteColor,
            backgroundColor: blackColor,
            borderColor: blackColor,
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(),
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Notifications.tr.text.bold.black.size(30).make(),
                    TextButton(
                      onPressed: clearNotifications,
                      child: showCancel
                          ? cancellation.tr.text.bold
                              .color(Colors.grey)
                              .size(18)
                              .make()
                          : ClearNotifications.tr.text.bold
                              .color(Colors.grey)
                              .size(18)
                              .make(),
                    ),
                  ],
                ),
                20.heightBox,
                Visibility(
                  visible: showCancel,
                  child: TextButton(
                    onPressed: () => toggleSelectAll(!selectAll),
                    child: selectAll
                        ? '$DeselectAll'
                            .tr
                            .tr
                            .text
                            .color(yalowColor)
                            .bold
                            .make()
                        : '$selectAllCo'.tr.text.color(yalowColor).bold.make(),
                  ),
                ),
                SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight,
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Visibility(
                                visible: showCancel,
                                child: Checkbox(
                                  activeColor: Colors.green,
                                  value: selectedItems[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedItems[index] = value!;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: whiteColor,
                                    child: Center(
                                      child: SvgPicture.asset(images[index]),
                                    ),
                                  ),
                                  10.widthBox,
                                  Text(
                                    notifications[index].tr,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  )
                                      .box
                                      .height(50)
                                      .alignCenter
                                      .width(200)
                                      .make(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      hoursAgo.tr.text
                                          .color(Colors.grey)
                                          .medium
                                          .size(12)
                                          .make(),
                                    ],
                                  )
                                ],
                              )
                                  .box
                                  .height(80)
                                  .width(context.screenWidth - 40)
                                  .color(lightColor)
                                  .padding(EdgeInsets.all(10))
                                  .margin(EdgeInsets.symmetric(vertical: 20))
                                  .make(),
                            ],
                          ),
                        ).onTap(() {
                          Get.to(
                            () => screens[index],
                            transition: Transition.rightToLeft,
                          );
                        });
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
