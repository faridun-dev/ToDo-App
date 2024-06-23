import 'package:flutter/material.dart';
import 'package:todo_app_project/utils/task_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ? List of todos
  List toDoList = [
    ["Make something cool"],
    ["Training"],
    ["Fuck them all"],
    ["Doing nothing"],
  ];

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
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Colors.green,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(),
                          ),
                          TextField(),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
