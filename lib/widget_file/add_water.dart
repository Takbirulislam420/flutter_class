import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddWater extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final amount;
  IconData? icon;
  final VoidCallback onclick;
  AddWater({super.key, required this.amount, this.icon, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: onclick,
          label: Text("+ $amount ml"),
          icon: Icon(
            icon ?? Icons.water_drop,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
