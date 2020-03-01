import 'package:dio/dio.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/model/index_list_response.dart';
import 'package:wiki_howto_zh/model/wiki_detail_response.dart';
import 'package:wiki_howto_zh/network_request.dart';

class WiKiDetailBloc extends BaseBloc {
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    switch (event.runtimeType) {
      case DetailEvent:
        DetailEvent detailEvent = event;

        var path =
            '/api.php?action=app&subcmd=article&id=${detailEvent.id}&format=json';

        ///先请求缓存
        Response response = await NetReq().getCache(path: path);
        if (response.statusCode == 200) {
          try {
            print("命中缓存");
            yield SuccessState(WiKiDetailResponse.fromJson(response.data));
          } catch (e) {}
        }

        ///在请求网络
        response = await NetReq().get(path: path);

        if (response.statusCode == 200) {
          try {
            yield SuccessState(WiKiDetailResponse.fromJson(response.data));
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

class DetailEvent extends BaseEvent {
  int id;

  DetailEvent.init(this.id);
}

class SuccessState extends BaseState {
  WiKiDetailResponse response;

  SuccessState(this.response);
}
