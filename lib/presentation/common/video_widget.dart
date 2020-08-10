import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:pulsar_fit/common/extensions.dart';

import '../app_icons.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  final Function onTap;
  final bool isFullScreen;

  VideoWidget({
    @required this.url,
    this.onTap,
    this.isFullScreen,
  }) : assert(url != null);

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = context.appTheme();

    if (widget.isFullScreen ?? false) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: _controller.value?.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                _PlayPauseOverlay(
                  controller: _controller,
                  onTap: widget.onTap,
                  showFullScreen: widget.isFullScreen,
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    bufferedColor: _appTheme.theme.accentColor,
                    playedColor: _appTheme.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return AspectRatio(
        aspectRatio: _controller.value?.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            _PlayPauseOverlay(
              controller: _controller,
              onTap: widget.onTap,
              showFullScreen: widget.isFullScreen,
            ),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                bufferedColor: _appTheme.theme.accentColor,
                playedColor: _appTheme.theme.primaryColor,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  final Function onTap;
  final bool showFullScreen;

  const _PlayPauseOverlay({
    Key key,
    this.controller,
    this.onTap,
    this.showFullScreen,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: InkWell(
                      onTap: () => controller.play(),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                  ),
                ),
        ),
        if (controller.value.isPlaying)
          GestureDetector(
            onTap: () {
              controller.pause();
            },
          ),
        if (!(showFullScreen ?? false))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: onTap,
              child: Icon(
                AppIcons.fullScreen,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }
}
