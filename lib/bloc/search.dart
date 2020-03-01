import 'package:dio/dio.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/model/index_list_response.dart';
import 'package:wiki_howto_zh/model/search_response.dart';
import 'package:wiki_howto_zh/model/wiki_detail_response.dart';
import 'package:wiki_howto_zh/network/network_request.dart';

class SearchBloc extends BaseBloc {
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    switch (event.runtimeType) {
      case SearchQEvent:
        SearchQEvent searchEvent = event;

        var path =
            '/api.php?action=app&subcmd=psearch&wt=json&q=${searchEvent.key}&rows=25';

        ///先请求缓存
        Response response = await NetReq().getCache(path: path);
        if (response.statusCode == 200) {
          try {
            print("命中缓存");
            yield SuccessState(SearchResponse.fromJson(response.data));
          } catch (e) {}
        }

        ///在请求网络
        response = await NetReq().get(path: path);

        if (response.statusCode == 200) {
          try {
            yield SuccessState(SearchResponse.fromJson(response.data));
          } catch (e) {
            yield ErrorState(msg: e.toString());
          }
        } else {
          yield ErrorState(msg: 'response Error ${response.statusCode}');
        }
        break;
      case SearchFEvent:
        SearchFEvent searchEvent = event;

        var path =
            '/api.php?action=app&subcmd=fsearch&format=json&q=${searchEvent.key}&rows=25';

        ///先请求缓存
        Response response = await NetReq().getCache(path: path);
        if (response.statusCode == 200) {
          try {
            print("命中缓存");
            yield SuccessState(SearchResponse.fromJson(response.data));
          } catch (e) {}
        }

        ///在请求网络
        response = await NetReq().get(path: path);

        if (response.statusCode == 200) {
          try {
            yield SuccessState(SearchResponse.fromJson(response.data));
          } catch (e) {
            yield ErrorState(msg: e.toString());
          }
        } else {
          yield ErrorState(msg: 'response Error ${response.statusCode}');
        }
        break;
      default:
        yield ErrorState(msg: "unkonw command!");
    }
  }
}

class SearchFEvent extends BaseEvent {
  String key;

  SearchFEvent.init(this.key);
}
class SearchQEvent extends BaseEvent {
  String key;

  SearchQEvent.init(this.key);
}

class SuccessState extends BaseState {
  SearchResponse response;

  SuccessState(this.response);
}
