class HttpException implements Exception {
  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });

  final String? title;
  final String? message;
  final int? statusCode;
}
