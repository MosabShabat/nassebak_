import 'package:flutter_svg/svg.dart';
import 'package:nassebak_/common/widgets/web_view_screen.dart';
import '../../../../models/Response.dart' as Response;
import '../../consts/conste.dart';
import '../../features/auth/controller/auth_getx_controller.dart';
import '../../features/bag_page/controller/package_controller.dart';
import 'custom_button.dart';

class cartPayMent extends StatefulWidget {
  final String price;
  final String promoCodeAmount;
  final String vat;
  final String total;
  final String currency;
  final int id;
  final String screen;

  cartPayMent({
    super.key,
    required this.price,
    required this.promoCodeAmount,
    required this.vat,
    required this.total,
    required this.currency,
    required this.id,
    required this.screen,
  });

  @override
  State<cartPayMent> createState() => _cartPayMentState();
}

class _cartPayMentState extends State<cartPayMent> {
  var controllerPackage = Get.put(packageController());
  @override
  List payMentTypes = [
    applePay,
    mada,
    visa,
    masterCard,
  ];
  late TextEditingController _PaymentTextController;
  var pay_met;

  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  void initState() {
    _PaymentTextController = TextEditingController();
    // controllerPackage.Payment_Var.clear();
    if (controllerPackage.isInitPay.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await controllerPackage.getPackageDetails(widget.id);
      });
      controllerPackage.isInitPay(false);
    }

    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: mainColor,
        width: 1.0,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _PaymentTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthGetxController());
    return Obx(
      () => controllerPackage.isPackageDetailsLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  discountCode.tr.text.maxLines(2).black.bold.size(24).make(),
                  20.heightBox,
                  Row(
                    children: [
                      TextField(
                        controller: _PaymentTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: EnterTheDiscountCode.tr,
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: blackColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  )),
                              child: Center(
                                child: verification.tr.text.white.bold
                                    .size(14)
                                    .make(),
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: const BorderSide(
                              width: 1,
                              color: whiteColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ).box.height(60).width(context.screenWidth - 20).make(),
                    ],
                  ),
                  20.heightBox,
                  InvoiceDetails.tr.text.maxLines(2).black.bold.size(24).make(),
                  20.heightBox,
                  ListTile(
                    title:
                        transactionValue.tr.text.black.medium.size(18).make(),
                    trailing: '${widget.price} ${widget.currency}'
                        .text
                        .maxLines(2)
                        .black
                        .fontFamily(bold)
                        .size(14)
                        .make(),
                  ),
                  ListTile(
                      title: Row(
                        children: [
                          discountCode.tr.text.black.medium.size(18).make(),
                          ' de20 '.text.color(yalowColor).bold.size(16).make(),
                        ],
                      ),
                      trailing: '${widget.promoCodeAmount} ${widget.currency}'
                          .text
                          .black
                          .fontFamily(bold)
                          .size(14)
                          .color(Color(0xFF028C59))
                          .make()),
                  ListTile(
                      title: valueAddedTax.tr.text.black.medium.size(18).make(),
                      trailing: '${widget.vat} ${widget.currency}'
                          .text
                          .maxLines(2)
                          .black
                          .fontFamily(bold)
                          .size(14)
                          .make()),
                  ListTile(
                    title: ShippingCharges.tr.text.black.medium.size(18).make(),
                    trailing: '0 ${widget.currency}'
                        .text
                        .maxLines(2)
                        .black
                        .fontFamily(bold)
                        .size(14)
                        .make(),
                  ),
                  ListTile(
                    title: Total.tr.text.black.medium.size(18).make(),
                    trailing: '${widget.total} ${widget.currency}'
                        .text
                        .maxLines(2)
                        .black
                        .fontFamily(bold)
                        .size(14)
                        .make(),
                  ),
                  20.heightBox,
                  paymentMethod.tr.text.maxLines(2).black.bold.size(24).make(),
                  20.heightBox,
                  SizedBox(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: index == selectedIndex
                                      ? Colors.grey.withOpacity(0.3)
                                      : Colors.transparent,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      payMentTypes[index],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      text: BuyNow.tr,
                      onPressed: () async => await _performPayment(),
                      textColor: whiteColor,
                      backgroundColor: mainColor,
                      borderColor: mainColor,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _performPayment() async {
    if (_checkData()) {
      await Payment();
    }
  }

  bool _checkData() {
    if (_PaymentTextController.text.isNotEmpty) {
      if (selectedIndex == 0) {
        pay_met = 1;
      } else if (selectedIndex == 1) {
        pay_met = 2;
      } else if (selectedIndex == 2) {
        pay_met = 3;
      } else if (selectedIndex == 3) {
        pay_met = 4;
      }
      return true;
    }
    Get.snackbar('message', 'Something is Wrong');
    return false;
  }

  Future<void> Payment() async {
    Response.Response response = await Get.find<AuthGetxController>().PayMet(
      id: widget.id,
      payment_method_id: '$pay_met',
      code: '',
    );
    print(response.data);

    if (response.status!) {
      VxToast.show(context, msg: 'Payment Successfully');
      String url = response.data['url'];
      print('++++++++++++++++++++++++++++++');
      print(pay_met);
      print('++++++++++++++++++++++++++++++');
      Get.off(
        () => WebViewScreen(
          url: url,
        )

        // widget.screen == 'successfullyScreen'
        //     ? successfullyScreen()
        //     : PurchaseSuccessfullyScreen()

        ,
        transition: Transition.leftToRight,
      );
    }

    Get.snackbar(
      "message",
      response.message!,
      backgroundColor: response.status! ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }
}
