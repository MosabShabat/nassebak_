
import '../../../common/widgets/notifications_icon.dart';
import '../../../consts/conste.dart';
import '../../profile/controller/profile_controller.dart';
import 'deals/deals_screen.dart';
import 'ended/ended_screen.dart';
import 'my_deals/my_deals_screen.dart';

class HomePage extends StatefulWidget {
  final int page;

  const HomePage({super.key, required this.page});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final userController = Get.put(profileController());

  @override
  void initState() {
    tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.page);

    if (userController.isInitAcc.value) {
      userController.getAccountData();
      userController.isInitAcc.value = false;
    }

    super.initState();
  }

  Future<void> _refreshData() async {
    userController.resetPagination();
    userController.getAccountData(refresh: true);
  }

  final List items = [
    ScrollGroup,
    ScrollGroup,
  ];
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(
          () => userController.isDataAcLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Welcome.tr.text
                        .size(14)
                        .medium
                        .fontFamily(sansAloft)
                        .black
                        .make(),
                    5.heightBox,
                    userController.Acc_Var!.fullName! == null
                        ? 'Loading...'
                            .text
                            .size(14)
                            .fontFamily(bold)
                            .black
                            .make()
                        : '${userController.Acc_Var!.fullName!}'
                            .text
                            .size(14)
                            .fontFamily(bold)
                            .black
                            .make(),
                  ],
                ),
        ),
        actions: [
          NotificationsIcon(
            notificationCount: 6,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          children: [
            PageView.builder(
              itemCount: items.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(
                    child: Column(
                  children: [
                    Image.asset(
                      items[index],
                      height: 200,
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ));
              },
            ).box.height(200).width(context.screenWidth).make(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                      color: yalowColor,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: Deals.tr,
                    ),
                    Tab(
                      text: Ended.tr,
                    ),
                    Tab(
                      text: MyDeals.tr,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                Center(
                  child: DealsScreen(),
                ),
                Center(
                  child: EndedScreen(),
                ),
                Center(
                  child: MyDealsScreen(),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
