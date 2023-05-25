import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/configs/themes/app_colors.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({Key? key,required this.child,this.addPadding=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context)
        ),
        padding:addPadding?  EdgeInsets.only(
          top: mobileScreenPadding,
          left: mobileScreenPadding,
          right: mobileScreenPadding
        ):EdgeInsets.zero ,
        child: child,
      ),
    );
  }
}
