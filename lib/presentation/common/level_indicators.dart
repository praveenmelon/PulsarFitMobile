import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/models/enumerations/cardio_level.dart';
import 'package:pulsar_fit/models/enumerations/plan_level.dart';
import 'package:pulsar_fit/models/enumerations/strength_level.dart';

class LevelIndicators extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final CardioLevel cardioLevel;
  final StrengthLevel strengthLevel;
  final PlanLevel planLevel;

  LevelIndicators({
    this.padding = const EdgeInsets.all(10),
    this.cardioLevel,
    this.strengthLevel,
    this.planLevel,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme();

    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (cardioLevel != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(context.localizer().translation.cardio),
                SizedBox(width: 10),
                SignalStrengthIndicator.bars(
                  value: (1 / CardioLevel.values.length) * cardioLevel.index,
                  size: 15,
                  barCount: 3,
                  spacing: 0.2,
                  activeColor: appTheme.theme.accentColor,
                  inactiveColor: Colors.white,
                ),
              ],
            ),
          if (strengthLevel != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(context.localizer().translation.strength),
                SizedBox(width: 10),
                SignalStrengthIndicator.bars(
                  value: (1 / StrengthLevel.values.length) * strengthLevel.index,
                  size: 15,
                  barCount: 3,
                  spacing: 0.2,
                  activeColor: appTheme.theme.accentColor,
                  inactiveColor: Colors.white,
                ),
              ],
            ),
          if (planLevel != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(context.localizer().translation.level),
                SizedBox(width: 10),
                SignalStrengthIndicator.bars(
                  value: (1 / PlanLevel.values.length) * planLevel.index,
                  size: 15,
                  barCount: 3,
                  spacing: 0.2,
                  activeColor: appTheme.theme.accentColor,
                  inactiveColor: Colors.white,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
