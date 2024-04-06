import 'dart:io';
import 'image_fetcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<String>? profilePicURLFuture;

  @override
  void initState() {
    super.initState();
    profilePicURLFuture = ImageFetcher.fetchProfilePicURL();
  }

  pickUploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (image == null) return;
    print("choosen");
    Reference ref = FirebaseStorage.instance.ref().child(
        "users/${FirebaseAuth.instance.currentUser!.uid}/profilePic.jpg");

    ref.putFile(File(image.path));
    print("uploaded");
    ref.getDownloadURL().then((value) {
      setState(() {
        profilePicURLFuture = Future.value(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: pickUploadImage),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: FutureBuilder<String>(
            future: profilePicURLFuture,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                print("has photo");
                return Container(
                    height: 100,
                    width: 100,
                    child: Image.network(snapshot.data!));
              } else {
                return Icon(Icons.person_outline);
              }
            },
          ),
        ),
      ),
    );
  }
}
