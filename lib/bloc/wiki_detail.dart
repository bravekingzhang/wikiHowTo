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
        Response response = await NetReq().get(
            path:
                '/api.php?action=app&subcmd=article&id=${detailEvent.id}&format=json');

        if (response.statusCode == 200) {
          try{
            yield SuccessState(WiKiDetailResponse.fromJson(response.data));
          }catch(e){
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
