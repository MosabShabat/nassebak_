import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/profile/screens/register_the_package_screen.dart';
import '../../../consts/conste.dart';
import '../controller/profile_controller.dart';

class historyPackagesScreen extends StatefulWidget {
  const historyPackagesScreen({super.key});

  @override
  State<historyPackagesScreen> createState() => _historyPackagesScreenState();
}

class _historyPackagesScreenState extends State<historyPackagesScreen> {
  final historyController = Get.put(profileController());
  @override
  void initState() {
    super.initState();
    // _refreshData();

    if (historyController.isInitHis.value) {
      historyController.getPurchasedPackages();
      historyController.isInitHis.value = false;
    }
  }

  Future<void> _refreshData() async {
    historyController.resetPagination();
    historyController.getPurchasedPackages(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(),
        body: Obx(
          () => historyController.isPurchasedPackages.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PackagesRegister.tr.text
                              .fontFamily(bold)
                              .black
                              .size(30)
                              .make(),
                          10.heightBox,
                          SizedBox(
                            width: context.screenWidth,
                            height: context.screenHeight / 1.2,
                            child: ListView.builder(
                              itemCount: historyController
                                  .purchased_packages_var.length,
                              itemBuilder: (context, index) {
                                var hisData = historyController
                                    .purchased_packages_var[index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        '${hisData.title}'
                                            .text
                                            .fontFamily(bold)
                                            .black
                                            .size(24)
                                            .make(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(ticket),
                                            '${hisData.tickets}'
                                                .text
                                                .fontFamily(bold)
                                                .black
                                                .size(18)
                                                .make(),
                                            Ticket.tr.text
                                                .fontFamily(bold)
                                                .black
                                                .size(12)
                                                .make(),
                                          ],
                                        ).box.width(120).make(),
                                        10.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            thePrice.tr.text
                                                .fontFamily(medium)
                                                .black
                                                .size(12)
                                                .make(),
                                            '${hisData.price}'
                                                .text
                                                .fontFamily(bold)
                                                .black
                                                .size(16)
                                                .make(),
                                            '${hisData.currency}'
                                                .text
                                                .fontFamily(medium)
                                                .black
                                                .size(12)
                                                .make(),
                                          ],
                                        ).box.width(120).make(),
                                        10.heightBox,
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        20.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(Currency),
                                            '${hisData.points}'
                                                .text
                                                .fontFamily(bold)
                                                .black
                                                .size(22)
                                                .make(),
                                            Point.tr.text
                                                .fontFamily(bold)
                                                .black
                                                .size(12)
                                                .make(),
                                          ],
                                        ).box.width(120).make(),
                                        10.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Date.tr.text
                                                .fontFamily(medium)
                                                .black
                                                .size(12)
                                                .make(),
                                            '${hisData.date}'
                                                .text
                                                .fontFamily(medium)
                                                .black
                                                .size(12)
                                                .make(),
                                          ],
                                        ).box.width(120).make(),
                                        10.heightBox,
                                      ],
                                    ),
                                  ],
                                )
                                    .box
                                    .height(170)
                                    .rounded
                                    .margin(EdgeInsets.symmetric(vertical: 20))
                                    .width(context.screenWidth)
                                    .color(lightColor)
                                    .padding(EdgeInsets.all(20))
                                    .make()
                                    .onTap(() {
                                  Get.to(
                                    () => RegisterThePackageScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
                  .box
                  .height(context.screenHeight)
                  .width(context.screenWidth)
                  .make(),
        ),
      ),
    );
  }
}
