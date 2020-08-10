import 'package:pulsar_fit/models/enumerations/multimedia_file_type.dart';

class MultimediaFile {
  int id;
  String url;
  String thumbnailUrl;
  String blurhash;
  double sizeMB;
  MultimediaFileType multimediaFileType;
  bool isPublic;

  MultimediaFile({
    this.id,
    this.url,
    this.thumbnailUrl,
    this.blurhash,
    this.sizeMB,
    this.multimediaFileType,
    this.isPublic,
  });

  factory MultimediaFile.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return MultimediaFile(
        id: json['id'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
        blurhash: json['blurhash'],
        sizeMB: json['sizeMB'],
        multimediaFileType: MultimediaFileType.getValue(json['multimediaFileType']),
        isPublic: json['isPublic'],
      );
    }
    return null;
  }
}
