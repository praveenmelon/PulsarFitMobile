import 'package:pulsar_fit/common/extensions.dart';

class MultimediaFileType {
  static const photo = MultimediaFileType._(1);
  static const video = MultimediaFileType._(2);
  static const gif = MultimediaFileType._(3);
  static List<MultimediaFileType> get values => [
        photo,
        video,
        gif
      ];
  final int index;
  const MultimediaFileType._(this.index);

  factory MultimediaFileType.getValue(int index) {
    return index.isInRange(1, values.length) ? MultimediaFileType.values[index - 1] : null;
  }
  factory MultimediaFileType.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? MultimediaFileType.values[index - 1] : null;
  }
}
