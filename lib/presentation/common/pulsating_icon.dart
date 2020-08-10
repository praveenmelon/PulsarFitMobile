import 'package:flutter/material.dart';
import 'package:pulsar_fit/presentation/app_icons.dart';

class PulsatingIcon extends StatefulWidget {
  Widget child;
  final bool pulsate;
  final bool show;
  final Function onTap;
  final Color color;

  PulsatingIcon({
    this.child,
    this.pulsate = true,
    this.show = true,
    this.onTap,
    this.color = Colors.white,
  });

  @override
  _PulsatingIconState createState() => _PulsatingIconState();
}

class _PulsatingIconState extends State<PulsatingIcon> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.show) {
      return Container();
    }

    widget.child ??= IconButton(
      icon: Icon(
        AppIcons.filters,
        color: widget.color,
        size: 18,
      ),
      onPressed: widget.onTap,
      color: Colors.blue,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.pulsate)
          FadeTransition(
            opacity: _animationController,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.color,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        if (widget.pulsate)
          FadeTransition(
            opacity: _animationController,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.color,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        widget.child,
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
