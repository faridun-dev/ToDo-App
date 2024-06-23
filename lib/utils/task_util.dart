import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskUtil extends StatefulWidget {
  final String taskName;

  const TaskUtil({
    super.key,
    required this.taskName,
  });

  @override
  State<TaskUtil> createState() => _TaskUtilState();
}

class _TaskUtilState extends State<TaskUtil> {
  bool? status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 26,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        padding: const EdgeInsets.all(
          25.0,
        ),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: WidgetStateColor.transparent,
              value: status,
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              },
            ),
            Text(
              widget.taskName,
              style: TextStyle(
                decoration:
                    status! ? TextDecoration.lineThrough : TextDecoration.none,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
