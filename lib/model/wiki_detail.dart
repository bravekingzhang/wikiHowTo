class WiKiDetailResponse {
  App app;

  WiKiDetailResponse({this.app});

  WiKiDetailResponse.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? new App.fromJson(json['app']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.app != null) {
      data['app'] = this.app.toJson();
    }
    return data;
  }
}

class App {
  int id;
  int revisionId;
  String title;
  String fulltitle;
  String url;
  Image image;
  String abstract;
  List<Sections> sections;
  bool random;
  List<String> authors;

  App(
      {this.id,
      this.revisionId,
      this.title,
      this.fulltitle,
      this.url,
      this.image,
      this.abstract,
      this.sections,
      this.random,
      this.authors});

  App.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revisionId = json['revision_id'];
    title = json['title'];
    fulltitle = json['fulltitle'];
    url = json['url'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    abstract = json['abstract'];
    if (json['sections'] != null) {
      sections = new List<Sections>();
      json['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
    random = json['random'];
    authors = json['authors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['revision_id'] = this.revisionId;
    data['title'] = this.title;
    data['fulltitle'] = this.fulltitle;
    data['url'] = this.url;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['abstract'] = this.abstract;
    if (this.sections != null) {
      data['sections'] = this.sections.map((v) => v.toJson()).toList();
    }
    data['random'] = this.random;
    data['authors'] = this.authors;
    return data;
  }
}

class Image {
  String url;
  int width;
  int height;
  String large;
  int largeWidth;
  int largeHeight;
  String original;
  int originalWidth;
  int originalHeight;

  Image(
      {this.url,
      this.width,
      this.height,
      this.large,
      this.largeWidth,
      this.largeHeight,
      this.original,
      this.originalWidth,
      this.originalHeight});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    large = json['large'];
    largeWidth = json['large_width'];
    largeHeight = json['large_height'];
    original = json['original'];
    originalWidth = json['original_width'];
    originalHeight = json['original_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['large'] = this.large;
    data['large_width'] = this.largeWidth;
    data['large_height'] = this.largeHeight;
    data['original'] = this.original;
    data['original_width'] = this.originalWidth;
    data['original_height'] = this.originalHeight;
    return data;
  }
}

class Sections {
  String html;
  String type;
  Image image;
  String heading;
  List<Methods> methods;
  List<ListItem> list;

  Sections(
      {this.html,
      this.type,
      this.image,
      this.heading,
      this.methods,
      this.list});

  Sections.fromJson(Map<String, dynamic> json) {
    html = json['html'];
    type = json['type'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    heading = json['heading'];
    if (json['methods'] != null) {
      methods = new List<Methods>();
      json['methods'].forEach((v) {
        methods.add(new Methods.fromJson(v));
      });
    }
    if (json['list'] != null) {
      list = new List<ListItem>();
      json['list'].forEach((v) {
        list.add(new ListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['html'] = this.html;
    data['type'] = this.type;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['heading'] = this.heading;
    if (this.methods != null) {
      data['methods'] = this.methods.map((v) => v.toJson()).toList();
    }
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Methods {
  String name;
  String type;
  List<Steps> steps;

  Methods({this.name, this.type, this.steps});

  Methods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['steps'] != null) {
      steps = new List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  String num;
  Whvid whvid;
  String summary;
  String html;
  Image image;

  Steps({this.num, this.whvid, this.summary, this.html, this.image});

  Steps.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    whvid = json['whvid'] != null ? new Whvid.fromJson(json['whvid']) : null;
    summary = json['summary'];
    html = json['html'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    if (this.whvid != null) {
      data['whvid'] = this.whvid.toJson();
    }
    data['summary'] = this.summary;
    data['html'] = this.html;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}

class Whvid {
  String lrgimg;
  String smlimg;
  String vid;

  Whvid({this.lrgimg, this.smlimg, this.vid});

  Whvid.fromJson(Map<String, dynamic> json) {
    lrgimg = json['lrgimg'];
    smlimg = json['smlimg'];
    vid = json['vid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lrgimg'] = this.lrgimg;
    data['smlimg'] = this.smlimg;
    data['vid'] = this.vid;
    return data;
  }
}

class ListItem {
  String html;

  ListItem({this.html});

  ListItem.fromJson(Map<String, dynamic> json) {
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['html'] = this.html;
    return data;
  }
}
