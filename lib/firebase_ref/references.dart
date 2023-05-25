import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
Reference get firebaseStorage => FirebaseStorage.instance.ref();

final userRF = fireStore.collection("users");

final questionPaperRF = fireStore.collection('questionPapers');

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);

