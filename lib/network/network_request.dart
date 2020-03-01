import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wiki_howto_zh/cache/lru_cache_manger.dart';

class NetReq {
  static const String _baseUrl = "https://zh.wikihow.com";
  static final NetReq _singleton = NetReq._internal();

  Dio _dio;

  factory NetReq() {
    return _singleton;
  }

  NetReq._internal() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          // Do something before request is sent
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse:(Response response) async {
          if(response.statusCode==200){
            LruFileCache().writeString(response.request.uri.toString(), json.encode(response.data));
          }
          return response; // continue
        },
        onError: (DioError e) async {
          // Do something with response error
          return  e;//continue
        }
    ));
  }

  Future<Response> get({@required String path}) {
    return _dio.get(path);
  }

  Future<Response> getCache({@required String path}) async{
    var value = await LruFileCache().readCache(_baseUrl+path);
    if(value==null){
      return Response(statusCode: 404);
    }else{
      return Response(data:json.decode(value),statusCode: 200);
    }
  }
}
