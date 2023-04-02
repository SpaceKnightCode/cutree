import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberListTile extends StatefulWidget {
  final Image profilePic;
  final String name;
  const BarberListTile(
      {super.key, required this.profilePic, required this.name});

  @override
  State<BarberListTile> createState() => _BarberListTileState(profilePic, name);
}

class _BarberListTileState extends State<BarberListTile> {
  late Image ProfilePic;
  late String Name;
  bool isSelected = false;
  _BarberListTileState(Image profilePic, String name) {
    ProfilePic = profilePic;
    Name = name;
  }
  Color tileColor = Colors.white;
  Color textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
              tileColor = isSelected ? Colors.black : Colors.white;
              textColor = isSelected ? Colors.white : Colors.black;
            });
          },
          child: GridTile(
            child: Container(
              padding: EdgeInsets.all(7.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Image(
                          image: ProfilePic.image,
                          fit: BoxFit.contain,
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    Name,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    Name,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                    ),
                  ),
                  Divider(),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(textColor)),
                    onPressed: () {},
                    child: Text('About $Name'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
