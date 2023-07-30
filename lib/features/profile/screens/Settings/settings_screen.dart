import 'package:nassebak_/features/profile/screens/Settings/privacy_policy_main_screen.dart';
import 'package:nassebak_/features/profile/screens/Settings/terms_and_conditions_screen.dart';

import '../../../../common/widgets/settings_list_tail.dart';
import '../../../../consts/conste.dart';
import 'Delete_my_account_screen.dart';
import 'about_the_application/about_the_application_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Settings.tr.text.black.bold.size(30).make(),
            20.heightBox,
            settingsListTail(
              titleColor: blackColor,
              icon: vuesaxOutlineInfoCircle,
              title: AboutTheApplication.tr,
              onPressed: () {
                Get.to(
                  () => AboutTheApplicationScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              containerColor: lightColor,
              iconColor: blackColor,
            ),
            20.heightBox,
            settingsListTail(
              titleColor: blackColor,
              icon: shieldTick,
              title: TermsAndConditions.tr,
              onPressed: () {
                Get.to(
                  () => TermsAndConditionsScreen(),
                  transition: Transition.rightToLeft,
                );
                //TermsAndConditionsScreen
              },
              containerColor: lightColor,
              iconColor: blackColor,
            ),
            20.heightBox,
            settingsListTail(
              titleColor: blackColor,
              icon: vuesaxOutlineDocument,
              title: privacyPolicy.tr,
              onPressed: () {
                Get.to(
                  () => privacyPolicyMainScreen(),
                  transition: Transition.rightToLeft,
                );
                //privacyPolicyMainScreen
              },
              containerColor: lightColor,
              iconColor: blackColor,
            ),
            20.heightBox,
            settingsListTail(
              titleColor: Colors.red,
              icon: vuesaxOutlineTrashsetting2,
              title: DeleteMyAccount.tr,
              onPressed: () {
                Get.to(
                  () => DeleteMyAccountScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              containerColor: lightColor,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
