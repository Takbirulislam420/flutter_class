import 'package:flutter/material.dart';
import 'package:flutter_class/alert_dialog.dart';
import 'package:flutter_class/list_view.dart';
import 'package:flutter_class/text_field.dart';

class MyTapView extends StatelessWidget {
  const MyTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Takbirul islam"),
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              icon: Icon(Icons.camera),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
          ]),
        ),
        body: TabBarView(children: [
          const MyTextField(),
          const MyAlertDialog(),
          My_ListView(),
          const MyTextField(),
          const MyAlertDialog(),
          My_ListView(),
          const MyTextField(),
          const MyAlertDialog(),
        ]),
      ),
    );
  }
}
