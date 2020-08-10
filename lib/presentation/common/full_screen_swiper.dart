import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pulsar_fit/common/extensions.dart';
import '../../main.dart';
import '../app_icons.dart';

class FullScreenSwiper extends StatefulWidget {
  static const routeName = '/FullScreenSwiper';
  final int index;
  final Function itemBuilder;
  final int itemCount;
  //if there is only one photo
  final Widget child;

  FullScreenSwiper({
    this.index,
    this.itemBuilder,
    this.itemCount,
    this.child,
  });

  @override
  _FullScreenSwiperState createState() => _FullScreenSwiperState();
}

class _FullScreenSwiperState extends State<FullScreenSwiper> {
  final swiperControl = SwiperControl();
  final swiperPagination = SwiperPagination();

  @override
  void initState() {
    super.initState();

    setOrientationRotation();
  }

  @override
  void dispose() {
    setOrientationPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = context.appTheme();
    final _navigator = context.navigator();
    final _mediaQuery = context.mediaQuery();

    if (widget.child != null) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _mediaQuery.size.width,
                  height: _mediaQuery.size.height * 0.5,
                  child: widget.child,
                  color: _appTheme.theme.primaryColor,
                ),
              ],
            ),
            Container(
              color: Colors.black12,
              padding: EdgeInsets.fromLTRB(0, _mediaQuery.padding.top, 0, 15),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(AppIcons.close, color: Colors.white),
                    onPressed: () => _navigator.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (widget.itemBuilder != null) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              // width: _mediaQuery.size.width,
              // height: _mediaQuery.size.height * 0.8,
              color: _appTheme.theme.primaryColor,
              child: Swiper(
                pagination: widget.itemCount > 1 ? swiperPagination : null,
                loop: widget.itemCount > 1,
                control: widget.itemCount > 1 ? swiperControl : null,
                itemBuilder: widget.itemBuilder,
                itemCount: widget.itemCount,
                index: widget.index,
              ),
            ),
            Container(
              color: Colors.black12,
              padding: EdgeInsets.fromLTRB(0, _mediaQuery.padding.top, 0, 15),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(AppIcons.close, color: Colors.white),
                    onPressed: () => _navigator.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
