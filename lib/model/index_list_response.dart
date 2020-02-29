class IndexListResponse {
  App app;

  IndexListResponse({this.app});

  IndexListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Articles> articles;

  App({this.articles});

  App.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int id;
  int revisionId;
  String title;
  String fulltitle;
  String url;
  Image image;
  String image58x58;
  String abstract;

  Articles(
      {this.id,
        this.revisionId,
        this.title,
        this.fulltitle,
        this.url,
        this.image,
        this.image58x58,
        this.abstract});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revisionId = json['revision_id'];
    title = json['title'];
    fulltitle = json['fulltitle'];
    url = json['url'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    image58x58 = json['image_58x58'];
    abstract = json['abstract'];
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
    data['image_58x58'] = this.image58x58;
    data['abstract'] = this.abstract;
    return data;
  }

  @override
  String toString() {
    return 'Articles{id: $id, revisionId: $revisionId, title: $title, fulltitle: $fulltitle, url: $url, image: $image, image58x58: $image58x58, abstract: $abstract}';
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

  @override
  String toString() {
    return 'Image{url: $url, width: $width, height: $height, large: $large, largeWidth: $largeWidth, largeHeight: $largeHeight, original: $original, originalWidth: $originalWidth, originalHeight: $originalHeight}';
  }

}
