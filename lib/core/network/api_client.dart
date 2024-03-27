import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_learn/data/constants/api_constants.dart';
import 'package:flutter/foundation.dart';
import '../../data/constants/app_constants.dart';
import 'error_constants.dart';

class ApiClient {
  static ApiClient? _instance;
  late Dio _dio;

  factory ApiClient() {
    _instance ??= ApiClient._();
    return _instance!;
  }

  ApiClient._() {
    _dio = Dio();
  }

  static void initialize(
      {Duration timeout = const Duration(seconds: 15)}) async {
    var headers = {'Authorization': 'Nothing'};
    ApiClient();
    _instance?._dio.options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        followRedirects: false,
        headers: headers,
        validateStatus: (status) {
          return status! < 500;
        });
    if (kDebugMode) {
      _instance?._dio.interceptors.add(LogInterceptor(
          responseBody: true, requestBody: true, requestHeader: true));
    }
  }

  Future<Response> getRequest(String endpoint) async {
    if (!internetConnected.value) {
      throw ApiException(400, AppErrors.internetError);
    }
    try {
      final response = await _dio.get(endpoint);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    print(internetConnected.value);
    if (!internetConnected.value) {
      throw ApiException(400, AppErrors.internetError);
    }
    try {
      final response = await _dio.post(endpoint, data: data);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  Future<Response> putRequest(String endpoint, dynamic data) async {
    if (!internetConnected.value) {
      throw ApiException(400, AppErrors.internetError);
    }
    try {
      final response = await _dio.put(endpoint, data: data);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  Future<Response> postMultipartRequest(
      String endpoint, Map<String, dynamic>? data, List<File>? files) async {
    if (!internetConnected.value) {
      throw ApiException(400, AppErrors.internetError);
    }
    try {
      final formData = FormData();
      if (data != null) {
        formData.fields.addAll(
            data.entries.map((e) => MapEntry(e.key, e.value.toString())));
      }
      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          final file = files[i];
          formData.files.add(MapEntry(
            'file$i',
            await MultipartFile.fromFile(file.path),
          ));
        }
      }

      final response = await _dio.post(endpoint, data: formData);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  void _checkResponseStatusCode(Response response) {
    if (response.statusCode != 200) {
      if (response.statusCode == 400 &&
          response.data != null &&
          response.data['errorMessage'] != null) {
        throw ApiException(response.statusCode!, response.data['errorMessage']);
      }
      throw ApiException(
          response.statusCode!, "Something went wrong, Please try again.");
    }
  }

  Future<ApiException> _handleApiError(DioException error) async {
    return ApiException(
        error.response?.statusCode ?? 0,
        error.response?.statusMessage ??
            "Something went wrong, Please try again.");
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException: $statusCode - $message';
  }
}
