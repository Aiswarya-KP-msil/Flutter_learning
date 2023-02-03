import 'dart:convert';

import 'package:flutter/material.dart';



class ApiResultModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  ApiResultModel({
    @required this.albumId,
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.thumbnailUrl,
  });

  factory ApiResultModel.fromJson(Map<String, dynamic> json) => ApiResultModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}