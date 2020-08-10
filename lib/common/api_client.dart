import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient extends DioMixin {
  ApiClient() {
    httpClientAdapter = DefaultHttpClientAdapter();
    interceptors.add(PrettyDioLogger(
      responseBody: false,
    ));
    options ??= BaseOptions();
  }

  void setBaseUrl(String baseUrl) {
    options ??= BaseOptions();
    options.baseUrl = baseUrl;
  }

  void setContentType(String contentType) {
    final key = 'Content-Type';
    if (options.headers.containsKey(key)) {
      options.headers.removeWhere((k, value) => k == key);
    }
    appendHeaders({
      key: contentType
    });
  }

  void setAcceptLanguage(String languageCode) {
    final key = 'Accept-Language';
    if (options.headers.containsKey(key)) {
      options.headers.removeWhere((k, value) => k == key);
    }
    appendHeaders({
      key: languageCode
    });
  }

  void appendHeaders(Map<String, dynamic> headers) {
    options.headers.addAll(headers);
  }

  void setJwt(String jwt) {
    if (jwt != null) {
      appendHeaders({
        'Authorization': 'Bearer $jwt'
      });
    }
  }
}
