import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:media_reels/src/networks/global_interceptors.dart';

class DioClient {
  static final DioClient _instance = DioClient();
  static DioClient get instance => _instance;
  late Dio _dio;

  DioClient() {
    BaseOptions options = BaseOptions(
        baseUrl: "Endpoints.baseURL",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        contentType: Headers.formUrlEncodedContentType);

    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: GlobalInterceptorsClient().onRequest,
        onResponse: GlobalInterceptorsClient().onResponse,
        onError: GlobalInterceptorsClient().onError,
      ),
    );
  }

  /// GET
  Future<Response<dynamic>?> get(String path) async {
    try {
      return await _dio.get(path);
    } catch (e) {
      _printLog("get error: $e");
      rethrow;
    }
  }

  /// POST
  Future<Response<dynamic>?> post(String path, String? dataPrams) async {
    try {
      return await _dio.post(path, data: {'JSON': "$dataPrams"});
    } catch (e) {
      _printLog("pos error: $e");
      if (e is DioException) {
        return e.response;
      }
      rethrow;
    }
  }

  /// DELETE
  Future<Response<dynamic>?> delete(String path, String? dataPrams) async {
    try {
      return await _dio.delete(path, data: {'JSON': "$dataPrams"});
    } catch (e) {
      _printLog(e);
      if (e is DioException) {
        return e.response;
      }
      rethrow;
    }
  }

  /// PUT
  Future<Response> put(String path, String? dataPrams) async {
    try {
      return await _dio.put(path, data: {'JSON': "$dataPrams"});
    } catch (e) {
      _printLog(e);
      rethrow;
    }
  }

  Future<Response> putUploadBinary(
      String url, String path, String typePath) async {
    try {
      File imageFile = File(path);
      Uint8List imageBytes = await imageFile.readAsBytes();
      Options options = Options(
        contentType: typePath,
        headers: {
          'Accept': '*/*',
          'Content-Length': imageBytes.length.toString(),
          'Connection': 'keep-alive',
          'User-Agent': 'ClinicPlush'
        },
      );
      Response response = await Dio().put(
        url,
        data: Stream.fromIterable(imageBytes.map((e) => [e])),
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// FORM
  Future<Response> postUpload(
      String pathUrl, String path, String namePath, String? typePath) async {
    try {
      Future<FormData> createFormData() async {
        return FormData.fromMap({
          'file': await MultipartFile.fromFile(path, filename: namePath),
        });
      }

      return await _dio.post(pathUrl, data: await createFormData());
    } catch (e) {
      _printLog(e);
      rethrow;
    }
  }

  /// FORM
  Future<Response> postUploadVideo(
      String pathUrl, String path, String namePath, String? typePath) async {
    try {
      Future<FormData> createFormData() async {
        return FormData.fromMap({
          'file': await MultipartFile.fromFile(path, filename: namePath),
        });
      }

      return await _dio.post(
        pathUrl,
        data: await createFormData(),
        onSendProgress: (sent, total) {
          print(
              'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
        },
      );
    } catch (e) {
      _printLog(e);
      rethrow;
    }
  }

  void _printLog(dynamic e) {
    if (e is DioException) {
      print(e.response);
    }
  }
}
