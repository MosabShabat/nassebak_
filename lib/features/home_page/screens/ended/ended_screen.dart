import 'package:flutter_svg/svg.dart';
import '../../../../consts/conste.dart';
import 'deal_winners_screen.dart';

class EndedScreen extends StatefulWidget {
  const EndedScreen({super.key});

  @override
  State<EndedScreen> createState() => _EndedScreenState();
}

class _EndedScreenState extends State<EndedScreen> {
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
        child: ListView(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 400,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1,
              ),
              itemCount: 2,
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
                          () => DealWinnersScreen(),
                          transition: Transition.leftToRight,
                        );
                      })
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
