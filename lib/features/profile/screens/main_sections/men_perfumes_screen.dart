import 'dart:async';

import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/positioned_stack.dart';
import '../../../../consts/conste.dart';
import '../../../home_page/controller/home_page_controller.dart';
import '../../../home_page/screens/deals/bonus_replacement_screen.dart';
import '../../controller/profile_controller.dart';

class MenPerfumesScreen extends StatefulWidget {
  final int id;

  MenPerfumesScreen({super.key, required this.id});

  @override
  State<MenPerfumesScreen> createState() => _MenPerfumesScreenState();
}

class _MenPerfumesScreenState extends State<MenPerfumesScreen> {
  final SubSectionsController = Get.put(profileController());
  final controller = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();
    _refreshData();

    // if (SubSectionsController.isInitSubSections.value) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SubSectionsController.getSubSections(
        id: widget.id,
      );
    });
    //   SubSectionsController.isInitSubSections.value = false;
    // }
  }

  Future<void> _refreshData() async {
    SubSectionsController.resetPagination();
    SubSectionsController.getSubSections(
      id: widget.id,
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('=============== here ================');
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => SubSectionsController.isSubSections_details.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${SubSectionsController.SubSections_var}"
                              .text
                              .bold
                              .black
                              .size(30)
                              .make(),
                          20.heightBox,
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 400,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 1,
                            ),
                            itemCount:
                                SubSectionsController.sub_sections_var.length,
                            itemBuilder: (context, index) {
                              print('======================');
                              print(SubSectionsController
                                  .sub_sections_var.isEmpty);
                              print(
                                SubSectionsController.sub_sections_var.length,
                              );
                              if (SubSectionsController
                                      .sub_sections_var.isEmpty ||
                                  SubSectionsController
                                          .sub_sections_var.length ==
                                      0) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    'No Data yat!!'
                                        .text
                                        .fontFamily(bold)
                                        .size(20)
                                        .make(),
                                  ],
                                );
                              } else {
                                // if (index ==
                                //     SubSectionsController
                                //         .sub_sections_var.length) {
                                //   return InkWell(
                                //     onTap: () {
                                //       _refreshData();
                                //     },
                                //     child: Container(
                                //       height: 50,
                                //       child: Center(
                                //         child: Text(
                                //           'Load More',
                                //           style: TextStyle(
                                //             color: Colors.blue,
                                //             fontWeight: FontWeight.bold,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   );
                                // }
                                var data = SubSectionsController
                                    .sub_sections_var[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
                                                        '${data.image}'),
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
                                                            second.tr.text.black
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
                                                            minute.tr.text.black
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
                                                            hour.tr.text.black
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
                                                            day.tr.text.black
                                                                .medium
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
                                                        .alignment(Alignment
                                                            .bottomCenter)
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
                                                                '${time.min}'
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
                                                                '${time.hours}'
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
                                                                '${time.days}'
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
                                                          );
                                                        },
                                                      )
                                                        .box
                                                        .margin(const EdgeInsets
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
                              }
                            },
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
