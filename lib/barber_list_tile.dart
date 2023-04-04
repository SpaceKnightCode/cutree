import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberListTile extends StatefulWidget {
  final Image profilePic;
  final bool isSelected;
  final String name;
  final VoidCallback onSelect;
  const BarberListTile(
      {super.key,
      required this.profilePic,
      required this.name,
      required this.isSelected,
      required this.onSelect});

  @override
  State<BarberListTile> createState() => _BarberListTileState();
}

class _BarberListTileState extends State<BarberListTile> {
  late Color tileColor;
  late Color textColor;
  @override
  Widget build(BuildContext context) {
    tileColor = widget.isSelected ? Colors.black : Colors.white;
    textColor = widget.isSelected ? Colors.white : Colors.black;
    return InkWell(
      onTap: widget.onSelect,
      child: Container(
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
                          image: widget.profilePic.image,
                          fit: BoxFit.contain,
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    widget.name,
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
                    child: Text('About ' + widget.name),
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
