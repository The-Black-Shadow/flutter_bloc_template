import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'package:logger/logger.dart';

class DioClient {
  final Dio _dio;
  final Logger _logger = Logger();

  DioClient(this._dio) {
    _dio
      ..options.baseUrl =
          'https://api.example.com' // TODO: Replace with actual base URL
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.headers = {'Content-Type': 'application/json'};

    // _dio.interceptors.add(LogInterceptor(responseBody: true)); // Use for debugging only
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('GET Request Failed: $url', error: e);
      throw ServerException(
        e.response?.data['message'] ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('POST Request Failed: $url', error: e);
      throw ServerException(
        e.response?.data['message'] ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
      );
    }
  }

  // Add put, delete, etc. as needed
}
