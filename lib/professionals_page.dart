import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/barber_list_tile.dart';
import 'package:cutree/create_appointments.dart';
import 'package:cutree/services_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Professionals extends StatefulWidget {
  final DocumentSnapshot store;

  const Professionals({
    super.key,
    required this.store,
  });

  @override
  State<Professionals> createState() => _ProfessionalsState(store);
}

class _ProfessionalsState extends State<Professionals> {
  late DocumentSnapshot Store;
  _ProfessionalsState(DocumentSnapshot<Object?> store) {
    this.Store = store;
  }
  int selectedBarber = -1;
  bool ifAnySelected = false;
  @override
  Widget build(BuildContext context) {
    final BarberList = Store['barber-list'];

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
                child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 230),
                  itemBuilder: (context, index) {
                    String Name = BarberList[index]['name'];
                    Image Profile = Image.network(
                      BarberList[index]['profile-pic'],
                    );
                    return Container(
                      child: BarberListTile(
                        profilePic: Profile,
                        name: Name,
                        onSelect: () => selectBarber(index),
                        isSelected: selectedBarber == index,
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
                child: Icon(Icons.check, size: 30),
                onPressed: () {
                  if (ifAnySelected) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Booking(store: Store);
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
