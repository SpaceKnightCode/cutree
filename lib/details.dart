import 'package:cloud_firestore/cloud_firestore.dart';

class Details {
  late String _AppointmentID;
  late String _userId;

  late DocumentSnapshot _store;
  late List _service;
  late DateTime _schedule;
  late int _barber;
  late double _price;
  late int _Time;
  late double _tip;

  void setSchedule(int year, int month, int day, String time) {
    int splitterIndex = time.indexOf(":");
    int hour = int.parse(time.substring(0, splitterIndex));
    int min = int.parse(time.substring(splitterIndex + 1, splitterIndex + 3));
    if (time.contains("pm")) {
      hour += 12;
    }
    _schedule = DateTime(year, month, day, hour, min);
  }

  String toStringSchedule() {
    String Time = "";
    List weekdays = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"];
    List months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];
    if (_schedule.hour > 12) {
      Time = "${_schedule.hour - 12}:${_schedule.minute}pm";
    } else {
      Time = "${_schedule.hour}:${_schedule.minute}am";
    }
    return "${months[_schedule.month]} ${_schedule.day} at $Time";
  }

  DateTime getSchedule() => _schedule;
  int get Time => _Time;

  set Time(int value) {
    _Time = value;
  }

  String get AppointmentID => _AppointmentID;

  set AppointmentID(String value) {
    _AppointmentID = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  double get tip => _tip;

  set tip(double value) {
    _tip = value;
  }

  DocumentSnapshot get store => _store;

  set store(DocumentSnapshot value) {
    _store = value;
  }

  int get barber => _barber;

  set barber(int value) {
    _barber = value;
  }

  List get service => _service;

  set service(List value) {
    _service = value;
  }

  DateTime get schedule => _schedule;

  set schedule(DateTime value) {
    _schedule = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }
}
