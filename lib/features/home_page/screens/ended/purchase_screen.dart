import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/features/home_page/screens/ended/purchase_successfully_screen.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../consts/conste.dart';

class purchaseScreen extends StatefulWidget {
  const purchaseScreen({super.key});

  @override
  State<purchaseScreen> createState() => _purchaseScreenState();
}

class _purchaseScreenState extends State<purchaseScreen> {
  List payMentTypes = [
    applePay,
    mada,
    masterCard,
    visa,
  ];

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: mainColor,
        width: 1.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: BuyNow.tr,
          onPressed: () {
            Get.to(() => const PurchaseSuccessfullyScreen(),
                transition: Transition.downToUp);
          },
          textColor: whiteColor,
          backgroundColor: mainColor,
          borderColor: mainColor,
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuyTheDeal.tr.text.maxLines(2).black.bold.size(24).make(),
              20.heightBox,
              Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            50.widthBox,
                            Column(
                              children: [
                                10.heightBox,
                                'تامر هاشم'.text.black.bold.size(20).make(),
                                10.heightBox,
                                Row(
                                  children: [
                                    ' 200.0 '
                                        .text
                                        .color(yalowColor)
                                        .bold
                                        .size(20)
                                        .make(),
                                    Rial.tr.text
                                        .color(yalowColor)
                                        .bold
                                        .size(20)
                                        .make(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .box
                      .height(140)
                      .rounded
                      .padding(EdgeInsets.symmetric(horizontal: 20))
                      .width(double.infinity)
                      .color(lightColor)
                      .make(),
                  Positioned(
                    top: -4,
                    right: 1,
                    child: SvgPicture.asset(
                      Asset3,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              // cartPayMent(),
            ],
          ),
        ),
      ),
    );
  }
}
