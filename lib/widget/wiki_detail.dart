import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wiki_howto_zh/model/wiki_detail_response.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:wiki_howto_zh/sql/sql.dart';
import 'package:wiki_howto_zh/style/styles.dart';
import 'package:toast/toast.dart';


class HeadTitle {
  String title;

  HeadTitle(this.title);
}

class SubHeadTitle {
  String title;

  SubHeadTitle(this.title);
}

class TipBody {
  String body;

  TipBody(this.body);
}

class WikiDetail extends StatelessWidget {
  final App data;
  List items = [];

  WikiDetail(wiKiDetailResponse) : data = wiKiDetailResponse.app {
    _findSteps(data);
  }

  _findSteps(App app) {
    for (var section in app.sections) {
      if (section.type == null) {
        continue;
      }
      if (section.type.indexOf('steps') != -1) {
        Sections steps = section;
        items.add(HeadTitle(steps.heading));
        for (var method in steps.methods) {
          items.add(SubHeadTitle(method.name));
          for (var step in method.steps) {
            items.add(step);
          }
        }
      }
      if (section.type.indexOf('warnings') != -1) {
        Sections warnings = section;
        items.add(HeadTitle(warnings.heading));
        for (var method in warnings.list) {
          items.add(TipBody(method.html));
        }
      }
      if (section.type.indexOf('tips') != -1) {
        Sections tips = section;
        items.add(HeadTitle(tips.heading));
        for (var method in tips.list) {
          items.add(TipBody(method.html));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              color: ThemeData.dark().primaryColor.withOpacity(0.5),
              child: Text(data.title,style: TextStyle(fontSize: 16),),
            ),
            background: CachedNetworkImage(
              imageUrl: data.image.url,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.redAccent,
              ),
              onPressed: ()async {
                try{
                  await WikiProvider().insert(WikiCollectItem(data.title, data.image.url, data.id));
                  Toast.show("收藏成功", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                }catch(e){
                  Toast.show("已收藏", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                }
              },
            )
          ],
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.abstract.replaceAll(RegExp(r"(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%$#_]*)?"), "")),
          );
        }, childCount: 1)),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          var item = items[index];
          switch (item.runtimeType) {
            case HeadTitle:
              return HeadTitleWidget(item);
            case SubHeadTitle:
              return SubHeadTitleWidget(item);
            case TipBody:
              return TipWidget(item);
            case Steps:
              return StepWidget(item);
            default:
              return SizedBox();
          }
        }, childCount: items.length)),
      ],
    );
  }
}

class HeadTitleWidget extends StatelessWidget {
  final HeadTitle title;

  HeadTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title.title,
        style: textTitle.copyWith(
            color: Colors.white, decoration: TextDecoration.underline),
      ),
    );
  }
}

class SubHeadTitleWidget extends StatelessWidget {
  final SubHeadTitle title;

  SubHeadTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title.title,
        style: textSubTitle.copyWith(color: Colors.white),
      ),
    );
  }
}

class TipWidget extends StatelessWidget {
  final TipBody title;

  TipWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "○ ${title.body}",
        style: textBodyHint.copyWith(color: Colors.white),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final Steps step;

  StepWidget(this.step);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Visibility(
            child: CachedNetworkImage(
              imageUrl: step.whvid?.lrgimg ?? "",
            ),
            visible: step.whvid != null,
          ),
          Visibility(
            child: CachedNetworkImage(
              imageUrl: step.image?.url ?? "",
            ),
            visible: step.image != null,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Html(data: step.num + "." + step.summary),
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Html(
                data: step.html,
              ),
            ),
            visible: step.html != null && step.html.isNotEmpty,
          )
        ],
      ),
    );
  }
}
