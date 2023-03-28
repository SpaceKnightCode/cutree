import 'package:cutree/create_appointments.dart';
import 'package:cutree/services_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main.dart';

late final String shopID;

class Professionals extends StatefulWidget {
  const Professionals({
    super.key,
    required shopID,
  });

  @override
  State<Professionals> createState() => _ProfessionalsState();
}

class _ProfessionalsState extends State<Professionals> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                FloatingActionButton(onPressed: () {
                  CreateAppointment();
                }),
                FloatingActionButton(onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Booking();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var tween = Tween(begin: begin, end: end);
                        var curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeIn,
                        );
                        return SlideTransition(
                          position: tween.animate(curvedAnimation),
                          child: child,
                        );
                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
