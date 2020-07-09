

class CategoryNewsClass{
  /*List<ArticleModel> newsList=[];

  Future<void> getCategoryNews(String category) async {
    String url= "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=55818c3fd49b4c639afec380576e59d0";

    var response= await http.get(url);

    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel=new ArticleModel(
              title: element['title'],
              author: element['author'],
              description:element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );
          newsList.add(articleModel);
        }
      });
    }

  }*/
}