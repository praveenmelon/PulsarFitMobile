import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/extensions.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(context.theme().primaryColor),
      ),
    );
  }
}
