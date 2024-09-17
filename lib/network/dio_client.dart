import 'package:dio/dio.dart';
import 'package:media_reels/environment.dart';
import 'package:media_reels/network/global_interceptors.dart';

class DioClient {
  static final DioClient _instance = DioClient();
  static DioClient get instance => _instance;

  late Dio _dio;

  DioClient() {
    BaseOptions options = BaseOptions(
        baseUrl: Environment.restApiUrl,
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 4000),
        responseType: ResponseType.json,
        contentType: Headers.formUrlEncodedContentType);

    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: GlobalInterceptors().onRequest,
        onResponse: GlobalInterceptors().onResponse,
        onError: GlobalInterceptors().onError,
      ),
    );
  }
}
