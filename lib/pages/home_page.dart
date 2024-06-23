import 'package:flutter/material.dart';
import 'package:todo_app_project/utils/dialog_box.dart';
import 'package:todo_app_project/utils/task_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  // ? List of todos
  List toDoList = [
    ["Make something cool"],
    ["Training"],
    ["Fuck them all"],
    ["Doing nothing"],
  ];

  void saveNewTask() {
    setState(() {
      toDoList.add(
        [_controller.text],
      );
      _controller.clear();
    });
    Navigator.of(context).pop();
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
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TaskUtil(
            taskName: toDoList[index][0],
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
