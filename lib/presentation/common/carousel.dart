import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pulsar_fit/models/enumerations/multimedia_file_type.dart';
import 'package:pulsar_fit/models/responses/multimedia_file.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/common/photo_widget.dart';
import 'package:pulsar_fit/presentation/common/video_widget.dart';

import 'full_screen_swiper.dart';
import 'no_content.dart';

class Carousel extends StatefulWidget {
  final double width;
  final double height;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;

  final bool showNoContent;

  final List<MultimediaFile> items;

  Carousel({
    this.width,
    this.height,
    this.fit,
    this.padding,
    this.showNoContent,
    this.items,
  });

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentImageIndex = 0;

  void _updateImageIndex(int index, _) {
    setState(() => _currentImageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.count() == 0) {
      return NoContent();
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    final _navigator = context.navigator();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: _updateImageIndex,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: widget.items.count() > 1,
                ),
                items: widget.items.map((x) {
                  final index = widget.items.indexWhere((y) => y.id == x.id);

                  if (x.multimediaFileType == MultimediaFileType.photo) {
                    return PhotoWidget(
                      url: x.url,
                      onTap: () => _navigator.push(
                        MaterialPageRoute(
                          builder: (context) => FullScreenSwiper(
                            itemCount: widget.items.count(),
                            index: index,
                            itemBuilder: (BuildContext context, int index2) {
                              if (widget.items[index2].multimediaFileType == MultimediaFileType.photo) {
                                return PhotoWidget(
                                  url: widget.items[index2].url,
                                  isFullScreen: true,
                                );
                              }
                              if (widget.items[index2].multimediaFileType == MultimediaFileType.video) {
                                return VideoWidget(url: widget.items[index2].url, isFullScreen: true);
                              }

                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  if (x.multimediaFileType == MultimediaFileType.video) {
                    return VideoWidget(
                      url: x.url,
                      onTap: () => _navigator.push(
                        MaterialPageRoute(
                          builder: (context) => FullScreenSwiper(
                            itemCount: widget.items.count(),
                            index: index,
                            itemBuilder: (BuildContext context, int index2) {
                              if (widget.items[index2].multimediaFileType == MultimediaFileType.photo) {
                                return PhotoWidget(
                                  url: widget.items[index2].url,
                                  isFullScreen: true,
                                );
                              }
                              if (widget.items[index2].multimediaFileType == MultimediaFileType.video) {
                                return VideoWidget(url: widget.items[index2].url, isFullScreen: true);
                              }

                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  }

                  return NoContent();
                }).toList(),
              ),
              // HeartOverlayAnimator(triggerAnimationStream: _doubleTapImageEvents.stream),
            ],
          ),
        ),
        // Action Bar
        () {
          if (widget.items.count() > 1) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PhotoCarouselIndicator(
                    photoCount: widget.items.length,
                    activePhotoIndex: _currentImageIndex,
                  ),
                ],
              ),
            );
          }
          return Container();
        }(),
      ],
    );
  }
}

class PhotoCarouselIndicator extends StatelessWidget {
  final int photoCount;
  final int activePhotoIndex;

  PhotoCarouselIndicator({
    @required this.photoCount,
    @required this.activePhotoIndex,
  });

  Widget _buildDot({bool isActive, Color activeColor}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: isActive ? 7.5 : 6.0,
          width: isActive ? 7.5 : 6.0,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.grey,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = context.appTheme();

    return Row(
      children: List.generate(photoCount, (i) => i)
          .map(
            (i) => _buildDot(
              isActive: i == activePhotoIndex,
              activeColor: _appTheme.theme.primaryColor,
            ),
          )
          .toList(),
    );
  }
}
