import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/Bag_page/screens/package_details_screen.dart';
import '../../../consts/conste.dart';
import '../controller/package_controller.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  var controller = Get.put(packageController());

  @override
  void initState() {
    super.initState();
    if (controller.isInit.value) {
      controller.getPackage();
      controller.getTickets();
      controller.isInit.value = false;
    }
  }

  Future<void> _refreshData() async {
    controller.resetPagination();
    controller.getPackage(refresh: true);
    controller.getTickets(refresh: true);
  }

  Future<void> _loadMoreData() async {
    controller.loadMorePackages();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Obx(
          () => controller.isDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.heightBox,
                              Packages.tr.text.black
                                  .fontFamily(bold)
                                  .size(18)
                                  .make(),
                              10.heightBox,
                              BuyPackages.tr.text.black
                                  .fontFamily(medium)
                                  .size(12)
                                  .make(),
                              20.heightBox,
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyCredit.tr.text.white
                                        .fontFamily(bold)
                                        .size(14)
                                        .make(),
                                    20.heightBox,
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          ticket,
                                          width: 40,
                                          height: 30,
                                        ),
                                        20.widthBox,
                                        '${controller.MainPackage_Var}'
                                            .text
                                            .white
                                            .fontFamily(bold)
                                            .size(20)
                                            .make(),
                                        20.widthBox,
                                        Ticket.tr.text.white
                                            .fontFamily(bold)
                                            .size(14)
                                            .make(),
                                      ],
                                    )
                                  ],
                                ),
                              )
                                  .box
                                  .height(100)
                                  .rounded
                                  .padding(EdgeInsets.all(10))
                                  .width(double.infinity)
                                  .color(mainColor)
                                  .make(),
                              30.heightBox,
                              Container(
                                width: context.screenWidth,
                                height: context.screenHeight / 1.6,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.Package_Var.length,
                                  itemBuilder: (context, index) {
                                    //   print(controller.Package_Var.length);
                                    var PackageData =
                                        controller.Package_Var[index];
                                    return InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => PackageDetails(
                                            id: PackageData.id!,
                                          ),
                                          transition: Transition.leftToRight,
                                        );
                                      },
                                      child: Container(
                                        height: 150,
                                        padding: EdgeInsets.all(20),
                                        width: context.screenWidth,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              BGG,
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            '${PackageData.title}'
                                                .text
                                                .black
                                                .fontFamily(bold)
                                                .size(18)
                                                .make(),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          ticket,
                                                        ),
                                                        20.widthBox,
                                                        '${PackageData.tickets}'
                                                            .text
                                                            .black
                                                            .fontFamily(bold)
                                                            .size(20)
                                                            .make(),
                                                        20.widthBox,
                                                        Ticket.tr.text.black
                                                            .fontFamily(bold)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            Currency),
                                                        20.widthBox,
                                                        '${PackageData.points}'
                                                            .text
                                                            .black
                                                            .fontFamily(bold)
                                                            .size(20)
                                                            .make(),
                                                        20.widthBox,
                                                        Point.tr.text.black
                                                            .fontFamily(bold)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 90,
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                    color: yalowColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ' ${PackageData.price} '
                                                            .text
                                                            .white
                                                            .fontFamily(bold)
                                                            .size(18)
                                                            .make(),
                                                        '${PackageData.currency}'
                                                            .text
                                                            .white
                                                            .fontFamily(medium)
                                                            .size(12)
                                                            .make(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
