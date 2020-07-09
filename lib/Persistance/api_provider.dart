import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' show Client;
import 'package:newsfeedapp/DataLayer/news_model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=55818c3fd49b4c639afec380576e59d0";

  Future<NewsModel> getNews() async {
    var response = await client.get("$_baseUrl");
    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load News');
    }
  }
}