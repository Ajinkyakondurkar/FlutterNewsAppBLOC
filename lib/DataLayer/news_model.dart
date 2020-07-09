import 'dart:developer';
import 'package:newsfeedapp/DataLayer/article_model.dart';

class NewsModel {
  final int totalResults;
  final String status;
  final List<ArticleModel>  articleList;

  NewsModel({this.totalResults, this.status, this.articleList});


  factory NewsModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['articles'] as List;
    print(list.runtimeType);
    List<ArticleModel> articles = list.map((i) => ArticleModel.fromJson(i)).toList();

    return NewsModel(
      totalResults: parsedJson['totalResults'],
      status: parsedJson['status'],
      articleList: articles,
    );
  }
}