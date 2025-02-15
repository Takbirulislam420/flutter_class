import 'package:flutter/material.dart';
import 'package:flutter_class/model/expance_model.dart';

class ExpanceTracker extends StatefulWidget {
  const ExpanceTracker({super.key});

  @override
  State<ExpanceTracker> createState() => _ExpanceTrackerState();
}

class _ExpanceTrackerState extends State<ExpanceTracker> {
  final List<ExpanceModel> expanceList = [];
  final List<String> category = ["food", "transport", "entertainment", "Bills"];
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expance Tracker"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }
}
