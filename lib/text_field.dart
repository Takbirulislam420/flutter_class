import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle =
        ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Text field"),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'First Name')),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Last Name')),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address')),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Email i'm hint",
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.blue),
                  hintMaxLines: 1,
                  labelText: "Email i'm label",
                  helperText: "i'm helper text",
                  prefixIcon: const Icon(Icons.mail),
                  suffixIcon: const Icon(Icons.send),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ),
    );
  }
}
