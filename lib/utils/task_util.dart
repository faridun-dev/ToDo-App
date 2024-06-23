import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TaskUtil extends StatefulWidget {
  final String taskName;
  Function(BuildContext) deleteTask;

  TaskUtil({
    super.key,
    required this.taskName,
    required this.deleteTask,
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
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(
                12,
              ),
              onPressed: widget.deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
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
                  decoration: status!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
