import 'package:cutree/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Booked extends StatefulWidget {
  final Details details;
  const Booked({super.key, required this.details});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          right: 30,
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(234, 233, 235, 1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Color.fromRGBO(185, 183, 185, 1),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //approved icon
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  top: 35,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(193, 222, 168, 1)),
                      child: Container(
                          margin: EdgeInsets.all(16),
                          child: Icon(
                            Icons.check,
                            color: Color.fromRGBO(59, 89, 48, 1),
                            fill: 1,
                          )),
                    ),
                    Container(
                      width: 15,
                    ),

                    //approved message
                    Text(
                      "Appointment is\nconfirmed!",
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //confirmation code
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 235, 236, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(15),
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                '${widget.details.store['barber-list'][widget.details.barber]['profile-pic']}',
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.details.store['barber-list']
                                      [widget.details.barber]['name'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(widget.details.service[0],
                                    style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rs.${"${widget.details.price}".substring(0, "${widget.details.price}".indexOf(".") + 2)}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              Text(
                                "Rs. ${widget.details.service[1]}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17,
                                    color: Colors.black38),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Text(
                              widget.details.service[0],
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "${widget.details.service[2]} min",
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Text(
                              "Time",
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "${widget.details.toStringSchedule()}",
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Text(
                              "Tip",
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Rs.${"${widget.details.tip}".substring(0, "${widget.details.tip}".indexOf('.') + 2)}",
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "Add to Calender",
                          style: GoogleFonts.roboto(
                              fontSize: 17,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        child: Row(children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 37.2, vertical: 7),
                              child: Center(
                                child: Icon(Icons.today_outlined),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 37.5, vertical: 7),
                              child: Center(
                                child: Icon(Icons.apple),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              print("object");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 37.5, vertical: 7),
                              child: Center(
                                child: Icon(Icons.facebook),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total",
                                    style: GoogleFonts.roboto(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text("Incl. all taxes and fee",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Rs.${"${widget.details.price}".substring(0, "${widget.details.price}".indexOf(".") + 2)}",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ), //first card column
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 235, 236, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhysicalModel(
                      elevation: 12,
                      shadowColor: Colors.black38,
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      child: Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/cutree-c62c6.appspot.com/o/assets%2FmapsWidget.jpg?alt=media&token=59b8d375-586b-40a4-8062-b755b28649ac"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Coimbatore",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "13, Access Street, \nPeelamedu",
                            softWrap: true,
                            style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Get Directions",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(150, 176, 127, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ), // modal column
        ),
      ],
    );
  }
}
