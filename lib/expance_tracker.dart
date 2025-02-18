import 'package:flutter/material.dart';
import 'package:flutter_class/model/expance_model.dart';
import 'package:intl/intl.dart';

class ExpanceTracker extends StatefulWidget {
  const ExpanceTracker({super.key});

  @override
  State<ExpanceTracker> createState() => _ExpanceTrackerState();
}

class _ExpanceTrackerState extends State<ExpanceTracker> {
  final List<ExpanceModel> expanceList = [];
  final List<String> category = ["food", "transport", "entertainment", "Bills"];
  double totalAmount = 0.0;

  void showForm(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    String selectedCategory = category.first;
    DateTime selectedTime = DateTime.now();

    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20,
                right: 16,
                left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  items: category
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category)))
                      .toList(),
                  onChanged: (value) => selectedCategory = value!,
                  decoration: const InputDecoration(labelText: "Category"),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        if (titleController.text.isEmpty ||
                            double.tryParse(amountController.text) == null) {
                        } else {
                          addExpanse(
                              titleController.text,
                              double.parse(amountController.text),
                              selectedTime,
                              selectedCategory);
                          titleController.clear();
                          amountController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Add Expanse")),
                )
              ],
            ),
          );
        });
  }

  void addExpanse(String title, double amount, DateTime time, String category) {
    setState(() {
      expanceList.add(ExpanceModel(
          title: title, amount: amount, time: time, category: category));
      totalAmount += amount;
    });
  }

  void deleteExpance(int index) {
    setState(() {
      totalAmount -= expanceList[index].amount;
      expanceList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expance Tracker"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => showForm(context), icon: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "total \$$totalAmount",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: expanceList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(expanceList[index].hashCode.toString()),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) => deleteExpance(index),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(expanceList[index].category),
                        ),
                        title: Text(expanceList[index].title),
                        subtitle: Text(
                            DateFormat.yMMMd().format(expanceList[index].time)),
                        trailing: Text(
                          expanceList[index].amount.toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
