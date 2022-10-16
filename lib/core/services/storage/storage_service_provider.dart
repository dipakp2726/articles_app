import 'package:articles_app/core/services/storage/hive_storage_service.dart';
import 'package:articles_app/core/services/storage/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_service_provider.g.dart';

@riverpod
StorageService storageService(StorageServiceRef ref) {
  return HiveStorageService();
}
