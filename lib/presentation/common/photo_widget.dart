import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pulsar_fit/common/extensions.dart';

class PhotoWidget extends StatelessWidget {
  final String url;
  final Function onTap;
  final bool isFullScreen;

  PhotoWidget({
    @required this.url,
    this.onTap,
    this.isFullScreen = false,
  }) : assert(url != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhotoView(
        backgroundDecoration: BoxDecoration(color: context.theme().primaryColor),
        imageProvider: CachedNetworkImageProvider(
          url,
        ),
        maxScale: 2.0,
        minScale: 0.1,
        initialScale: isFullScreen ? PhotoViewComputedScale.contained * 1.0 : PhotoViewComputedScale.covered * 1.0,
      ),
    );
  }
}
