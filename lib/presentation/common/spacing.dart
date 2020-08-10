import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double _width;
  final double _height;

  Spacing.h_xxs() // ignore: non_constant_identifier_names
      : _width = 5.0,
        _height = 0.0;
  Spacing.h_xs() // ignore: non_constant_identifier_names
      : _width = 10.0,
        _height = 0.0;
  Spacing.h_sm() // ignore: non_constant_identifier_names
      : _width = 20.0,
        _height = 0.0;
  Spacing.h_md() // ignore: non_constant_identifier_names
      : _width = 30.0,
        _height = 0.0;
  Spacing.h_lg() // ignore: non_constant_identifier_names
      : _width = 40.0,
        _height = 0.0;
  Spacing.h_xlg() // ignore: non_constant_identifier_names
      : _width = 50.0,
        _height = 0.0;

  Spacing.v_xxs() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 5.0;
  Spacing.v_xs() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 10.0;
  Spacing.v_ssm() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 15.0;
  Spacing.v_sm() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 20.0;
  Spacing.v_md() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 30.0;
  Spacing.v_lg() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 40.0;
  Spacing.v_xlg() // ignore: non_constant_identifier_names
      : _width = 0.0,
        _height = 50.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
    );
  }
}
