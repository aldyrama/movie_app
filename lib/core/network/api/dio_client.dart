import 'dart:convert';
import 'dart:io';
import 'package:alice/alice.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();

  static Alice alice = Alice(showNotification: true);

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) async{
      // options.headers['content-Type'] = 'application/json';
      // options.headers['accept'] = 'application/json';
      // options.headers['Authorization'] = 'Bearer ${await prefHelper.getValueAccessToken()}';
      // options.headers['username'] = 'Bearer ${await prefHelper.getValueAccessToken()}';

      // Do something before request is sent
      debugPrint("\n"
          "Request ${options.uri} \n"
          "-- headers --\n"
          "${options.headers.toString()} \n"
          "-- payload --\n"
          "${options.data.toString()} \n"
          "", wrapWidth: 1024);

      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      if (response.statusCode == 200) {
        debugPrint("\n"
            "Response ${response.realUri} \n"
            "-- headers --\n"
            "${response.headers.toString()} \n"
            "-- payload --\n"
            "${jsonEncode(response.data)} \n"
            "", wrapWidth: 1024);
      } else if (response.statusCode == 401) {
        // Do something with statusCode
      } else {
        debugPrint("Dio Response Status --> ${response.statusCode}");
      }
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // Do something with response error
      debugPrint("Dio Response Error --> $e");
      return handler.next(e); //continue
    });
  }
}