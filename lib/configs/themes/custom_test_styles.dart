import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';

import 'ui_parameters.dart';

TextStyle cartTitles(context)=>TextStyle(
    color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyText1!.color:Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold
);
const questionTS = TextStyle(fontSize: 16,fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22,fontWeight: FontWeight.w700,
color: onSurfaceTextColor);

const appBarTS = TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: onSurfaceTextColor
);
TextStyle countDownTimerTs()=>TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyText1!.color:Theme.of(Get.context!).primaryColor
);