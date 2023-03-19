import 'package:cutree/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          DarkModeState();
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Container(
              padding: EdgeInsets.all(20),
              child: Text("Choose a service",
                  style: TextStyle(color: Colors.black))),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close_rounded)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
