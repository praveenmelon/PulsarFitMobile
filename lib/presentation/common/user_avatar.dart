import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/extensions.dart';

class UserAvatar extends StatelessWidget {
  final String url;
  final String trailing;

  UserAvatar({
    this.url,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(url.toNetworkPhotoUrl()),
        ),
        if (trailing != null) ...[
          SizedBox(width: 10),
          Text(trailing),
        ],
      ],
    );
  }
}
