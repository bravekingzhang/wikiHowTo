import 'package:dio/dio.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/model/index_list_response.dart';
import 'package:wiki_howto_zh/network_request.dart';

class IndexListBloc extends BaseBloc {
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    switch (event.runtimeType) {
      case RefreshEvent:
        RefreshEvent refreshEvent = event;

        var path =
            '/api.php?action=app&subcmd=featured&num=${refreshEvent.num}&format=json';
        ///先请求缓存
        Response response = await NetReq().getCache(path: path);
        if(response.statusCode == 200){
          try {
            yield SuccessState(IndexListResponse.fromJson(response.data));
          } catch (e) {
          }
        }
        ///在请求网络
        response = await NetReq().get(path: path);
        if (response.statusCode == 200) {
          try {
            yield SuccessState(IndexListResponse.fromJson(response.data));
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

class RefreshEvent extends BaseEvent {
  int num;

  RefreshEvent.init(this.num);
}

class SuccessState extends BaseState {
  IndexListResponse response;

  SuccessState(this.response);
}
