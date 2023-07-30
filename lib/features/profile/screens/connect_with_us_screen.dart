import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';

class ConnectWithUsScreen extends StatefulWidget {
  const ConnectWithUsScreen({super.key});

  @override
  State<ConnectWithUsScreen> createState() => _ConnectWithUsScreenState();
}

class _ConnectWithUsScreenState extends State<ConnectWithUsScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _fullNameTextController;
  late TextEditingController _messageAddressTextController;
  late TextEditingController _messageTextController;
  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _fullNameTextController = TextEditingController();
    _messageAddressTextController = TextEditingController();
    _messageTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _fullNameTextController.dispose();
    _messageAddressTextController.dispose();
    _messageTextController.dispose();

    super.dispose();
  }

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
              ConnectWithUs.tr.text.bold.black.size(30).make(),
              20.heightBox,
              FullName.tr.text.medium.size(20).black.make(),
              20.heightBox,
              MyTextField(
                readOnly: false,
                obscureText: false,
                controller: _fullNameTextController,
                keyboardType: TextInputType.text,
                hintText: FullName.tr,
              ),
              20.heightBox,
              Email.tr.text.medium.size(20).black.make(),
              20.heightBox,
              MyTextField(
                readOnly: false,
                obscureText: false,
                controller: _emailTextController,
                keyboardType: TextInputType.text,
                hintText: Email.tr,
              ),
              20.heightBox,
              title.tr.text.medium.size(20).black.make(),
              20.heightBox,
              MyTextField(
                readOnly: false,
                obscureText: false,
                controller: _messageAddressTextController,
                keyboardType: TextInputType.text,
                hintText: title.tr,
              ),
              20.heightBox,
              theMessage.tr.text.medium.size(20).black.make(),
              20.heightBox,
              MyTextField(
                readOnly: false,
                obscureText: false,
                controller: _messageTextController,
                keyboardType: TextInputType.text,
                hintText: theMessage.tr,
                maxLines: 7,
              ),
              20.heightBox,
              CustomButton(
                backgroundColor: mainColor,
                text: send.tr,
                textColor: whiteColor,
                borderColor: mainColor,
                onPressed: () {},
              ),
              20.heightBox,
              customersService.tr.text.bold.size(24).black.make(),
              20.heightBox,
              ListTile(
                leading: '+966555589080'.text.bold.black.size(14).make(),
                trailing: SvgPicture.asset(Calling),
              ),
              20.heightBox,
              ListTile(
                leading: '+966555589080'.text.bold.black.size(14).make(),
                trailing: SvgPicture.asset(Calling),
              ),
              20.heightBox,
              ListTile(
                leading: 'info@naseebk.com'.text.bold.black.size(14).make(),
                trailing: CircleAvatar(
                  backgroundColor: lightColor,
                  radius: 20,
                  child: Center(
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                    ),
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
