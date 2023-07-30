import 'package:flutter_svg/svg.dart';
import '../../../consts/conste.dart';

class RegisterThePackageScreen extends StatelessWidget {
  const RegisterThePackageScreen({super.key});

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
              GoldenPackage.tr.text.bold.black.size(30).make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        ticket,
                        width: 70,
                        height: 40,
                      ),
                      '10'.text.bold.black.size(24).make(),
                      Ticket.tr.text.bold.black.size(24).make(),
                    ],
                  ).box.width(150).make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Currency,
                        width: 70,
                        height: 40,
                      ),
                      '50'.text.bold.black.size(24).make(),
                      Point.tr.text.bold.black.size(24).make(),
                    ],
                  ).box.width(150).make(),
                ],
              ),
              20.heightBox,
              PurchaseDetails.tr.text.black.bold.size(20).make(),
              20.heightBox,
              ListTile(
                  leading: operationNumber.tr.text.black.medium.size(18).make(),
                  trailing:
                      '#43234'.text.maxLines(2).black.bold.size(16).make()),
              ListTile(
                  leading: Date.tr.text.black.medium.size(18).make(),
                  trailing:
                      '25/05/2023'.text.maxLines(2).black.bold.size(16).make()),
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
