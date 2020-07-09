
import 'dart:async';
import 'dart:developer';
import 'package:newsfeedapp/DataLayer/article_model.dart';
import 'package:newsfeedapp/DataLayer/news_model.dart';
import 'package:newsfeedapp/Persistance/api_provider.dart';
import 'package:newsfeedapp/Persistance/repository.dart';

class NewsBloc{


  Repository _repository = new Repository();

  //ApiProvider apiProvider=new ApiProvider();

  final newsController = StreamController<List<ArticleModel>>();

  final newsFetchController = StreamController<String>();

  Stream<List<ArticleModel>> get newsStream => newsController.stream;

  StreamSink<List<ArticleModel>> get newsSink => newsController.sink;

  //Stream<String> get fetchNewsDataStream => _newsFetchController.stream;

  //StreamSink<String> get fecthNewsDataSink => _newsFetchController.sink;
  NewsBloc(){
    newsFetchController.stream.listen((event) {
      fetchNewsData(event);
    });
  }
  Future<void> fetchNewsData(String news) async {
    NewsModel newsResponse = await _repository.fetchNewsData();
    newsController.sink.add(newsResponse.articleList);
  }

  dispose() {
    newsController.close();
  }

}
