import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  // ignore: non_constant_identifier_names
  MySnackBar(Message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(Message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("hello world"),
            backgroundColor: Colors.amber,
            centerTitle: true),
        body: Container(
            height: 250,
            width: 250,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(50, 40, 40, 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 3)),
            child: Image.network(
                "https://asadullahbd.github.io/cloneRabbilSir/assets/img/rabbilVai.png")));
  }
}
