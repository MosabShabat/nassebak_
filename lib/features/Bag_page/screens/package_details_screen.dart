import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/cart_pay_ment.dart';
import '../../../consts/conste.dart';
import '../controller/package_controller.dart';

class PackageDetails extends StatefulWidget {
  final int id;
  PackageDetails({super.key, required this.id});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  var controllerPackage = Get.put(packageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controllerPackage.getPackageDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Obx(
        () => controllerPackage.isPackageDetailsLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: SizedBox(),
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '${controllerPackage.Package_Det?.title ?? ''}'
                                    .text
                                    .black
                                    .fontFamily(bold)
                                    .size(24)
                                    .make(),
                                10.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ticket),
                                        20.widthBox,
                                        '${controllerPackage.Package_Det?.tickets ?? ''}'
                                            .text
                                            .black
                                            .fontFamily(bold)
                                            .size(26)
                                            .make(),
                                        20.widthBox,
                                        Ticket.tr.text.blue500.black
                                            .fontFamily(bold)
                                            .size(14)
                                            .make(),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(Currency),
                                        20.widthBox,
                                        '${controllerPackage.Package_Det?.points ?? ''}'
                                            .text
                                            .black
                                            .fontFamily(bold)
                                            .size(26)
                                            .make(),
                                        20.widthBox,
                                        Point.tr.text.white.black
                                            .fontFamily(bold)
                                            .size(14)
                                            .make(),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          20.heightBox,
                          Container(
                            width: context.screenWidth,
                            height: 150,
                            decoration: BoxDecoration(
                                color: yalowColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                )),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ' ${controllerPackage.Package_Det?.price ?? ''} '
                                    .text
                                    .white
                                    .fontFamily(bold)
                                    .size(30)
                                    .make(),
                                ' ${controllerPackage.Package_Det?.currency ?? ''} '
                                    .text
                                    .white
                                    .fontFamily(medium)
                                    .size(18)
                                    .make(),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return cartPayMent(
                          price: ' ${controllerPackage.Bill_Var?.price ?? ''} ',
                          promoCodeAmount:
                              ' ${controllerPackage.Bill_Var?.promoCodeAmount ?? ''} ',
                          vat: ' ${controllerPackage.Bill_Var?.vat ?? ''} ',
                          total: ' ${controllerPackage.Bill_Var?.total ?? ''} ',
                          currency:
                              ' ${controllerPackage.Bill_Var?.currency ?? ''} ',
                          id: widget.id,
                          screen: 'successfullyScreen',
                          
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
