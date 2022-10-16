import 'package:articles_app/core/services/storage/storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dio_http_service.dart';
import 'http_service.dart';

part 'http_service_provider.g.dart';

@riverpod
HttpService httpService(HttpServiceRef ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(storageService);
}
