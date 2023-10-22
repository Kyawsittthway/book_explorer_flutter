// To parse this JSON data, do
//
//     final baseResponseVo = baseResponseVoFromJson(jsonString);

import 'dart:convert';

import 'book_vo.dart';

BaseResponseVO baseResponseVoFromJson(String str) => BaseResponseVO.fromJson(json.decode(str));

String baseResponseVoToJson(BaseResponseVO data) => json.encode(data.toJson());

class BaseResponseVO {
  String status;
  dynamic total;
  List<BookVO> books;

  BaseResponseVO({
    required this.status,
    required this.total,
    required this.books,
  });

  factory BaseResponseVO.fromJson(Map<String, dynamic> json) => BaseResponseVO(
    status: json["status"],
    total: json["total"],
    books: List<BookVO>.from(json["books"].map((x) => BookVO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}


