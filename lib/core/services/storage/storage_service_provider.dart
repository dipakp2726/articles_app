import 'package:articles_app/core/services/storage/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'hive_storage_service.dart';

part 'storage_service_provider.g.dart';

@riverpod
StorageService storageService(StorageServiceRef ref) {
  return HiveStorageService();
}