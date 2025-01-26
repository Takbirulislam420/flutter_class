import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key});

  // ignore: non_constant_identifier_names
  MySnackBar(context, Message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(Message)));
  }

  final ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                MySnackBar("I am Text Button", context);
              },
              child: const Text('Text Button')),
          ElevatedButton(
            onPressed: () {
              MySnackBar("I am Elevated Button", context);
            },
            style: buttonStyle,
            child: const Text('Elevated Button'),
          ),
          OutlinedButton(
              onPressed: () {
                MySnackBar("I am Outline Button", context);
              },
              child: const Text('Outline Button')),
        ],
      ),
    );
  }
}
