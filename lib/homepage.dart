import 'package:cutree/colors/darkmode_colors.dart';
import 'package:cutree/colors/lightmode_colors.dart';
import 'package:cutree/login_screen.dart';
import 'package:cutree/services_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const CutreeApp());
}

class CutreeApp extends StatelessWidget {
  const CutreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(useMaterial3: true),
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
  final List<String> images = [
    'assets/images/salon_images/salon_1.jpg',
    '',
    '',
    '',
  ];

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
        padding: const EdgeInsets.fromLTRB(0, 90, 0, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu_rounded),
                iconSize: 35,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
              child:
                  const Text('Welcome to Cutree, find a barber shop near you',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        wordSpacing: 0.1,
                      ),
                      textScaleFactor: 2),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: OutlinedButton(
                      style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
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
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Card(
                      color: LightmodeColors.foreground,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              height: 160,
                              child: FittedBox(
                                child: Image.asset(
                                    'assets/images/salon_images/salon_1.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 45,
                                    child: Image.asset(
                                        "assets/images/haircut.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: const [
                                        Text("Black barber shop\nCooper Square",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Center(
                              widthFactor: 1.25,
                              child: NeumorphicButton(
                                style: NeumorphicStyle(color: Colors.black),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 5),
                                    child: const Text(
                                      "Book Now",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(builder: (context) {
                                        return const Booking();
                                      })));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
