import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quizz_app/controllers/auth_controller.dart';
import 'package:quizz_app/firebase_ref/references.dart';
import 'package:quizz_app/models/question_paper_model.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';
import 'package:quizz_app/screens/question/questions_screen.dart';
import '../../app_logger.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imageUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imageUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain) {
        Get.back();
        Get.toNamed(QuestionScreen.routeName,arguments: paper,preventDuplicates: false);

      }else{

        Get.toNamed(QuestionScreen.routeName,arguments: paper);
      }
      }else{

        _authController.showLoginAlertDialogue();
      }
    }
  }

