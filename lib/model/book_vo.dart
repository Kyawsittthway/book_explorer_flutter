// To parse this JSON data, do
//
//     final bookVo = bookVoFromJson(jsonString);

import 'dart:convert';

BookVO bookVoFromJson(String str) => BookVO.fromJson(json.decode(str));

String bookVoToJson(BookVO data) => json.encode(data.toJson());

class BookVO {
  String id;
  String title;
  String subtitle;
  String authors;
  String image;
  String url;

  BookVO({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.image,
    required this.url,
  });

  factory BookVO.fromJson(Map<String, dynamic> json) => BookVO(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    authors: json["authors"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "authors": authors,
    "image": image,
    "url": url,
  };
}
