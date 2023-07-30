import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import '../../../consts/conste.dart';
import '../../../local/my_local_controller.dart';

class languageScreen extends StatefulWidget {
  const languageScreen({super.key});

  @override
  State<languageScreen> createState() => _languageScreenState();
}

class _languageScreenState extends State<languageScreen> {
  final _localController = Get.put(MyLocalController());
  final GetStorage _storage = GetStorage();
  int selectedLanguage = 0;

  @override
  void initState() {
    super.initState();
    String? storedLanguage = _storage.read('lang');
    if (storedLanguage != null) {
      // Check if the stored language matches Arabic or English
      if (storedLanguage == 'ar') {
        selectedLanguage = 0;
      } else if (storedLanguage == 'en') {
        selectedLanguage = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Language.tr.text.bold.black.size(30).make(),
                10.heightBox,
                PleaseSelectALanguage.tr.text.medium
                    .size(16)
                    .color(Colors.grey)
                    .make(),
                20.heightBox,
                CheckboxListTile(
                  activeColor: yalowColor,
                  checkboxShape: CircleBorder(
                      side: BorderSide(
                    width: 5,
                  )),
                  value: selectedLanguage == 0,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = 0;
                      _localController.changeLang('ar');
                    });
                  },
                  secondary: SvgPicture.asset(ArabicFlag),
                  title: Arabic.tr.text.black.size(24).make(),
                ),
              ],
            ),
          ),
          Divider(
            indent: 0,
            endIndent: 0,
            thickness: 1,
            height: 3,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CheckboxListTile(
                  activeColor: yalowColor,
                  checkboxShape: CircleBorder(
                      side: BorderSide(
                    width: 5,
                  )),
                  value: selectedLanguage == 1,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = 1;
                      _localController.changeLang('en');
                    });
                  },
                  secondary: SvgPicture.asset(EnglishFlag),
                  title: English.tr.text.black.size(24).make(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
