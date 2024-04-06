import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutree/appointment_booked.dart';
import 'package:cutree/services_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'details.dart';

class ConfirmationScreen extends StatefulWidget {
  final Details details;
  const ConfirmationScreen({super.key, required this.details});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  CollectionReference appointmentRef =
      FirebaseFirestore.instance.collection('appointment-list');
  Uuid id = const Uuid();
  int selectedTip = 4;
  double tip = 0;
  bool _isLoading = false;
  double tax = 0;
  List tipList = [
    10,
    15,
    20,
    25,
    0,
  ];
  @override
  void initState() {
    super.initState();
    tax = widget.details.service[2] * 1.8;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    "Payement information",
                    style: GoogleFonts.roboto(
                        fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black26,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Add a tip",
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    mainAxisExtent: 45,
                    crossAxisSpacing: 8),
                itemCount: 6,
                itemBuilder: (context, index) {
                  bool _isSelected = selectedTip == index;
                  if (index < 5) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        setState(() {
                          selectedTip = index;
                          if (tipList[index] != 0) {
                            tip = widget.details.service[1] /
                                tipList[index].toDouble();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            color: _isSelected ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            tipList[index] != 0 ? "${tipList[index]}%" : "None",
                            style: GoogleFonts.roboto(
                                color:
                                    _isSelected ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text("Custom"),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),

            //total fee
            Row(
              children: [
                Text(
                  "Total price",
                  style: GoogleFonts.roboto(
                      fontSize: 17.5,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Rs.${"${widget.details.service[1] + tip + tax}".substring(0, "${widget.details.service[1] + tip}".indexOf(".") + 2)}",
                  style: GoogleFonts.roboto(
                      fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            //service fee
            Row(
              children: [
                Text(
                  "${widget.details.service[0]}",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Rs.${"${widget.details.service[1]}".substring(0, "${widget.details.service[1]}".indexOf(".") + 2)}",
                  style: GoogleFonts.roboto(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Tip: ${tipList[selectedTip]}%",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Rs.${"${tip}".substring(0, "${tip}".indexOf(".") + 2)}",
                  style: GoogleFonts.roboto(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ],
            ),

            //taxes and fee
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Taxes: 18%",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Rs.${"${tax}".substring(0, "${tax}".indexOf(".") + 2)}",
                  style: GoogleFonts.roboto(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //confirm order
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    _handleButtonPressed();
                  },
                  child: const Text("Confirm Order"),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  void _handleButtonPressed() async {
    var data = {
      'appointment-id': '${id.v1().substring(24, 36)}',
      'shop-id': '${widget.details.store['id']}',
      'customer-id': '${FirebaseAuth.instance.currentUser!.email}',
      'schedule': Timestamp.fromDate(widget.details.schedule),
      'service': '${widget.details.service[0]}',
      'total-price': widget.details.service[1] + tip + tax,
      'service-price': widget.details.service[1],
      'tax': tax,
      'tip': tip,
      'duration': widget.details.service[2],
      'barber-name': widget.details.store['barber-list'][widget.details.barber],
    };

    // Set the isLoading flag to true
    setState(() {
      _isLoading = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: Color.fromRGBO(191, 223, 166, 1),
        ));
      }),
    );
    await appointmentRef.add(data);
    widget.details.tip = tip;
    Navigator.pop(context);
    print(data.toString());
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          widget.details.price = widget.details.service[1] + tip + tax;
          return Booked(details: widget.details);
        }).whenComplete(() {
      Navigator.popUntil(context, (route) => route.isFirst);
    });

    // Set the isLoading flag back to false
    setState(() {
      _isLoading = false;
    });
  }
}
