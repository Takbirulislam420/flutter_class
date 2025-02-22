import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Map<String, dynamic>> tasks = [];
  bool showActivetask = true;

  void showTaskDialog({int? index}) {
    TextEditingController textEditingController = TextEditingController(
      text: index != null ? tasks[index]["task"] : " ",
    );
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(index != null ? "Edit task" : "Add Task"),
              content: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "Enter Task"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: () {
                      if (textEditingController.text.trim().isNotEmpty) {
                        if (index == null) {
                          addTask(textEditingController.text);
                        } else {
                          editTask(index, textEditingController.text);
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Save"))
              ],
            ));
  }

  void addTask(String task) {
    setState(() {
      tasks.add({"task": task, "complated": false});
    });
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['complated'] = !tasks[index]['complated'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String updateTask) {
    setState(() {
      tasks[index]["task"] = updateTask;
    });
  }

  //below this line i con't understand
  int get activeCount => tasks.where((task) => !task["complated"]).length;
  int get complatedCount => tasks.where((task) => task["complated"]).length;

  @override
  Widget build(BuildContext context) {
    //below this line i con't understand
    List<Map<String, dynamic>> filtertask =
        tasks.where((task) => task["complated"] != showActivetask).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showActivetask = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Active",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        activeCount.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showActivetask = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Complated",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        complatedCount.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filtertask.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(UniqueKey().toString()),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        toggleTaskStatus(index);
                      } else {
                        deleteTask(index);
                      }
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          filtertask[index]["task"],
                          style: TextStyle(
                            fontSize: 20,
                            decoration: filtertask[index]["complated"]
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle:
                            Text(filtertask[index]["complated"].toString()),
                        leading: Checkbox(
                            shape: CircleBorder(),
                            value: filtertask[index]["complated"],
                            onChanged: (value) => toggleTaskStatus(index)),
                        trailing: IconButton(
                            onPressed: () {
                              showTaskDialog(index: index);
                            },
                            icon: Icon(Icons.edit)),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTaskDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
