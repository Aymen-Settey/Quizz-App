import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizz_app/screens/home/home_screen.dart';
import 'package:quizz_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                'This is a study app you can use as you want.If you understand how it works you will be able to scale it. With this you will master flutter and firebase.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: onSurfaceTextColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              AppCircleButton(
                onTap: () => Get.offAndToNamed('/home'),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
