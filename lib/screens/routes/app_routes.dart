import 'package:quizz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:quizz_app/controllers/question_paper/questions_controller.dart';
import 'package:quizz_app/controllers/zoom_drawer_controller.dart';
import 'package:quizz_app/screens/home/home_screen.dart';
import 'package:quizz_app/screens/introduction/introduction.dart';
import 'package:quizz_app/screens/login/login_screen.dart';
import 'package:quizz_app/screens/question/answer_check_screen.dart';
import 'package:quizz_app/screens/question/questions_screen.dart';
import 'package:quizz_app/screens/question/result_screen.dart';
import 'package:quizz_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:quizz_app/widgets/questions/test_overview_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()), //single slash=1 one
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
    GetPage(
        name: LoginScreen.routeName,
        page: ()=>LoginScreen()
    ),GetPage(
        name: QuestionScreen.routeName,
        page: ()=>QuestionScreen(),
        binding: BindingsBuilder((){
          Get.put<QuestionsController>(QuestionsController());
        })
    ),
    GetPage(
        name: TestOverviewScreen.routeName,
        page: ()=>const TestOverviewScreen()),
    GetPage(
        name: ResultScreen.routeName,
        page: ()=>const ResultScreen()),
    GetPage(
        name: AnswerCheckScreen.routeName,
        page: ()=>const AnswerCheckScreen()),
      ];
}
