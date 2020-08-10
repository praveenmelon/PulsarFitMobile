import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Expandable extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Color iconColor;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry bodyPadding;

  Expandable({
    @required this.header,
    @required this.body,
    this.iconColor,
    this.color,
    this.padding,
    this.headerPadding,
    this.bodyPadding,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      color: color ?? _theme.primaryColor,
      padding: padding,
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToCollapse: true,
          iconColor: iconColor ?? _theme.accentColor,
        ),
        header: Container(
          padding: headerPadding,
          child: header,
        ),
        expanded: Container(
          padding: bodyPadding,
          child: body,
        ),
      ),
    );
  }
}
