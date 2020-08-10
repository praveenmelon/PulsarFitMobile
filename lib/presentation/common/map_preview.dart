import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/app_icons.dart';

class MapPreview extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String title;

  MapPreview({
    this.latitude,
    this.longitude,
    this.title,
  });

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    if (latitude == null || longitude == null) {
      return Container();
    }

    final _appTheme = context.appTheme();
    final _navigator = context.navigator();
    final _mediaQuery = context.mediaQuery();

    final marker = Marker(position: LatLng(latitude, longitude), markerId: MarkerId(LatLng(latitude, longitude).toString()));

    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 14.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            marker
          },
        ),
        if (title.isNotNullOrEmpty())
          Container(
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(0, _mediaQuery.padding.top, 0, 15),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    AppIcons.close,
                    color: _appTheme.theme.primaryColor,
                  ),
                  onPressed: () => _navigator.pop(),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: _appTheme.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
