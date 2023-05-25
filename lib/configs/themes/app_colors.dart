import 'package:quizz_app/configs/themes/app_light_theme.dart';
import 'package:quizz_app/configs/themes/app_dark_theme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/painting/gradient.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnsweredColor = Color(0xFF2a3c65);


const Color onSurfaceTextColor = Colors.white;
const primaryDarkColorDark = Color(0xFF2e3c62);
const primayColorDark = Color(0xFF99ace1);
const primaryLightColorLight = Color(0xFF3ac3cb);
const primayColorLight = Color(0xFFf85187);
const mainGradientLight = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryLightColorLight,
    primayColorLight,
  ],
);
const mainGradientDark = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryDarkColorDark,
    primayColorDark,
  ],
);
LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
 Color customScaffoldColor(BuildContext context)=>
     UIParameters.isDarkMode()?const Color(0xFF2e3c62)
         :const Color.fromARGB(255, 240, 237, 255);

 Color answerSelectedColor()=> UIParameters.isDarkMode() ?Theme.of(Get.context!).cardColor.withOpacity(0.5):Theme.of(Get.context!).primaryColor;

 Color answerBorderColor()=>UIParameters.isDarkMode()?const Color.fromARGB(255, 20, 46, 158):const Color.fromARGB(255, 221, 221, 221);