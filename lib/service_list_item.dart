import 'package:flutter/material.dart';

class ServiceTile extends StatefulWidget {
  final bool isSelected;
  final String name;
  final price;
  final VoidCallback onSelect;
  const ServiceTile(
      {super.key,
      required this.name,
      required this.price,
      required this.isSelected,
      required this.onSelect});

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  late Color buttonColor;
  late Color textColor;
  bool isButtonClicked = false;
  @override
  void initState() {
    buttonColor = Colors.white;
    textColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    textColor = widget.isSelected ? Colors.white : Colors.black;
    buttonColor = widget.isSelected ? Colors.black : Colors.white;
    return ListTile(
      title: Text(
        widget.name,
        style: TextStyle(),
      ),
      trailing: OutlinedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(textColor),
            backgroundColor: MaterialStatePropertyAll(buttonColor)),
        onPressed: () {
          widget.onSelect();
          setState(() {
            widget.onSelect;
          });
        },
        child: Text(
          "Rs. ${widget.price}",
        ),
      ),
    );
  }
}
