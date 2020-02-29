import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetReq {
  static const String _baseUrl = "https://zh.wikihow.com";
  static final NetReq _singleton = NetReq._internal();

  Dio _dio;

  factory NetReq() {
    return _singleton;
  }

  NetReq._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl, connectTimeout: 3000, receiveTimeout: 3000));
  }

  Future<Response> get({@required String path}) {
    return _dio.get(path);
  }
}
