import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/assets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Image.asset(
          Assets.logo,
          height: 40,
        ),
      ),
    );
  }
}
