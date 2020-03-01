import 'package:cached_network_image/cached_network_image.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:wiki_howto_zh/model/search_response.dart';
import 'package:wiki_howto_zh/page/detail.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchBarController _searchBarController;
  bool isReplay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchBarController = SearchBarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Docs>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getAllSearch,
          searchBarController: _searchBarController,
          placeHolder: Text("placeholder"),
          cancellationWidget: Text("取消"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) =>
              ScaledTile.count(1, index.isEven ? 2 : 1),
          onCancelled: () {
            Navigator.of(context).pop();
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Docs post, int index) {
            return Container(
              color: Colors.lightBlue,
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: post.image58x58,
                  width: 58,
                  height: 58,
                ),
                title: Text(post.title),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Detail(post.id)));
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List<Docs>> _getAllSearch(text) {
    print(text);
    return Future.value([]);
  }
}
