import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  // ignore: non_constant_identifier_names
  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // ignore: non_constant_identifier_names
  OurAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: const Text("Alert !"),
            content: const Text("Do you want to delete"),
            actions: [
              TextButton(
                  onPressed: () {
                    MySnackBar("Delete Success", context);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("No")),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("click me"),
            onPressed: () {
              OurAlertDialog(context);
            },
          ),
        ));
  }
}
