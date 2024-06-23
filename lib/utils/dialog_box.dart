import 'package:flutter/material.dart';
import 'package:todo_app_project/utils/button_util.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  VoidCallback onSave;
  final TextEditingController controller;

  DialogBox({
    super.key,
    required this.onSave,
    required this.controller,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonUtil(
                  name: "SAVE",
                  onPressed: widget.onSave,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonUtil(
                  name: "CANCEL",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
