import 'package:dio/dio.dart';

class DioClient {
  final String apiBaseUrl;
  DioClient({
    required this.apiBaseUrl,
  });
  Dio get dio => _getDio();

  Dio _getDio() {
    var options = BaseOptions(
        baseUrl: apiBaseUrl, connectTimeout: 5000, receiveTimeout: 30000);
    var dio = Dio(options);
    // dio.interceptors.addAll([iterable])
    return dio;
  }
}
