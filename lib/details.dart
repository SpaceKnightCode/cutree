import 'package:cloud_firestore/cloud_firestore.dart';

class Details {
  late DocumentSnapshot _store;
  late String _service;
  late DateTime _schedule;
  late String _barber;
  late double _price;
  late int _Time;

  void setSchedule(int year, int month, int day, String time) {
    int splitterIndex = time.indexOf(":");
    int hour = int.parse(time.substring(0, splitterIndex));
    int min = int.parse(time.substring(splitterIndex + 1, splitterIndex + 3));
    if (time.contains("pm")) {
      hour += 12;
    }
    _schedule = DateTime(year, month, day, hour, min);
  }

  DateTime getSchedule() => _schedule;
  int get Time => _Time;

  set Time(int value) {
    _Time = value;
  }

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
