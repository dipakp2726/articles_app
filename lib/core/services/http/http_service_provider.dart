import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_http_service.dart';
import 'http_service.dart';

final httpServiceProvider = Provider<HttpService>((ref) {
  return DioHttpService();
});
