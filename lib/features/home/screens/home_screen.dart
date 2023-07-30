import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/exit_dialog.dart';
import '../../../consts/conste.dart';
import '../../bag_page/screens/bag_screen.dart';
import '../../partner_offers/screens/partner_offers_screens.dart';
import '../../home_page/screens/home_page_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../rewards/screens/rewards_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  int page;
  HomeScreen({this.page = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.find<HomeController>();

  var navbarItem = [
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        VectorMain,
      ),
      activeIcon: SvgPicture.asset(
        Vector3,
      ),
    ),
    //Vector3
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        Light,
      ),
      activeIcon: SvgPicture.asset(
        ICON1,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        ICON2,
      ),
      activeIcon: SvgPicture.asset(
        ICON3,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        ICON4,
      ),
      activeIcon: SvgPicture.asset(
        ICON5,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        ICON6,
      ),
      activeIcon: SvgPicture.asset(
        ICON7,
      ),
    ),
  ];
  Future<void> _refreshData() async {
    // Simulate an asynchronous data fetch
    await Future.delayed(Duration(seconds: 2));

    // setState(() {
    //   // Update the data
    //   // items = List.generate(20, (index) => 'Item ${index + 1} (Refreshed)');
    // });
  }

  @override
  Widget build(BuildContext context) {
    var navBody = [
      HomePage(page: widget.page),
      const PackagesScreen(),
      const RewardsScreens(),
      const PartnerOffersScreen(),
      const ProfileScreen(),
    ];
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(),
          );
          return false;
        },
        child: Obx(() {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedItemColor: mainColor,
              selectedIconTheme: IconThemeData(
                color: mainColor,
                size: 35,
              ),
              selectedLabelStyle: const TextStyle(fontFamily: Black),
              type: BottomNavigationBarType.fixed,
              items: navbarItem,
              onTap: (value) {
                controller.currentNavIndex.value = value;
              },
            ),
          );
        }),
      ),
    );
  }
}
