import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quizz_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController{
  final  zoomDrawerController= ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();

  }
  void toogleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }
  void signOut(){
    Get.find<AuthController>().signOut();

  }
  void SignIn(){

  }
  void website(){
    _launch("https://www.google.com");

  }
  void facebook(){
    _launch("https://www.google.com");

  }

  void email(){
    final Uri emailLauncher = Uri(
      scheme: 'mailto',
      path: 'info@dbestech.com'
    );
    _launch(emailLauncher.toString());
  }
  Future<void>_launch(String url)async{
    if(!await launch(url)){
      throw 'could not launch $url';
    }
  }
}