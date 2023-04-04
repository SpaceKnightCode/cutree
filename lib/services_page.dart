import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/service_list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Booking extends StatefulWidget {
  final DocumentSnapshot store;

  const Booking({
    super.key,
    required this.store,
  });

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int selectedBarber = -1;
  bool ifAnySelected = false;
  @override
  Widget build(BuildContext context) {
    final BarberList = widget.store['barber-list'];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          DarkModeState();
        }),
      ],
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Choose a Barber",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded)),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ServiceTile(
                          name: widget.store['services-list'][index]
                              ['service-name'],
                          onSelect: () => selectBarber(index),
                          isSelected: selectedBarber == index,
                          price: widget.store['services-list'][index]['price']),
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
                child: Icon(Icons.check, size: 30),
                onPressed: () {
                  if (ifAnySelected) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Container();
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

  void selectBarber(int index) {
    setState(() {
      selectedBarber = index;
      ifAnySelected = true;
      print(index);
    });
  }
}
