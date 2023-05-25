import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quizz_app/firebase_ref/references.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      print(imgUrl);
      return imgUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
