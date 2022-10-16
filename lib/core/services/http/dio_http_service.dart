import 'package:articles_app/core/configs/configs.dart';
import 'package:articles_app/core/exceptions/http_exception.dart';
import 'package:articles_app/core/services/http/http_service.dart';
import 'package:articles_app/core/services/http/interceptors/cache_interceptor.dart';
import 'package:articles_app/core/services/storage/storage_service.dart';
import 'package:dio/dio.dart';

class DioHttpService implements HttpService {
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

  final StorageService storageService;

  late final Dio dio;

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
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    dio.options.extra[dioCacheForceRefreshKey] = forceRefresh;

    final response = await dio.get<dynamic>(
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
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post<dynamic>(
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
  Future<void> delete() {
    // TODO(dipak): implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> put() {
    // TODO(dipak): implement put
    throw UnimplementedError();
  }
}
