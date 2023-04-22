import 'package:flutter/material.dart';

import 'details.dart';

class SchedulePicker extends StatefulWidget {
  final Details details;
  const SchedulePicker({super.key, required this.details});

  @override
  State<SchedulePicker> createState() => _SchedulePickerState();
}

class _SchedulePickerState extends State<SchedulePicker> {
  Details _details = Details();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
