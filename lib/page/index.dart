import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/bloc/index_list.dart';
import 'package:wiki_howto_zh/model/index_list_response.dart';
import 'package:wiki_howto_zh/widget/wiki_item.dart';
import 'package:wiki_howto_zh/widget/error.dart';

class IndexList extends StatefulWidget {
  @override
  _IndexListState createState() => _IndexListState();
}

class _IndexListState extends State<IndexList> {
  IndexListBloc _indexListBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _indexListBloc = IndexListBloc();
    _indexListBloc.add(RefreshEvent.init(40));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return _indexListBloc.add(RefreshEvent.init(40));
        },
        child: BlocBuilder<IndexListBloc, BaseState>(
          bloc: _indexListBloc,
          builder: (BuildContext context, state) {
            switch (state.runtimeType) {
              case LoadingState:
                return Center(child: CircularProgressIndicator());
              case SuccessState:
                SuccessState successState = state;
                return ListView.builder(
                  itemCount: successState.response.app.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    Articles article =
                        successState.response.app.articles[index];
                    return WiKiItem(article);
                  },
                );
              default:
                ErrorState errorState = state;
                return MyErrorWidget(errorState.msg);
            }
          },
        ),
      ),
    );
  }
}
