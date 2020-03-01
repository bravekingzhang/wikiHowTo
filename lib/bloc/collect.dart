import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/sql/sql.dart';

class CollectBloc extends BaseBloc {
  WikiProvider _wikiProvider;

  CollectBloc() {
    _wikiProvider = WikiProvider();
    add(ListWikiEvent());
  }

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    switch (event.runtimeType) {
      case CollectWikiEvent:
        CollectWikiEvent collectEvent = event;
        await _wikiProvider.insert(collectEvent.item);
        add(ListWikiEvent());
        break;
      case DeleteWikiEvent:
        DeleteWikiEvent deleteWikiEvent = event;
        await _wikiProvider.delete(deleteWikiEvent.id);
        add(ListWikiEvent());
        break;
      case ListWikiEvent:
        List wikiList = await _wikiProvider.listWiki();
        if (wikiList == null || wikiList.length == 0) {
          yield EmptyState();
        } else {
          yield SuccessState(wikiList);
        }
        break;
      default:
        yield ErrorState(msg: "unkonw command!");
    }
  }
}

class CollectWikiEvent extends BaseEvent {
  WikiCollectItem item;

  CollectWikiEvent.init(this.item);
}

class ListWikiEvent extends BaseEvent {}

class DeleteWikiEvent extends BaseEvent {
  int id;

  DeleteWikiEvent.id(this.id);
}

class EmptyState extends BaseState {}

class SuccessState extends BaseState {
  List<WikiCollectItem> collectList;

  SuccessState(this.collectList);
}
