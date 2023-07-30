import 'package:nassebak_/features/profile/screens/main_sections/perfumes_and_makeup_screen.dart';

import '../../../../consts/conste.dart';
import '../../controller/profile_controller.dart';

class MainSectionsScreen extends StatefulWidget {
  const MainSectionsScreen({super.key});

  @override
  State<MainSectionsScreen> createState() => _MainSectionsScreenState();
}

//InterItem
class _MainSectionsScreenState extends State<MainSectionsScreen> {
  final SectionsController = Get.put(profileController());

  @override
  void initState() {
    super.initState();
    if (SectionsController.isInitSections.value) {
      SectionsController.getSections();
      SectionsController.isInitSections.value = false;
    }
  }

  Future<void> _refreshData() async {
    SectionsController.resetPagination();
    SectionsController.getSections(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        edgeOffset: 20,
        child: Obx(
          () => SectionsController.isDataSections.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainSections.tr.text
                              .fontFamily(bold)
                              .size(24)
                              .black
                              .make(),
                          20.heightBox,
                          SizedBox(
                            width: context.screenWidth,
                            height: context.screenHeight - 150,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 350,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 1,
                              ),
                              itemCount:
                                  SectionsController.sectionsItems_var.length,
                              itemBuilder: (context, index) {
                                print(
                                  SectionsController.sectionsItems_var.length,
                                );
                                // if (index ==
                                //     SectionsController
                                //         .sectionsItems_var.length) {
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
                                var data =
                                    SectionsController.sectionsItems_var[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
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
                                                    image:
                                                        AssetImage(onboarding1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              20.heightBox,
                                              '${data.name!}'
                                                  .split(' ')
                                                  .take(3)
                                                  .join(' ')
                                                  .text
                                                  .fontFamily(medium)
                                                  .size(16)
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      ).onTap(() {
                                        Get.to(
                                          () => PerfumesAndMakeupScreen(
                                            id: data.id!,
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      })
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          50.heightBox
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
