// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $getArticleListHash() => r'784a6be681060ac662a7b620d72eb6473ddfa78b';

/// See also [getArticleList].
class GetArticleListProvider extends AutoDisposeFutureProvider<List<Article>> {
  GetArticleListProvider({
    required this.page,
  }) : super(
          (ref) => getArticleList(
            ref,
            page: page,
          ),
          from: getArticleListProvider,
          name: r'getArticleListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getArticleListHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetArticleListProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetArticleListRef = AutoDisposeFutureProviderRef<List<Article>>;

/// See also [getArticleList].
final getArticleListProvider = GetArticleListFamily();

class GetArticleListFamily extends Family<AsyncValue<List<Article>>> {
  GetArticleListFamily();

  GetArticleListProvider call({
    required int page,
  }) {
    return GetArticleListProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Article>> getProviderOverride(
    covariant GetArticleListProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getArticleListProvider';
}

String $getArticleHash() => r'5428477c653c732051d1d0f4dc20e597fd9b797c';

/// See also [getArticle].
class GetArticleProvider extends AutoDisposeFutureProvider<Article> {
  GetArticleProvider({
    required this.id,
  }) : super(
          (ref) => getArticle(
            ref,
            id: id,
          ),
          from: getArticleProvider,
          name: r'getArticleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getArticleHash,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is GetArticleProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetArticleRef = AutoDisposeFutureProviderRef<Article>;

/// See also [getArticle].
final getArticleProvider = GetArticleFamily();

class GetArticleFamily extends Family<AsyncValue<Article>> {
  GetArticleFamily();

  GetArticleProvider call({
    required int id,
  }) {
    return GetArticleProvider(
      id: id,
    );
  }

  @override
  AutoDisposeFutureProvider<Article> getProviderOverride(
    covariant GetArticleProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getArticleProvider';
}
