import 'dart:convert';

class TopStoriesModel {
  TopStoriesModel({
    required this.section,
    required this.subsection,
    required this.title,
    this.topStoriesModelAbstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.itemType,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    required this.multimedia,
    required this.shortUrl,
  });

  final String section;
  final String subsection;
  final String title;
  final String? topStoriesModelAbstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final DateTime updatedDate;
  final DateTime createdDate;
  final DateTime publishedDate;
  final String materialTypeFacet;
  final List<Multimedia> multimedia;
  final String shortUrl;

  factory TopStoriesModel.fromRawJson(String str) =>
      TopStoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopStoriesModel.fromJson(Map<String, dynamic> json) =>
      TopStoriesModel(
        section: json["section"],
        subsection: json["subsection"],
        title: json["title"],
        topStoriesModelAbstract: json["abstract"],
        url: json["url"],
        uri: json["uri"],
        byline: json["byline"],
        itemType: json["item_type"],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdDate: DateTime.parse(json["created_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        materialTypeFacet: json["material_type_facet"],
        multimedia: List<Multimedia>.from(
            json["multimedia"].map((x) => Multimedia.fromJson(x))),
        shortUrl: json["short_url"],
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "subsection": subsection,
        "title": title,
        "abstract": topStoriesModelAbstract,
        "url": url,
        "uri": uri,
        "byline": byline,
        "item_type": itemType,
        "updated_date": updatedDate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
        "published_date": publishedDate.toIso8601String(),
        "material_type_facet": materialTypeFacet,
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "short_url": shortUrl,
      };
}

class Multimedia {
  Multimedia({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  factory Multimedia.fromRawJson(String str) =>
      Multimedia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
      };
}
