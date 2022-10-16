import 'dart:convert';

import 'package:articles_app/core/configs/configs.dart';
import 'package:dio/dio.dart';

class CachedResponse {
  CachedResponse({
    required this.data,
    required this.age,
    required this.statusCode,
    required this.headers,
  });

  factory CachedResponse.fromJson(Map<String, dynamic> data) {
    return CachedResponse(
      data: data['data'],
      age: DateTime.parse(data['age'] as String),
      statusCode: data['statusCode'] as int,
      headers: Headers.fromMap(
        Map<String, List<dynamic>>.from(
          json.decode(json.encode(data['headers'])) as Map<dynamic, dynamic>,
        ).map(
          (k, v) => MapEntry(k, List<String>.from(v)),
        ),
      ),
    );
  }

  final dynamic data;
  final DateTime age;
  final int statusCode;
  final Headers headers;

  bool get isValid => DateTime.now().isBefore(age.add(Configs.maxCacheAge));

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'age': age.toString(),
      'statusCode': statusCode,
      'headers': headers.map,
    };
  }

  Response<dynamic> buildResponse(RequestOptions options) {
    return Response<dynamic>(
      data: data,
      headers: headers,
      requestOptions: options.copyWith(extra: options.extra),
      statusCode: statusCode,
    );
  }
}
