import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/images.dart';
import '../home/screens/home_screen.dart';
import '../onboarding/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();

    changeScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  changeScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      GetStorage().read(
                'token',
              ) ==
              null
          ? Get.offAll(
              () => const OnboardingScreen(),
              transition: Transition.fade,
            )
          : Get.offAll(
              () => HomeScreen(),
              transition: Transition.fade,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(initImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            SvgPicture.asset(
              BGB,
              width: context.screenWidth,
            ).box.alignBottomCenter.make(),
            Positioned(
              bottom: 10,
              right: context.screenWidth / 3,
              left: context.screenWidth / 3,
              child: SlideTransition(
                position: _animation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(logoImage),
                    const SizedBox(height: 10),
                    SvgPicture.asset(textLogoImage),
                    Column(
                      children: [
                        50.heightBox,
                      ],
                    ).box.roundedSM.shadowSm.make(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
