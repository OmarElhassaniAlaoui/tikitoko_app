import 'package:get/get.dart';

class ApiResponse {
  ApiResponse(
    this.body, [
    this.status,
    this.message,
  ]);

  dynamic body;
  int? status;
  String? message;

  get statusCode => null;
}

abstract class ApiService extends GetxService {
  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
}