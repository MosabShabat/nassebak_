import '../../../../models/Response.dart' as Response;
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../../models/inter_item.dart';
import '../../auth/controller/auth_getx_controller.dart';
import '../controller/profile_controller.dart';

class myInterestsScreen extends StatefulWidget {
  const myInterestsScreen({super.key});

  @override
  State<myInterestsScreen> createState() => _myInterestsScreenState();
}

class _myInterestsScreenState extends State<myInterestsScreen> {
  var IntrController = Get.put(profileController());
  var authContr = Get.put(AuthGetxController());

  @override
  void initState() {
    // if (IntrController.isInitInter.value) {
    IntrController.getInterested();
    //   IntrController.isInitInter.value = false;
    // }

    super.initState();
  }

  Future<void> _refreshData() async {
    IntrController.resetPagination();
    IntrController.getInterested();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthGetxController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: Save.tr,
          onPressed: () async => await _performInter(),
          textColor: whiteColor,
          backgroundColor: mainColor,
          borderColor: mainColor,
        ),
      ),
      appBar: AppBar(),
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => IntrController.isInter.value
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
                          myInterests.tr.text.bold.black.size(30).make(),
                          10.heightBox,
                          LetGet.tr.text.medium
                              .size(12)
                              .color(Colors.grey)
                              .make(),
                          20.heightBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildRandomColumns(
                                IntrController.InterItem_var),
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

  List<Widget> _buildRandomColumns(List<InterItem> items) {
    items.shuffle();

    List<Widget> columns = [];
    int currentGroupSize = 0;
    List<InterItem> currentGroup = [];

    for (var item in items) {
      currentGroup.add(item);
      currentGroupSize++;

      if (currentGroupSize == 3 || item == items.last) {
        columns.add(
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: currentGroup.map((item) {
                print('************* here *************');
                print(IntrController.InterItem_var.length);
                print('************* here *************');
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      item.isSelected = !item.isSelected!;
                    });
                  },
                  child: SizedBox(
                    width: item.title!.length * 7.0 + context.screenWidth / 6,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      height: 40,
                      decoration: BoxDecoration(
                        color: item.isSelected! ? yalowColor : lightColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: item.isSelected! ? yalowColor : blackColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.isSelected! ? Icons.done : Icons.add,
                            color: item.isSelected! ? whiteColor : blackColor,
                          ),
                          8.widthBox,
                          '${item.title!}'
                              .text
                              .medium
                              .size(12)
                              .color(item.isSelected! ? whiteColor : blackColor)
                              .make(),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );

        currentGroup = [];
        currentGroupSize = 0;
      }
    }

    return columns;
  }

  Future<void> _performInter() async {
    if (_checkData()) {
      await _resetInter();
    }
  }

  bool _checkData() {
    return _checkInter();
  }

  bool _checkInter() {
    for (var item in IntrController.InterItem_var) {
      if (item.isSelected!) {
        return true;
      }
    }
    return false;
  }

  Future<void> _resetInter() async {
    List<int> selectedIndices = [];
    List<int> selectedIds = [];

    for (int index = 0; index < IntrController.InterItem_var.length; index++) {
      var item = IntrController.InterItem_var[index];
      if (item.isSelected!) {
        selectedIndices.add(index);
        selectedIds.add(item.id!);
      }
    }

    for (int i = 0; i < selectedIndices.length; i++) {
      int index = selectedIndices[i];
      int id = selectedIds[i];
      Response.Response response = await authContr.PostInterested(
        index: index,
        id: id,
      );
      print('===============');
      print(i);
      print('===============');
      if (response.status!) {
        Get.back();
      }

      Get.snackbar(
        "message",
        response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
