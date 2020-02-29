import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wiki_howto_zh/model/index_list_response.dart';
import 'package:wiki_howto_zh/styles.dart';
class WiKiItem extends StatelessWidget {
  final Articles article;

  WiKiItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: article.image.url,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title,
              style: textTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.abstract,
              style: textSubTitle,
            ),
          )
        ],
      ),
    );
  }
}