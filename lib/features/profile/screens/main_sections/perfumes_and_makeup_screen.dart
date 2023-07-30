import '../../../../consts/conste.dart';
import '../../controller/profile_controller.dart';
import 'men_perfumes_screen.dart';

class PerfumesAndMakeupScreen extends StatefulWidget {
  final int id;

  PerfumesAndMakeupScreen({super.key, required this.id});

  @override
  State<PerfumesAndMakeupScreen> createState() =>
      _PerfumesAndMakeupScreenState();
}

class _PerfumesAndMakeupScreenState extends State<PerfumesAndMakeupScreen> {
  final SectionsController = Get.put(profileController());

  @override
  void initState() {
    super.initState();
    _refreshData();

    if (SectionsController.isInitDet.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await SectionsController.getSectionDetails(
          id: widget.id,
        );
      });
      SectionsController.isInitDet.value = false;
    }
  }

  Future<void> _refreshData() async {
    SectionsController.resetPagination();
    SectionsController.getSectionDetails(
      id: widget.id,
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => SectionsController.isSection_details.value
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
                          "${SectionsController.SectionDet_Var}"
                              .text
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
                                  SectionsController.sections_details.length,
                              itemBuilder: (context, index) {
                                print('${SectionsController.sections_details}');
                                print(
                                  SectionsController.sections_details.length,
                                );
                                // if (index ==
                                //     SectionsController.sections_details.length) {
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
                                    SectionsController.sections_details[index];

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
                                              "${data.name!}"
                                                  .split(' ')
                                                  .take(3)
                                                  .join(' ')
                                                  .text
                                                  .medium
                                                  .size(18)
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      ).onTap(() {
                                        Get.to(
                                          () => MenPerfumesScreen(
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
                          )
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
