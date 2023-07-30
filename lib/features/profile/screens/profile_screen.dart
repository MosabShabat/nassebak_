import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/profile/screens/transaction_history_screen.dart';
import '../../../../models/Response.dart' as Response;
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/settings_list_tail.dart';
import '../../../consts/conste.dart';
import '../../auth/controller/auth_getx_controller.dart';
import '../../auth/screens/login_screen.dart';
import '../../home_page/screens/Notifications/notifications_screen.dart';
import '../controller/profile_controller.dart';
import 'Account_Information/account_information_screen.dart';
import 'Settings/settings_screen.dart';
import 'connect_with_us_screen.dart';
import 'favorite_screen.dart';
import 'history_packages_screen.dart';
import 'language_screen.dart';
import 'main_sections/main_sections_screen.dart';
import 'my_address_screen.dart';
import 'my_interests_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ControllerProf = Get.put(profileController());
  final userController = Get.put(profileController());

  var items = [
    Icon(
      Icons.facebook_outlined,
    ),
    SvgPicture.asset(instagram),
    SvgPicture.asset(twitter),
    'in'.text.bold.black.size(20).make(),
    Icon(
      Icons.tiktok_outlined,
    ),
  ];

  @override
  void initState() {
    // print('object');
    // print(userController.getProfileData());
    // print('here');
    // _refreshData();
    _refreshData();
    if (userController.isInitAcc.value) {
      userController.getAccountData();
      userController.isInitAcc.value = false;
    }
    if (ControllerProf.isInit.value) {
      ControllerProf.getProfileData();
      ControllerProf.isInit.value = false;
    }

    super.initState();
  }

  Future<void> _refreshData() async {
    userController.resetPagination();
    userController.getAccountData(refresh: true);
    ControllerProf.getProfileData(refresh: true);
    items = [
      Icon(
        Icons.facebook_outlined,
      ),
      SvgPicture.asset(instagram),
      SvgPicture.asset(twitter),
      'in'.text.bold.black.size(20).make(),
      Icon(
        Icons.tiktok_outlined,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Obx(
          () => ControllerProf.isDataLoading.value &&
                  ControllerProf.isDataAcLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          if (ControllerProf.user_Var == null) {
                            return const SizedBox();
                          }
                          var UserData = ControllerProf.user_Var!;

                          // print(UserData.image);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ProfilePersonals.tr.text
                                        .fontFamily(bold)
                                        .size(18)
                                        .black
                                        .make(),
                                    10.heightBox,
                                    ViewAccount.tr.text
                                        .fontFamily(medium)
                                        .size(12)
                                        .color(Colors.grey)
                                        .make(),
                                    20.heightBox,
                                    Row(
                                      children: [
                                        userController.Acc_Var!.image! == ''
                                            //||
                                            //       UserData.image!.isEmpty
                                            ? CircleAvatar(
                                                radius: 40,
                                                backgroundImage: AssetImage(
                                                  profilePic,
                                                ))
                                            : CircleAvatar(
                                                radius: 40,
                                                backgroundImage: AssetImage(
                                                  profilePic,
                                                )),

                                        // DecoratedBox(
                                        //     decoration: BoxDecoration(
                                        //       shape: BoxShape.circle,
                                        //     ),
                                        //     child: Center(
                                        //         child: Image.network(
                                        //       '${UserData.image!}',
                                        //       width: 60,
                                        //       height: 60,
                                        //       fit: BoxFit.contain,
                                        //     )),
                                        //   ),
                                        10.widthBox,
                                        '${userController.Acc_Var!.fullName!}'
                                            .text
                                            .fontFamily(bold)
                                            .size(16)
                                            .black
                                            .make(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      '${UserData.id!}'
                                          .text
                                          .fontFamily(bold)
                                          .size(20)
                                          .color(yalowColor)
                                          .make(),
                                      10.heightBox,
                                      MembershipNo.tr.text
                                          .fontFamily(bold)
                                          .size(12)
                                          .black
                                          .make(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      '${UserData.tickets!}'
                                          .text
                                          .fontFamily(bold)
                                          .size(20)
                                          .color(yalowColor)
                                          .make(),
                                      10.heightBox,
                                      TicketBalance.tr.text
                                          .fontFamily(bold)
                                          .size(12)
                                          .black
                                          .make(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      '${UserData.points!}'
                                          .text
                                          .fontFamily(bold)
                                          .size(20)
                                          .color(yalowColor)
                                          .make(),
                                      10.heightBox,
                                      PointsBalance.tr.text
                                          .fontFamily(bold)
                                          .size(12)
                                          .black
                                          .make(),
                                    ],
                                  ),
                                ],
                              )
                                  .box
                                  .height(120)
                                  .width(context.screenWidth)
                                  .padding(EdgeInsets.all(20))
                                  .color(lightColor)
                                  .make(),
                              20.heightBox,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: element3,
                                      title: MainSections.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => MainSectionsScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: IconlyLightOutlineNotification,
                                      title: notification.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => NotificationsScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineTicket,
                                      title: TransactionHistory.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => TransactionHistoryScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: Light,
                                      title: PackagesRegister.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => historyPackagesScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                        //historyPackagesScreen
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: ICON6,
                                      title: ProfilePersonals.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => AccountInformationScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineLocationAdd,
                                      title: MyAddress.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => const myAddressScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineHeart,
                                      title: Favorite.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => const FavoriteScreen(),
                                          transition: Transition.rightToLeft,
                                        );

                                        //FavoriteScreen
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: like,
                                      title: myInterests.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => myInterestsScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: Vector4,
                                      title: ConnectWithUs.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => ConnectWithUsScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineGlobal,
                                      title: Language.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => languageScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineSetting2,
                                      title: Settings.tr,
                                      onPressed: () {
                                        Get.to(
                                          () => SettingsScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: setting2,
                                      title: ShareTheApp.tr,
                                      onPressed: () {},
                                      containerColor: lightColor,
                                      iconColor: blackColor,
                                    ),
                                    20.heightBox,
                                    settingsListTail(
                                      titleColor: blackColor,
                                      icon: vuesaxOutlineLogout,
                                      title: LogOut.tr,
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: whiteColor,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: context.screenHeight / 3,
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    LogOut.tr.text.black.medium
                                                        .size(16)
                                                        .make(),
                                                    20.heightBox,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        DoYouWantToLogOut
                                                            .tr.text.black.bold
                                                            .size(18)
                                                            .make(),
                                                      ],
                                                    ),
                                                    40.heightBox,
                                                    CustomButton(
                                                      text: YesSignOut.tr,
                                                      onPressed: () async {
                                                        print('== mos ==');
                                                        await _logout();

                                                        print('=== sha ===');
                                                      },
                                                      textColor: whiteColor,
                                                      backgroundColor:
                                                          Colors.red,
                                                      borderColor: Colors.red,
                                                    ),
                                                    20.heightBox,
                                                    CustomButton(
                                                      text: cancel.tr,
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      textColor: blackColor,
                                                      backgroundColor:
                                                          lightColor,
                                                      borderColor: lightColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      containerColor:
                                          Color.fromARGB(255, 255, 174, 167),
                                      iconColor: Colors.red,
                                    ),
                                    20.heightBox,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: SocialMedia.tr.text
                                          .fontFamily(bold)
                                          .size(18)
                                          .black
                                          .make(),
                                    ),
                                    20.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: items.length,
                                          itemBuilder: (context, index) {
                                            var SocialData = ControllerProf
                                                .socialMediaList_var[index];
                                            return IconButton(
                                              onPressed: () async {
                                                String url =
                                                    '${SocialData.link!}';
                                                await launch(url);
                                              },
                                              icon: items[index],
                                            )
                                                .box
                                                .roundedFull
                                                .height(40)
                                                .width(40)
                                                .margin(EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ))
                                                .alignCenter
                                                .color(lightColor)
                                                .make();
                                          },
                                        )
                                            .box
                                            .height(50)
                                            .width(context.screenWidth - 20)
                                            .padding(EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ))
                                            .make()
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              10.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Version.tr.text.black.medium.make(),
                                ],
                              ),
                              30.heightBox,
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _logout() async {
    print('========== here ===========');
    Response.Response response = await AuthGetxController().logout();
    print(response.status);
    if (response.status!) {
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.downToUp,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
