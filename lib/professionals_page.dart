import 'package:cloud_firestore/cloud_firestore.dart';
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

    print(Store.id);
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
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    String name = BarberList[index]['name'];
                    Widget Profile =
                        Image.network(BarberList[index]['profile-pic']);
                    return ListTile(
                      leading: Profile,
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}
