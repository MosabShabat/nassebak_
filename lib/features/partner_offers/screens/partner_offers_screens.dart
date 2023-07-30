
import 'package:nassebak_/features/partner_offers/screens/partner_offer_details.dart';

import '../../../consts/conste.dart';
import '../controller/partner_offers_controller.dart';

class PartnerOffersScreen extends StatefulWidget {
  const PartnerOffersScreen({super.key});

  @override
  State<PartnerOffersScreen> createState() => _PartnerOffersScreenState();
}

class _PartnerOffersScreenState extends State<PartnerOffersScreen> {
  var partnersController = Get.put(partnerOffersController());

  @override
  void initState() {
    super.initState();
    if (partnersController.isInit.value) {
      partnersController.getPartners();
      partnersController.isInit.value = false;
    }
  }

  Future<void> _refreshData() async {
    partnersController.resetPagination();
    partnersController.getPartners(refresh: true);
  }

  Future<void> _loadMoreData() async {
    partnersController.loadMorePackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => partnersController.isDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PartnerOffers.tr.text.black
                                  .fontFamily(bold)
                                  .size(18)
                                  .make(),
                              10.heightBox,
                              GetToKnow.tr.text
                                  .color(Colors.grey)
                                  .fontFamily(medium)
                                  .size(12)
                                  .make(),
                              20.heightBox,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    partnersController.Partners_Var.length,
                                itemBuilder: (context, index) {
                                  print(partnersController.Partners_Var.length);
                                  var PackageData =
                                      partnersController.Partners_Var[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: lightColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${PackageData.logo}'),
                                                  fit: BoxFit.fill,
                                                )),
                                          )
                                              .box
                                              .margin(EdgeInsets.symmetric(
                                                  horizontal: 8))
                                              .make(),
                                          20.widthBox,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              '${PackageData.name}'
                                                  .text
                                                  .black
                                                  .bold
                                                  .size(18)
                                                  .make(),
                                              10.heightBox,
                                              '${PackageData.description}'
                                                  .text
                                                  .color(Colors.grey)
                                                  .medium
                                                  .size(14)
                                                  .make(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ).onTap(() {
                                      Get.to(
                                        () => PartnerOfferDetailsScreen(
                                          id: PackageData.id!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    }),
                                  );
                                },
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
