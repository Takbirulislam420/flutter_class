import 'package:flutter/material.dart';

class MybottomNavigationBar extends StatelessWidget {
  const MybottomNavigationBar({super.key});

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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contect"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar("Home", context);
          } else if (index == 1) {
            MySnackBar("Contect", context);
          } else if (index == 2) {
            MySnackBar("Profile", context);
          }
        },
      ),
    );
  }
}
