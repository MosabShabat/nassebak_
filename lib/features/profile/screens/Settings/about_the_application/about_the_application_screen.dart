import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../consts/conste.dart';
import '../../../controller/profile_controller.dart';

class AboutTheApplicationScreen extends StatefulWidget {
  const AboutTheApplicationScreen({Key? key}) : super(key: key);

  @override
  State<AboutTheApplicationScreen> createState() =>
      _AboutTheApplicationScreenState();
}

class _AboutTheApplicationScreenState extends State<AboutTheApplicationScreen> {
  final AboutAppController = Get.put(profileController());

  RxString Tap1 = '0'.obs;
  RxString Tap2 = '0'.obs;
  RxString Tap3 = '0'.obs;
  bool isDataUpdated = false;

  @override
  void initState() {
    //  if (AboutAppController.isInitAboutTheApplication.value) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await AboutAppController.getAboutAppTaps(1);
      updateTabsData();
    });
    //   AboutAppController.isInitAboutTheApplication.value = false;
    // }

    super.initState();
  }

  void updateTabsData() {
    var data = AboutAppController.AboutAppTaps_var;
    if (data.length >= 3) {
      Tap1.value = data[0].content!;
      Tap2.value = data[1].content!;
      Tap3.value = data[2].content!;
    }
    setState(() {
      isDataUpdated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(),
        body: Obx(
          () => AboutAppController.isAboutAppTaps.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ListView.builder(
                              itemCount:
                                  AboutAppController.AboutAppTaps_var.length,
                              itemBuilder: (context, index) {
                                if (index >=
                                    AboutAppController
                                        .AboutAppTaps_var.length) {
                                  return const SizedBox();
                                }

                                var data = AboutAppController.AboutAppTaps_var;
                                return TabBar(
                                  indicator: BoxDecoration(
                                    color: yalowColor,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      text: data[0].title!,
                                    ),
                                    Tab(
                                      text: data[1].title!,
                                    ),
                                    Tab(
                                      text: data[2].title!,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight / 2,
                          width: context.screenWidth,
                          child: isDataUpdated
                              ? TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 50),
                                          Obx(
                                            () => HtmlWidget(
                                              '${Tap1.value}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 50),
                                          Obx(
                                            () => HtmlWidget(
                                              '${Tap2.value}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 50),
                                          Obx(
                                            () => HtmlWidget(
                                              '${Tap3.value}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
