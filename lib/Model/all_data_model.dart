// To parse this JSON data, do
//
//     final allDataModel = allDataModelFromJson(jsonString);

import 'dart:convert';

AllDataModel allDataModelFromJson(String str) => AllDataModel.fromJson(json.decode(str));

String allDataModelToJson(AllDataModel data) => json.encode(data.toJson());

class AllDataModel {
  int? success;
  String? message;
  Data? data;
  String? timestamp;

  AllDataModel({
    this.success,
    this.message,
    this.data,
    this.timestamp,
  });

  factory AllDataModel.fromJson(Map<String, dynamic> json) => AllDataModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "timestamp": timestamp,
  };
}

class Data {
  List<News>? news;
  List<TrandingBulletin>? trandingBulletin;
  String? specialityName;
  List<dynamic>? latestArticle;
  List<ExploreArticle>? exploreArticle;
  List<TrandingArticle>? trandingArticle;
  Article? article;
  List<Bulletin>? bulletin;
  int? sId;

  Data({
    this.news,
    this.trandingBulletin,
    this.specialityName,
    this.latestArticle,
    this.exploreArticle,
    this.trandingArticle,
    this.article,
    this.bulletin,
    this.sId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    news: json["news"] == null ? [] : List<News>.from(json["news"]!.map((x) => News.fromJson(x))),
    trandingBulletin: json["trandingBulletin"] == null ? [] : List<TrandingBulletin>.from(json["trandingBulletin"]!.map((x) => TrandingBulletin.fromJson(x))),
    specialityName: json["specialityName"],
    latestArticle: json["latestArticle"] == null ? [] : List<dynamic>.from(json["latestArticle"]!.map((x) => x)),
    exploreArticle: json["exploreArticle"] == null ? [] : List<ExploreArticle>.from(json["exploreArticle"]!.map((x) => ExploreArticle.fromJson(x))),
    trandingArticle: json["trandingArticle"] == null ? [] : List<TrandingArticle>.from(json["trandingArticle"]!.map((x) => TrandingArticle.fromJson(x))),
    article: json["article"] == null ? null : Article.fromJson(json["article"]),
    bulletin: json["bulletin"] == null ? [] : List<Bulletin>.from(json["bulletin"]!.map((x) => Bulletin.fromJson(x))),
    sId: json["sId"],
  );

  Map<String, dynamic> toJson() => {
    "news": news == null ? [] : List<dynamic>.from(news!.map((x) => x.toJson())),
    "trandingBulletin": trandingBulletin == null ? [] : List<dynamic>.from(trandingBulletin!.map((x) => x.toJson())),
    "specialityName": specialityName,
    "latestArticle": latestArticle == null ? [] : List<dynamic>.from(latestArticle!.map((x) => x)),
    "exploreArticle": exploreArticle == null ? [] : List<dynamic>.from(exploreArticle!.map((x) => x.toJson())),
    "trandingArticle": trandingArticle == null ? [] : List<dynamic>.from(trandingArticle!.map((x) => x.toJson())),
    "article": article?.toJson(),
    "bulletin": bulletin == null ? [] : List<dynamic>.from(bulletin!.map((x) => x.toJson())),
    "sId": sId,
  };
}

class Article {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  dynamic articleUniqueId;
  int? articleType;
  String? createdAt;

  Article({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "articleTitle": articleTitle,
    "redirectLink": redirectLink,
    "articleImg": articleImg,
    "articleDescription": articleDescription,
    "specialityId": specialityId,
    "rewardPoints": rewardPoints,
    "keywordsList": keywordsList,
    "articleUniqueId": articleUniqueId,
    "articleType": articleType,
    "createdAt": createdAt,
  };
}

class Bulletin {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  dynamic specialityId;
  int? rewardPoints;
  dynamic keywordsList;
  dynamic articleUniqueId;
  int? articleType;
  dynamic createdAt;

  Bulletin({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory Bulletin.fromJson(Map<String, dynamic> json) => Bulletin(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "articleTitle": articleTitle,
    "redirectLink": redirectLink,
    "articleImg": articleImg,
    "articleDescription": articleDescription,
    "specialityId": specialityId,
    "rewardPoints": rewardPoints,
    "keywordsList": keywordsList,
    "articleUniqueId": articleUniqueId,
    "articleType": articleType,
    "createdAt": createdAt,
  };
}

class ExploreArticle {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  String? articleUniqueId;
  int? articleType;
  String? createdAt;

  ExploreArticle({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory ExploreArticle.fromJson(Map<String, dynamic> json) => ExploreArticle(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "articleTitle": articleTitle,
    "redirectLink": redirectLink,
    "articleImg": articleImg,
    "articleDescription": articleDescription,
    "specialityId": specialityId,
    "rewardPoints": rewardPoints,
    "keywordsList": keywordsList,
    "articleUniqueId": articleUniqueId,
    "articleType": articleType,
    "createdAt": createdAt,
  };
}

class News {
  int? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  int? trendingLatest;
  String? publishedAt;

  News({
    this.id,
    this.title,
    this.url,
    this.urlToImage,
    this.description,
    this.speciality,
    this.newsUniqueId,
    this.trendingLatest,
    this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    description: json["description"],
    speciality: json["speciality"],
    newsUniqueId: json["newsUniqueId"],
    trendingLatest: json["trendingLatest"],
    publishedAt: json["publishedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "urlToImage": urlToImage,
    "description": description,
    "speciality": speciality,
    "newsUniqueId": newsUniqueId,
    "trendingLatest": trendingLatest,
    "publishedAt": publishedAt,
  };
}

class TrandingArticle {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  String? articleUniqueId;
  int? articleType;
  String? createdAt;

  TrandingArticle({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory TrandingArticle.fromJson(Map<String, dynamic> json) => TrandingArticle(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "articleTitle": articleTitle,
    "redirectLink": redirectLink,
    "articleImg": articleImg,
    "articleDescription": articleDescription,
    "specialityId": specialityId,
    "rewardPoints": rewardPoints,
    "keywordsList": keywordsList,
    "articleUniqueId": articleUniqueId,
    "articleType": articleType,
    "createdAt": createdAt,
  };
}

class TrandingBulletin {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  dynamic specialityId;
  int? rewardPoints;
  dynamic keywordsList;
  dynamic articleUniqueId;
  int? articleType;
  dynamic createdAt;

  TrandingBulletin({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory TrandingBulletin.fromJson(Map<String, dynamic> json) => TrandingBulletin(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "articleTitle": articleTitle,
    "redirectLink": redirectLink,
    "articleImg": articleImg,
    "articleDescription": articleDescription,
    "specialityId": specialityId,
    "rewardPoints": rewardPoints,
    "keywordsList": keywordsList,
    "articleUniqueId": articleUniqueId,
    "articleType": articleType,
    "createdAt": createdAt,
  };
}
