import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/bloc/collect.dart';
import 'package:wiki_howto_zh/page/detail.dart';
import 'package:wiki_howto_zh/sql.dart';
import 'package:wiki_howto_zh/widget/error.dart';
import 'package:toast/toast.dart';

///收藏的HowTo
class Collect extends StatefulWidget {
  @override
  _CollectState createState() => _CollectState();
}

class _CollectState extends State<Collect> {
  CollectBloc collectBloc;

  @override
  void initState() {
    super.initState();
    collectBloc = CollectBloc();
  }

  @override
  void dispose() {
    super.dispose();
    collectBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: collectBloc,
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return Center(child: CircularProgressIndicator());
            case SuccessState:
              SuccessState successState = state;
              return ListView.builder(
                itemCount: successState.collectList.length,
                itemBuilder: (BuildContext context, int index) {
                  WikiCollectItem wikiCollectItem =
                      successState.collectList[index];
                  return Dismissible(
                    key: Key(wikiCollectItem.id.toString()),
                    confirmDismiss: (direction) {
                      collectBloc.add(DeleteWikiEvent.id(wikiCollectItem.id));
                      Toast.show("已移除收藏", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      return Future.value(true);
                    },
                    background: Container(
                      color: Color(0xffff0000),
                      child: Row(
                        children: <Widget>[
                          Center(child: Text('移除收藏')),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Color(0xffff0000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Center(child: Text('移除收藏')),
                        ],
                      ),
                    ),
                    movementDuration: Duration(milliseconds: 100),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        imageUrl: wikiCollectItem.image,
                      ),
                      title: Text(wikiCollectItem.title),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Detail(wikiCollectItem.id);
                        }));
                      },
                    ),
                  );
                },
              );
            case EmptyState:
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/empty.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('空空如也，赶紧去收藏吧')
                ],
              ));
            default:
              ErrorState errorState = state;
              return MyErrorWidget(errorState.msg);
          }
        },
      ),
    );
  }
}
