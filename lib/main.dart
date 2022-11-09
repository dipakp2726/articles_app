import 'dart:async';

import 'package:articles_app/article_app.dart';
import 'package:articles_app/core/services/storage/hive_storage_service.dart';
import 'package:articles_app/core/services/storage/storage_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Very good test

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      // Hive-specific initialization
      await Hive.initFlutter();
      final storageService = HiveStorageService();
      await storageService.init();

      runApp(
        ProviderScope(
          overrides: [
            storageServiceProvider.overrideWithValue(storageService),
          ],
          child: const ArticlesApp(),
        ),
      );
    },
    (e, _) => throw e as Error,
  );
}
