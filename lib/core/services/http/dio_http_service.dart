import 'package:articles_app/core/configs/configs.dart';
import 'package:articles_app/core/exceptions/http_exception.dart';
import 'package:articles_app/core/services/http/http_service.dart';
import 'package:dio/dio.dart';

import '../storage/storage_service.dart';
import 'interceptors/cache_interceptor.dart';

class DioHttpService implements HttpService {
  final StorageService storageService;

  late final Dio dio;

  DioHttpService(
    this.storageService, {
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    if (enableCaching) {
      dio.interceptors.add(CacheInterceptor(storageService));
    }
  }

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  BaseOptions get baseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );

  @override
  Future<dynamic> get(String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    dio.options.extra[dioCacheForceRefreshKey] = forceRefresh;

    Response response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> post(String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.post(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
