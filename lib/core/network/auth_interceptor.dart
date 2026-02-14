import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  // TODO: Inject local storage to retrieve token

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = ... // Retrieve token
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle token expiration / refresh logic here
    }
    super.onError(err, handler);
  }
}
