import 'package:flutter/material.dart';

enum ButtonType { circle, rounded }

class Button extends StatelessWidget {
  Color color;
  BoxDecoration decoration;
  Color borderColor;
  Color textColor;
  final Widget prefix;
  final String text;
  final Widget child;
  final Widget sufix;
  final ButtonType type;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Function onTap;
  final MainAxisAlignment mainAxisAlignment;

  final bool primary;
  final bool secondary;
  final bool warning;
  final bool danger;
  final bool success;

  Button.circle({
    this.color,
    this.decoration,
    this.borderColor,
    this.textColor,
    this.prefix,
    this.text = '',
    this.child,
    this.sufix,
    this.padding = const EdgeInsets.all(15),
    this.margin = const EdgeInsets.all(0),
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.primary = false,
    this.secondary = false,
    this.warning = false,
    this.danger = false,
    this.success = false,
  }) : type = ButtonType.circle;

  Button.rounded({
    this.color,
    this.decoration,
    this.borderColor,
    this.textColor,
    this.prefix,
    this.text = '',
    this.child,
    this.sufix,
    this.padding = const EdgeInsets.fromLTRB(60, 15, 60, 15),
    this.margin = const EdgeInsets.fromLTRB(0, 20, 0, 20),
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.primary = false,
    this.secondary = false,
    this.warning = false,
    this.danger = false,
    this.success = false,
  }) : type = ButtonType.rounded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    color ??= theme.primaryColor;
    borderColor ??= theme.accentColor;

    if (primary) {
      color = theme.accentColor;
      borderColor = theme.accentColor;
      textColor = Colors.white;
    } else if (secondary) {
      color = Colors.lightBlueAccent;
      borderColor = Colors.lightBlueAccent;
      textColor = Colors.white;
    } else if (warning) {
      color = Colors.orange;
      borderColor = Colors.orange;
      textColor = Colors.white;
    } else if (danger) {
      color = Colors.redAccent;
      borderColor = Colors.redAccent;
      textColor = Colors.white;
    } else if (success) {
      color = Colors.green;
      borderColor = Colors.green;
      textColor = Colors.white;
    }

    if (type == ButtonType.rounded || type == ButtonType.circle) {
      return Container(
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: padding,
              decoration: decoration ??
                  BoxDecoration(
                    color: color ?? theme.primaryColor,
                  ),
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (prefix != null) prefix,
                  child ?? Text(text, style: TextStyle(color: textColor)),
                  if (sufix != null) sufix,
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container();
  }
}
