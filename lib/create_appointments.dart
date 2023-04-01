import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAppointment {
  CreateAppointment() {
    final user = FirebaseAuth.instance.currentUser!;
    String? emailId = user.email;
    String appointmentId;

    FirebaseFirestore.instance.collection('appointment-list').add({
      'name': 'Kaushik',
      'email': '$emailId',
      'age': 30,
    }).then((value) {
      print('Data added successfully!');
    }).catchError((error) {
      print('Error adding data: $error');
    });
  }
}
