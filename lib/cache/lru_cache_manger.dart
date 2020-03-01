import 'dart:io';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:disk_lru_cache/disk_lru_cache.dart';

class LruFileCache {
  static const int MAX_SIZE = 20 * 1024 * 1024;
  static final LruFileCache _singleton = LruFileCache._internal();
  DiskLruCache cache;

  factory LruFileCache() {
    return _singleton;
  }

  LruFileCache._internal() {
    Directory cacheDirectory =
        new Directory("${Directory.systemTemp.path}/cache");
    cache = new DiskLruCache(
        maxSize: MAX_SIZE, directory: cacheDirectory, filesCount: 1);
  }

  Future writeString(String key, String value) async {
    try {
      var content = new Utf8Encoder().convert(key);
      var digest = md5.convert(content);
      key = hex.encode(digest.bytes);
      CacheEditor editor = await cache.edit(key);
      if (editor != null) {
        IOSink sink = await editor.newSink(0);
        sink.write(value);
        await sink.close();
        await editor.commit();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> readCache(String key) async {
    // read stream
    try {
      var content = new Utf8Encoder().convert(key);
      var digest = md5.convert(content);
      key = hex.encode(digest.bytes);
      CacheSnapshot snapshot = await cache.get(key);
      if (snapshot == null) {
        return null;
      }
      String str = await snapshot.getString(0);
      return str;
    } catch (e) {
      print(e);
    }
  }
}
