import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

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
        centerTitle: true,
        titleSpacing: 10,
        //toolbarHeight: 60,
        //toolbarOpacity: 1,
        //titleTextStyle: ,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                MySnackBar(" i'm search", context);
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                MySnackBar(" i'm setting", context);
              },
              icon: const Icon(Icons.settings)),
        ], // Here is action button
        leading: IconButton(
            onPressed: () {
              MySnackBar(" i'm Menu", context);
            },
            icon: const Icon(Icons.menu)), // Here is leading button
      ),
    );
  }
}
