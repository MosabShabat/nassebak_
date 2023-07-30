
import '../../../../consts/conste.dart';
import '../../controller/profile_controller.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final AboutAppController = Get.put(profileController());

  @override
  void initState() {
    if (AboutAppController.isInitTermsAndConditions.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await AboutAppController.getAboutApp(2);
      });
      AboutAppController.isInitTermsAndConditions.value = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Obx(() => AboutAppController.isAboutApp.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  if (index >= AboutAppController.AboutApp_var.length) {
                    return const SizedBox(); // Return an empty SizedBox if the index is out of bounds
                  }

                  var data = AboutAppController.AboutApp_var[index];
                  return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          '${data.title}'
                              .tr
                              .text
                              .size(24)
                              .fontFamily(bold)
                              .black
                              .make(),
                          20.heightBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data.content}',
                                maxLines: 20,
                                style: TextStyle(
                                  fontFamily: bold,
                                  fontSize: 14,
                                  color: blackColor,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              )
                  .box
                  .height(context.screenHeight)
                  .width(context.screenWidth)
                  .make(),
            )),
    );
  }
}
