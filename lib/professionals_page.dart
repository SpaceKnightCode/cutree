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

  @override
  Widget build(BuildContext context) {
    final BarberList = Store['barber-list'];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          DarkModeState();
        }),
      ],
      child: Stack(children: [
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
                  return BarberListTile(
                    profilePic: Profile,
                    name: Name,
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
