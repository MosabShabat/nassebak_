import 'package:flutter_svg/svg.dart';

import '../../../../consts/conste.dart';

class ShippingTrackingScreen extends StatefulWidget {
  const ShippingTrackingScreen({super.key});

  @override
  State<ShippingTrackingScreen> createState() => _ShippingTrackingScreenState();
}

class _ShippingTrackingScreenState extends State<ShippingTrackingScreen> {
  int currentStep = 0;
  int activeStep = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShippingTracking.tr.text.black.bold.size(30).make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(ScrollGroup14),
                      ),
                      20.widthBox,
                      Column(
                        children: [
                          20.heightBox,
                          'ارامكس'.text.black.medium.size(20).make(),
                          10.heightBox,
                          '#5332'.text.black.medium.size(20).make(),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child:
                          ShippingTracking.tr.text.white.bold.size(14).make(),
                    ),
                  ),
                  
                ],
              ).box.height(100).make(),
              // Container(
              //   height: 300,
              //   width: context.screenWidth,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     physics: AlwaysScrollableScrollPhysics(),
              //     // Use ListView to provide scrollability if needed
              //     child: IconStepper(
              //       direction: Axis.vertical,
              //       icons: [
              //         Icon(Icons.supervised_user_circle),
              //         Icon(Icons.flag),
              //         Icon(Icons.access_alarm),
              //       ],
              //       activeStep: 3,

              //       onStepReached: (index) {
              //         setState(() {
              //           activeStep = index;
              //         });
              //       },
              //     ).box.height(500).width(100).make(),
              //   ),
              // ),
              Stepper(
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep < 2) {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepCancel: () {
                  if (currentStep > 0) {
                    setState(() {
                      currentStep -= 1;
                    });
                  }
                },
                steps: [
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuyingSucceeded.tr.text.bold.size(18).make(),
                        5.heightBox,
                        ' 1:30 م   05/06/2023'.text.medium.size(14).make(),
                      ],
                    ),
                    isActive: currentStep == 0,
                    state: currentStep == 0
                        ? StepState.editing
                        : StepState.indexed,

                    content: Container(),
                    // Replace with the actual content for step 1
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        charged.tr.text.bold.size(18).make(),
                        5.heightBox,
                        ' 1:30 م   05/06/2023'.text.medium.size(14).make(),
                      ],
                    ),
                    isActive: currentStep == 1,
                    state: currentStep == 1
                        ? StepState.editing
                        : StepState.indexed,
                    content:
                        Container(), // Replace with the actual content for step 2
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sentDeliveredHanded.tr.text.bold.size(18).make(),
                        5.heightBox,
                        ' 1:30 م   05/06/2023'.text.medium.size(14).make(),
                      ],
                    ),
                    isActive: currentStep == 2,
                    state: currentStep == 2
                        ? StepState.editing
                        : StepState.indexed,
                    content:
                        Container(), // Replace with the actual content for step 3
                  ),
                ],
              ),

              20.heightBox,
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            ScrollGroup14,
                          ),
                          fit: BoxFit.fill,
                        )),
                  ),
                  20.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'حقيبة قماش للسفر حقيبة تسوق الكتف',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ).box.height(40).width(220).make(),
                      20.heightBox,
                      'تامر هاشم'.text.bold.maxLines(2).black.size(18).make(),
                      20.heightBox,
                      Row(
                        children: [
                          ' 200.0 '.text.bold.color(yalowColor).size(18).make(),
                          Rial.tr.text.bold
                              .color(yalowColor)
                              .size(18)
                              .size(18)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ],
              )
                  .box
                  .height(160)
                  .width(context.screenWidth)
                  .margin(EdgeInsets.symmetric(
                    vertical: 20,
                  ))
                  .make(),
              20.heightBox,
              PurchaseDetails.tr.text.black.bold.size(20).make(),
              20.heightBox,
              ListTile(
                  leading: operationNumber.tr.text.black.medium.size(18).make(),
                  trailing:
                      '#43234'.text.maxLines(2).black.bold.size(16).make()),
              20.heightBox,
              ListTile(
                  leading: Date.tr.text.black.medium.size(18).make(),
                  trailing:
                      '25/05/2023'.text.maxLines(2).black.bold.size(16).make()),
              20.heightBox,
              ListTile(
                  leading: Time.tr.text.black.medium.size(18).make(),
                  trailing:
                      '07:12 م'.text.maxLines(2).black.bold.size(16).make()),
              20.heightBox,
              InvoiceDetails.tr.text.maxLines(2).black.bold.size(24).make(),
              20.heightBox,
              ListTile(
                title: transactionValue.tr.text.black.medium.size(18).make(),
                trailing: Row(
                  children: [
                    ' 80.00 '.text.maxLines(2).black.bold.size(16).make(),
                    SR.tr.text.maxLines(2).black.bold.size(16).make(),
                  ],
                ).box.height(50).width(80).make(),
              ),
              ListTile(
                title: Row(
                  children: [
                    discountCode.tr.text.black.medium.size(18).make(),
                    ' de20 '
                        .text
                        .maxLines(2)
                        .color(yalowColor)
                        .bold
                        .size(16)
                        .make(),
                  ],
                ),
                trailing: Row(
                  children: [
                    ' 80.00 '.text.maxLines(2).black.bold.size(16).make(),
                    SR.tr.text.black.bold.size(16).make(),
                  ],
                ).box.height(50).width(80).make(),
              ),
              ListTile(
                title: valueAddedTax.tr.text.black.medium.size(18).make(),
                trailing: Row(
                  children: [
                    ' 80.00 '.text.maxLines(2).black.bold.size(16).make(),
                    SR.tr.text.maxLines(2).black.bold.size(16).make(),
                  ],
                ).box.height(50).width(80).make(),
              ),
              ListTile(
                title: ShippingCharges.tr.text.black.medium.size(18).make(),
                trailing: Row(
                  children: [
                    ' 80.00 '.text.maxLines(2).black.bold.size(16).make(),
                    SR.tr.text.maxLines(2).black.bold.size(16).make(),
                  ],
                ).box.height(50).width(80).make(),
              ),
              ListTile(
                title: Total.tr.text.black.medium.size(18).make(),
                trailing: Row(
                  children: [
                    ' 80.00 '.text.maxLines(2).black.bold.size(16).make(),
                    SR.tr.text.maxLines(2).black.bold.size(16).make(),
                  ],
                ).box.height(50).width(80).make(),
              ),
              20.heightBox,
              paymentMethod.tr.text.maxLines(2).black.bold.size(24).make(),
              20.heightBox,
              Container(
                width: 120,
                height: 70,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    mada,
                    width: 80,
                    height: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
