import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:demoproject/View/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/responsive.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(cursor: "",
              'Welcome to hidoc',
              textStyle:   TextStyle(
                fontSize: Responsive.isDesktop(context)?Get.width/50:Get.width/20,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],
           onFinished: () {
             Get.to(()=>HomeView(),transition: Transition.fadeIn);
           },totalRepeatCount: 1,
          pause: const Duration(milliseconds: 500),


        ),
      ),
    );
  }
}
