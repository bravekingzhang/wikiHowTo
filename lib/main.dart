import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:wiki_howto_zh/page/index.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:wiki_howto_zh/page/search.dart';

void main() => runApp(MyApp());

final _debouncer = Debouncer<String>(Duration(milliseconds: 200));

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
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Image.asset('images/ic_launcher.png'),
                  ),
                ),
              ),
            ),
            ...List.generate(menuList.length, (index) {
              return ListTile(
                leading: menuList[index].icon,
                title: Text(menuList[index].title),
                onTap: () {},
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

  MenuItem({this.icon, this.title});
}

List<MenuItem> menuList = [
  MenuItem(
    icon: Image.asset(
      'images/featured.png',
      width: 24,
    ),
    title: 'feature',
  ),
  MenuItem(
    icon: Image.asset(
      'images/random.png',
      width: 24,
    ),
    title: 'random',
  ),
  MenuItem(
    icon: Image.asset(
      'images/bookmark.png',
      width: 24,
    ),
    title: 'bookmark',
  ),
  MenuItem(
    icon: Image.asset(
      'images/tool.png',
      width: 24,
    ),
    title: 'tool',
  ),
];
