import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageFetcher {
  static Future<String> fetchProfilePicURL() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(
          "users/${FirebaseAuth.instance.currentUser!.uid}/profilePic.jpg");
      print("object");
      String downloadURL = await ref.getDownloadURL();
      print(downloadURL);
      return downloadURL;
    } catch (e) {
      return "https://media.istockphoto.com/id/1393750072/vector/flat-white-icon-man-for-web-design-silhouette-flat-illustration-vector-illustration-stock.jpg?s=612x612&w=0&k=20&c=s9hO4SpyvrDIfELozPpiB_WtzQV9KhoMUP9R9gVohoU=";
    }
  }
}
