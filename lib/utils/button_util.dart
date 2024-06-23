import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ButtonUtil extends StatelessWidget {
  final String name;
  VoidCallback onPressed;

  ButtonUtil({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.green[800],
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
