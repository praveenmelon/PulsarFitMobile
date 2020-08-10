import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/extensions.dart';

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(width: 10, height: 10, color: context.theme().accentColor),
    );
  }
}
