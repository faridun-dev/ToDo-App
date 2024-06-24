import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_project/data/database.dart';
import 'package:todo_app_project/utils/dialog_box.dart';
import 'package:todo_app_project/utils/task_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database db = Database();
  final _dataBox = Hive.box("dataBox");

  @override
  void initState() {
    if (_dataBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  // ? List of todos

  void saveNewTask() {
    setState(() {
      db.toDoList.add(
        [_controller.text, false],
      );
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          onSave: saveNewTask,
          controller: _controller,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          "TO DO",
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(db.toDoList[index]),
            onDismissed: (direction) {
              deleteTask(index);
            },
            background: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: TaskUtil(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[800],
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
