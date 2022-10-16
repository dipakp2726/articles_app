import 'package:articles_app/core/services/http/dio_http_service.dart';
import 'package:articles_app/core/services/http/http_service.dart';
import 'package:articles_app/core/services/storage/storage_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_service_provider.g.dart';

@riverpod
HttpService httpService(HttpServiceRef ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(storageService);
}
