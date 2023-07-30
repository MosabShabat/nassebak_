import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../consts/conste.dart';
import '../../../local/my_local_controller.dart';
import '../../api/api_controller.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/singup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String _selectedItem = 'English';

  @override
  Widget build(BuildContext context) {
    MyLocalController MLC = Get.find();
    var controller = Get.put(ApiController());

    return Scaffold(
        backgroundColor: whiteColor,
        body: FutureBuilder(
          future: controller.getInit(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null &&
                snapshot.data!.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return Container(
                    width: context.screenWidth,
                    height: context.screenHeight - 34,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        AllOnboarding,
                      ),
                      fit: BoxFit.fill,
                    )),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child:
                                        Skip.tr.text.bold.size(20).black.make(),
                                  ),
                                  DropdownButton<String>(
                                    elevation: 0,
                                    underline: SizedBox(),
                                    value: _selectedItem,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedItem = newValue!;
                                      });
                                    },
                                    items: <String>['English', 'العربية']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: value.text.bold
                                            .size(20)
                                            .black
                                            .make(),
                                        onTap: () async {
                                          if (value == 'English') {
                                            MLC.changeLang('en');
                                          } else if (value == 'العربية') {
                                            MLC.changeLang('ar');
                                          }
                                        },
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                              SvgPicture.asset(
                                BGA,
                                width: context.screenWidth,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: context.screenHeight / 4.32,
                          child: SvgPicture.asset(
                            Ov,
                            width: context.screenWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //   Text()
                              '${data.title}'.text.white.bold.size(22).make(),
                              10.heightBox,
                              '${data.description}'.text.white.size(14).make(),
                              10.heightBox,
                              //description
                              CustomButton(
                                text: RegisterAnewAccount.tr,
                                onPressed: () {
                                  Get.to(() => const SingUpScreen(),
                                      transition: Transition.downToUp);
                                },
                                textColor: yalowColor,
                                backgroundColor: whiteColor,
                                borderColor: whiteColor,
                              ),
                              10.heightBox,
                              CustomButton(
                                text: SignIn.tr,
                                onPressed: () {
                                  Get.to(() => const LoginScreen(),
                                      transition: Transition.downToUp);
                                },
                                textColor: yalowColor,
                                backgroundColor: blackColor,
                                borderColor: yalowColor,
                              ),
                              SizedBox(
                                height: context.screenHeight / 25,
                              )
                            ],
                          )
                              .box
                              .width(context.screenWidth)
                              .padding(EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ))
                              .make(),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("no data found"),
              );
            }
          },
        ));
  }
}
