import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CreateAppointment {
  CreateAppointment() {
    FirebaseFirestore.instance.collection('users').add({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'age': 30,
    }).then((value) {
      print('Data added successfully!');
    }).catchError((error) {
      print('Error adding data: $error');
    });
  }
}
