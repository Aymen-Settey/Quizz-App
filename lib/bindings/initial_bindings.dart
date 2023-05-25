import 'dart:ffi';
import 'package:quizz_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:quizz_app/controllers/theme_controller.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
