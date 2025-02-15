import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildButton extends StatelessWidget {
  String text;
  Color? color;
  final VoidCallback onClick;

  BuildButton(
      {super.key, required this.text, this.color, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
                backgroundColor: color ?? Colors.grey[850],
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            )),
      ),
    );
  }
}
