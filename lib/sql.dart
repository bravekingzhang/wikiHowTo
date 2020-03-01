import 'package:sqflite/sqflite.dart';

final String tableWiki = 'collect';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnImage = 'image';

class WikiCollectItem {
  int id;
  String title;
  String image;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnTitle: title, columnImage: image};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  WikiCollectItem(this.title, this.image, this.id);

  WikiCollectItem.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    image = map[columnImage];
  }
}

class WikiProvider {
  Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'wikiHow.db';
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableWiki ( 
  $columnId integer primary key, 
  $columnTitle text not null,
  $columnImage text not null)
''');
    });
  }

  Future<WikiCollectItem> insert(WikiCollectItem wikiItem) async {
    if (db == null) {
      await open();
    }
    wikiItem.id = await db.insert(tableWiki, wikiItem.toMap());
    return wikiItem;
  }

  Future<List<WikiCollectItem>> listWiki() async {
    if (db == null) {
      await open();
    }
    List<Map> maps = await db.query(
      tableWiki,
      columns: [columnId, columnImage, columnTitle],
    );
    if (maps.length > 0) {
      List<WikiCollectItem> list = [];
      for (var wiki in maps) {
        list.add(WikiCollectItem.fromMap(wiki));
      }
      return list;
    }
    return null;
  }

  Future<int> delete(int id) async {
    if (db == null) {
      await open();
    }
    return await db.delete(tableWiki, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async {
    if (db == null) {
      await db.close();
    }
  }
}
