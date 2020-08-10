import 'package:flutter/material.dart';

class PlanResult extends StatelessWidget {
  final String text;

  PlanResult({this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.check_circle_outline,
        size: 25,
      ),
      title: Text(text ?? ''),
    );
  }
}
