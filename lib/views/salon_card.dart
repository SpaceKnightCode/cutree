import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/details.dart';
import 'package:cutree/professionals_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalonCard extends StatefulWidget {
  final DocumentSnapshot store;
  const SalonCard({
    super.key,
    required this.store,
  });

  @override
  State<SalonCard> createState() => _SalonCardState();
}

class _SalonCardState extends State<SalonCard> {
  late Details _details = Details();

  @override
  Widget build(BuildContext context) {
    String shopName = widget.store['name'];
    Widget logo = Image.network(
      widget.store['logo'],
      fit: BoxFit.fill,
    );
    Widget cover = Image.network(
      widget.store['cover'],
      fit: BoxFit.fill,
    );
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
                          child: ClipRRect(child: cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      height: 60,
                      width: 60,
                      child: logo,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              shopName,
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
                  ],
                ),
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
                            MaterialPageRoute(builder: (context) {
                              _details.store = widget.store;
                              return Professionals(details: _details);
                            }),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.white10),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          backgroundColor: const MaterialStatePropertyAll(
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
