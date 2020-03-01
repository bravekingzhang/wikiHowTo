class SearchResponse {
  ResponseHeader responseHeader;
  SResponse response;

  SearchResponse({this.responseHeader, this.response});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    responseHeader = json['responseHeader'] != null
        ? new ResponseHeader.fromJson(json['responseHeader'])
        : null;
    response = json['response'] != null
        ? new SResponse.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseHeader != null) {
      data['responseHeader'] = this.responseHeader.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class ResponseHeader {
  int status;
  int qTime;
  Params params;

  ResponseHeader({this.status, this.qTime, this.params});

  ResponseHeader.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    qTime = json['QTime'];
    params =
    json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['QTime'] = this.qTime;
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    return data;
  }
}

class Params {
  String mm;
  String q;
  String defType;
  String bf;
  String fl;
  String rows;
  String wt;

  Params({this.mm, this.q, this.defType, this.bf, this.fl, this.rows, this.wt});

  Params.fromJson(Map<String, dynamic> json) {
    mm = json['mm'];
    q = json['q'];
    defType = json['defType'];
    bf = json['bf'];
    fl = json['fl'];
    rows = json['rows'];
    wt = json['wt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mm'] = this.mm;
    data['q'] = this.q;
    data['defType'] = this.defType;
    data['bf'] = this.bf;
    data['fl'] = this.fl;
    data['rows'] = this.rows;
    data['wt'] = this.wt;
    return data;
  }
}

class SResponse {
  int numFound;
  int start;
  List<Docs> docs;

  SResponse({this.numFound, this.start, this.docs});

  SResponse.fromJson(Map<String, dynamic> json) {
    numFound = json['numFound'];
    start = json['start'];
    if (json['docs'] != null) {
      docs = new List<Docs>();
      json['docs'].forEach((v) {
        docs.add(new Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numFound'] = this.numFound;
    data['start'] = this.start;
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  int id;
  String title;
  String image58x58;

  Docs({this.id, this.title, this.image58x58});

  Docs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image58x58 = json['image_58x58'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_58x58'] = this.image58x58;
    return data;
  }
}
