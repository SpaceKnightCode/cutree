import 'package:cutree/login_screen.dart';
import 'package:cutree/register_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(useMaterial3: true),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 500,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/logo/logo-white.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Text(
                  "Book your style, stress free",
                  textScaleFactor: 2.7,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweatherSans(
                    fontWeight: FontWeight.w800,
                    textStyle: const TextStyle(
                        color: Colors.white, wordSpacing: 1.2, height: 1.4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 30),
              child: Center(
                child: Text(
                  "Join our community of beauty lovers and book your next appointment with ease and convenience",
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    textStyle: const TextStyle(
                        color: Colors.white54, wordSpacing: 1.2, height: 1.1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 20),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 130,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          overlayColor: MaterialStatePropertyAll(Colors.grey)),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    padding: EdgeInsets.only(left: 25),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          overlayColor: MaterialStatePropertyAll(Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5),
                  height: 45,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        side: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                      child: Icon(
                        color: Colors.blue,
                        Icons.facebook,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 5),
                  height: 45,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        side: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                      child: Icon(
                        color: Colors.red,
                        Icons.account_circle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        side: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                      child: Icon(
                        color: Colors.white,
                        Icons.apple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
