import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:wiki_howto_zh/page/collect.dart';
import 'package:wiki_howto_zh/page/index.dart';
import 'package:wiki_howto_zh/page/search.dart';
import 'package:wiki_howto_zh/style/styles.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
      theme: ThemeData.dark(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('怎渡'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Search();
              }));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            'https://avatars0.githubusercontent.com/u/4476322?s=460&v=4'),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'hz',
                      style: textTitle.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            ...List.generate(menuList.length, (index) {
              return ListTile(
                leading: menuList[index].icon,
                title: Text(menuList[index].title),
                onTap: () {
                  menuList[index].onTap(context);
                },
              );
            }).toList()
          ],
        ),
      ),
      body: IndexList(),
    );
  }
}

class MenuItem {
  Widget icon;
  String title;
  ValueChanged onTap;

  MenuItem({this.icon, this.title, this.onTap});
}

List<MenuItem> menuList = [
  MenuItem(
      icon: Image.asset(
        'images/featured.png',
        width: 24,
        color: Colors.white,
        colorBlendMode: BlendMode.srcOut,
      ),
      title: '本期推荐',
      onTap: (context) {
        Navigator.of(context).pop();
      }),
//  MenuItem(
//      icon: Image.asset(
//        'images/random.png',
//        width: 24,
//      ),
//      title: 'random',
//      onTap: () {}),
  MenuItem(
      icon: Image.asset(
        'images/bookmark.png',
        width: 24,
      ),
      title: '收藏',
      onTap: (context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
          return Collect();
        }));
        Navigator.of(context).pop();
      }),
  MenuItem(
      icon: Image.asset(
        'images/tool.png',
        width: 24,
      ),
      title: '应急工具',
      onTap: (context) {
        Toast.show("噢，还在开发中..", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        Navigator.of(context).pop();
      }),
  MenuItem(
      icon: Image.asset(
        'images/github.png',
        width: 24,
      ),
      title: 'github',
      onTap: (context) async {
        var url = 'https://github.com/bravekingzhang';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
        Navigator.of(context).pop();
      }),
];
