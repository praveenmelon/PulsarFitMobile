import 'package:flutter/material.dart';

class TitleListTile extends StatelessWidget {
  final String text;
  final Widget trailing;
  final bool centerText;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  TitleListTile(
    this.text, {
    this.trailing,
    this.centerText = false,
    this.color,
    this.padding = const EdgeInsets.all(15),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text ?? '',
              textAlign: centerText ? TextAlign.center : null,
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
