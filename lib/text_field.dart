import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Text field"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Email i'm hint",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                  hintMaxLines: 1,
                  labelText: "Email i'm label",
                  helperText: "i'm helper text",
                  prefixIcon: Icon(Icons.mail),
                  suffixIcon: Icon(Icons.send),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ),
    );
  }
}
