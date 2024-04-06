import 'package:cutree/date_and_time_page.dart';
import 'package:cutree/service_list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details.dart';

class Booking extends StatefulWidget {
  final Details details;

  const Booking({
    super.key,
    required this.details,
  });

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int selectedService = -1;
  bool ifAnySelected = false;
  String _name = "";
  double _price = 0.0;
  int _duration = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {}),
      ],
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Choose the service",
                  style: GoogleFonts.roboto(
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
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: widget.details.store['services-list'].length,
                  itemBuilder: (context, index) {
                    _name =
                        widget.details.store['services-list'][index]['name'];
                    _price = widget
                        .details.store['services-list'][index]['price']
                        .toDouble();
                    _duration =
                        widget.details.store['services-list'][index]['time'];

                    return Container(
                      child: ServiceTile(
                        name: _name,
                        onSelect: () => selectService(index),
                        isSelected: selectedService == index,
                        price: _price,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 13,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: Container(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                elevation: 6,
                splashColor: Colors.white54,
                backgroundColor: ifAnySelected ? Colors.black : Colors.grey,
                foregroundColor: Colors.white,
                child: const Icon(Icons.check, size: 30),
                onPressed: () {
                  if (ifAnySelected) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        widget.details.service = [
                          _name,
                          _price,
                          _duration,
                        ];

                        return SchedulePicker(details: widget.details);
                      },
                    ));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectService(int index) {
    setState(() {
      selectedService = index;
      ifAnySelected = true;
    });
  }
}
