import 'package:flutter/material.dart';

import 'package:pulsar_fit/common/extensions.dart';

class NoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizer = context.localizer();
    return Container(
      child: Center(
        child: Text(localizer.translation.noContent),
      ),
    );
  }
}
