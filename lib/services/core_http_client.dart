import 'dart:async';
import 'dart:convert';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'error/exceptions.dart';

abstract class IHttpClient {
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    bool printData = false,
    bool isFormData = true,
    bool showLogger = true,
  });

  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    bool showLogger,
  });
}

class CoreHttpClient implements IHttpClient {
  Dio get dio => Dio(baseOptions);

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, String>? headers,
    bool showLogger = true,
  }) async {
    final Dio dioInternal = _parseDio(dio, headers);
    if (showLogger == true) dioInternal.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    return await _requestHandler(
      request: () => dioInternal.get(path, queryParameters: queryParameters),
      requestLabel: ':::GET:::',
    );
  }

  @override
  Future<Response> post(
    String path, {
    dynamic data = const {},
    Map<String, dynamic> queryParameters = const {},
    Map<String, String>? headers,
    bool printData = false,
    bool isFormData = true,
    bool showLogger = true,
  }) async {
    final Dio dioInternal = _parseDio(dio, headers);

    if (isFormData) {
      final formData = FormData.fromMap(data);
      if (showLogger == true) dioInternal.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
      if (printData == true) {
        debugPrint('data: $formData');
      }
      return await _requestHandler(
        request: () => dioInternal.post(
          path,
          data: formData,
          queryParameters: queryParameters,
        ),
        requestLabel: ':::POST:::',
      );
    } else {
      if (showLogger == true) dioInternal.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
      if (printData == true) {
        debugPrint('data: $data');
      }
      return await _requestHandler(
        request: () => dioInternal.post(
          path,
          data: data,
          queryParameters: queryParameters,
        ),
        requestLabel: ':::POST:::',
      );
    }
  }

  @mustCallSuper
  BaseOptions get baseOptions => BaseOptions(
        responseDecoder: (response, request, responseBody) {
          if (responseBody.statusCode > 299) {
            debugPrint(utf8.decode(response));
          }
          return utf8.decode(response);
        },
        validateStatus: (statusCode) => statusCode! < 600,
        headers: {},
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        baseUrl: 'https://arfudy-nestjs-backend.onrender.com/api',
      );

  Dio _parseDio(
    Dio dio,
    Map<String, String>? headers,
  ) {
    final Dio dioInternal = dio;
    if (headers != null) dioInternal.options.headers = headers;
    return dioInternal;
  }

  Future<Response> _requestHandler({
    required RequestCallback request,
    required String requestLabel,
  }) async {
    try {
      final result = await request();
      return result;
    } on DioException catch (exception) {
      debugPrint(requestLabel);
      debugPrint(exception.message);
    }
    throw RequestException();
  }
}

typedef RequestCallback = Future<Response> Function();

class RequestException implements CoreException {}
