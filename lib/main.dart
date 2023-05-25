import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:quizz_app/firebase_options.dart';
import 'package:quizz_app/screens/routes/app_routes.dart';
import 'package:quizz_app/bindings/initial_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  InitialBindings().dependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}





// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
