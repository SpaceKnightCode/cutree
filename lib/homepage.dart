import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/profile.dart';
import 'package:cutree/views/salon_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details.dart';

class CutreeApp extends StatefulWidget {
  CutreeApp({super.key});

  @override
  State<CutreeApp> createState() => _CutreeAppState();
}

class _CutreeAppState extends State<CutreeApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(useMaterial3: true),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final user = FirebaseAuth.instance.currentUser;
  static final email = user!.email.toString();
  Details details = Details();
  String url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Welcome"),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL.toString()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Appointments'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded),
                  iconSize: 35,
                ),
              ),
              const SizedBox(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: OutlinedButton(
                        style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          iconSize: MaterialStatePropertyAll(15),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin),
                            const Text("nearby")
                          ],
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
                    if (snapshot.hasData) {
                      int _itemCount = snapshot.data!.docs.length;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _itemCount,
                        itemBuilder: (context, index) {
                          details.store = snapshot.data!.docs[index];

                          return SalonCard(
                            details: details,
                            store: details.store,
                          );
                        },
                      );
                    } else {
                      return const Text("No data found.");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
