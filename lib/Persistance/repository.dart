import 'package:newsfeedapp/DataLayer/news_model.dart';
import 'package:newsfeedapp/Persistance/api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<NewsModel> fetchNewsData() {
    return appApiProvider.getNews();
  }
}