import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final baseOptions = BaseOptions(
    baseUrl: "https://dummyjson.com",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );
  final dio = Dio(baseOptions);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if (options.method == "POST") {
        options.headers.addAll({"Content-Type": "application/json"});
      }
      return handler.next(options);
    },
  ));

  return dio;
}
