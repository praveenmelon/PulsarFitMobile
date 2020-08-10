import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/models/responses/exercise.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  static const String route = '/ExerciseDetailsScreen';

  final Exercise exercise;

  ExerciseDetailsScreen({@required this.exercise}) : assert(exercise != null);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.mediaQuery();

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name.cut(20)),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(exercise.multimediaFile?.url.toNetworkPhotoUrl()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: HtmlWidget(
              exercise.description ?? '',
              webView: true,
              textStyle: TextStyle(color: Colors.white38),
            ),
          )
        ],
      ),
    );
  }
}
