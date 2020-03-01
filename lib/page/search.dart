import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/bloc/search.dart';
import 'package:wiki_howto_zh/page/detail.dart';
import 'package:wiki_howto_zh/widget/error.dart';
import 'package:wiki_howto_zh/widget/search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isReplay = false;
  SearchBloc searchBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc = SearchBloc();
    searchBloc.add(SearchFEvent.init('aaron'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 50.0,
            title: SearchBar(
              onSearch: (value) {
                searchBloc.add(SearchQEvent.init(value));
              },
            ),
          ),
          BlocBuilder(
            bloc: searchBloc,
            builder: (BuildContext context, state) {
              switch (state.runtimeType) {
                case LoadingState:
                  return SliverFixedExtentList(
                      itemExtent: 150.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Center(child: CircularProgressIndicator());
                      }, childCount: 1));
                case SuccessState:
                  SuccessState successState = state;
                  return SliverFixedExtentList(
                    itemExtent: 60.0,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                        child: ListTile(
                          contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 8),
                          dense: true,
                          leading: CachedNetworkImage(
                            width: 48,
                            height: 48,
                            imageUrl: successState
                                .response.response.docs[index].image58x58,
                          ),
                          title: Text(
                              successState.response.response.docs[index].title),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Detail(successState
                                  .response.response.docs[index].id);
                            }));
                          },
                        ),
                      );
                    },
                        childCount: min(successState.response.response.numFound,
                            successState.response.response.docs?.length ?? 0)),
                  );
                default:
                  ErrorState errorState = state;
                  return SliverFixedExtentList(
                      itemExtent: 150.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Center(child: MyErrorWidget(errorState.msg));
                      }, childCount: 1));
              }
            },
          ),
        ],
      )),
    );
  }
}
