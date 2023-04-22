import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/confirmationPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'details.dart';

class SchedulePicker extends StatefulWidget {
  final Details details;
  const SchedulePicker({super.key, required this.details});

  @override
  State<SchedulePicker> createState() => _SchedulePickerState();
}

class _SchedulePickerState extends State<SchedulePicker> {
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
  Details _details = Details();
  late DocumentSnapshot store;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late int _selectedTime = -1;
  late var AvailableTimes = [];
  late bool _ifAnySelected;
  @override
  void initState() {
    super.initState();
    store = widget.details.store;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    AvailableTimes = widget.details.store['available-times'];
    _ifAnySelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Choose a time",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w800,
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: TableCalendar(
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(
                        () {
                          _selectedDay = selectedDay;
                        },
                      );
                    },
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2023, 05, 22),
                    currentDay: DateTime.now(),
                    calendarFormat: CalendarFormat.twoWeeks,
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    calendarStyle: CalendarStyle(
                      weekendTextStyle:
                          GoogleFonts.roboto(fontWeight: FontWeight.w600),
                      defaultTextStyle:
                          GoogleFonts.roboto(fontWeight: FontWeight.w600),
                      todayTextStyle: const TextStyle(color: Colors.blue),
                      todayDecoration: const BoxDecoration(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Text("All Available Times"),
                      Expanded(child: Container()),
                      Text(
                        "${weekdays[_selectedDay.weekday]}, ${months[_selectedDay.month]}. ${_selectedDay.day}",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisExtent: 55),
                    itemCount: AvailableTimes.length,
                    itemBuilder: (context, index) {
                      final number = AvailableTimes[index];
                      bool isSelected = false;

                      if (index == _selectedTime) {
                        isSelected = true;
                      }
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(15)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            setState(() {
                              isSelected = true;
                              _selectedTime = index;
                              _ifAnySelected = true;
                            });
                          },
                          child: Center(
                            child: Text(
                              "$number",
                              style: GoogleFonts.roboto(
                                  color:
                                      isSelected ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 13,
              left: MediaQuery.of(context).size.width / 2 - 38,
              child: Container(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  elevation: 6,
                  splashColor: Colors.white54,
                  backgroundColor: _ifAnySelected ? Colors.black : Colors.grey,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check, size: 30),
                  onPressed: () {
                    if (_ifAnySelected) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          widget.details.setSchedule(
                              _selectedDay.year,
                              _selectedDay.month,
                              _selectedDay.day,
                              AvailableTimes[_selectedTime]);
                          return ConfirmationScreen(
                            details: widget.details,
                          );
                        },
                      ));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
