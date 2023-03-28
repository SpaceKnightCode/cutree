import 'package:cutree/professionals_page.dart';
import 'package:cutree/services_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalonCard extends StatefulWidget {
  const SalonCard({super.key});

  @override
  State<SalonCard> createState() => _SalonCardState();
}

class _SalonCardState extends State<SalonCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(22),
      child: Card(
        child: Container(
          color: Colors.grey.shade200,
          height: 300,
          width: 320,
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 2.1,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/images/salon_images/salon_1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10, top: 10),
                        height: 60,
                        child: Image.asset('assets/images/logo/logo-color.png'),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: 230,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Black Men\'s salon and beauty',
                                textScaleFactor: 1.1,
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '12th avenue, king street, NY',
                                textScaleFactor: 0.9,
                                style: GoogleFonts.actor(
                                    textStyle:
                                        TextStyle(color: Colors.grey.shade700)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Professionals(
                                      shopID: "shop1",
                                    )),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.white10),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(0, 132, 255, 1),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: const Text("Book now"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
