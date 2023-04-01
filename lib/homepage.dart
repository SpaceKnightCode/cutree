import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/colors/darkmode_colors.dart';
import 'package:cutree/colors/lightmode_colors.dart';
import 'package:cutree/login_screen.dart';
import 'package:cutree/services_page.dart';
import 'package:cutree/views/salon_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart' show MaterialApp, ThemeData;
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/material.dart' show useMaterial3;
import 'package:google_fonts/google_fonts.dart';

class CutreeApp extends StatelessWidget {
  const CutreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  static bool isDarkMode = brightness == Brightness.dark;
  static final user = FirebaseAuth.instance.currentUser;
  static final username = user!.displayName.toString();
  static final email = user!.email.toString();

  Color cardColor =
      isDarkMode ? DarkmodeColors.foreground : LightmodeColors.foreground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL.toString()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_rounded),
                  iconSize: 35,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                        'Welcome to Cutree, find a barber shop near you.',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.1,
                            height: 1.1),
                        textScaleFactor: 2.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: OutlinedButton(
                        style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          iconSize: MaterialStatePropertyAll(15),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [Icon(Icons.location_pin), Text("nearby")],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                        iconSize: MaterialStatePropertyAll(15),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [Icon(Icons.search), Text("search")],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 330,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('store-list')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot Store = snapshot.data!.docs[index];

                            return SalonCard(
                              store: Store,
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
