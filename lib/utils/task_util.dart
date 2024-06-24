import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskUtil extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TaskUtil({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
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
        top: 20,
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
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
            ),
            Text(
              widget.taskName,
              style: TextStyle(
                decoration: widget.taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
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
