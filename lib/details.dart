import 'package:cloud_firestore/cloud_firestore.dart';

class Details {
  late DocumentSnapshot _store;
  late String _service;
  late DateTime _schedule;
  late String _barber;
  late double _price;

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  DocumentSnapshot get store => _store;

  set store(DocumentSnapshot value) {
    _store = value;
  }

  String get barber => _barber;

  set barber(String value) {
    _barber = value;
  }

  String get service => _service;

  set service(String value) {
    _service = value;
  }

  DateTime get schedule => _schedule;

  set schedule(DateTime value) {
    _schedule = value;
  }
}
