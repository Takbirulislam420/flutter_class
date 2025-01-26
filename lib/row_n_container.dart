import 'package:flutter/material.dart';

class RowAndContainer extends StatelessWidget {
  const RowAndContainer({super.key});

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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Image.network(
                      "https://asadullahbd.github.io/cloneRabbilSir/assets/img/rabbilVai.png")),
              Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Image.network(
                      "https://asadullahbd.github.io/cloneRabbilSir/assets/img/rabbilVai.png")),
              Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Image.network(
                      "https://asadullahbd.github.io/cloneRabbilSir/assets/img/rabbilVai.png")),
              Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Image.network(
                      "https://asadullahbd.github.io/cloneRabbilSir/assets/img/rabbilVai.png")),
            ],
          ),
        ));
  }
}
