import 'package:flutter/material.dart';
import 'package:newsfeedapp/BLoC/category_news_bloc.dart';
import 'package:newsfeedapp/DataLayer/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoyNewsData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News",style: TextStyle(color: Colors.blue),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
    child: _loading? Center(
    child: Container(
      child: CircularProgressIndicator(),
    ),
    ) : SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            children: <Widget>[
              //Articles
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount:articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BlogTitle(imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
    ),
      )
    );
  }

  getCategoyNewsData() async{
    CategoryNewsClass news=CategoryNewsClass();
    //await news.getCategoryNews(widget.category);
    //articles=news.newsList;
    setState(() {
      _loading=false;
    });
  }

}

class BlogTitle extends StatelessWidget {

  final String imageUrl,title,desc,url;
  BlogTitle({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              articleUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl),
          ),
          SizedBox(height: 8,),
          Text(title,style: TextStyle(fontSize:18,color: Colors.black87,fontWeight: FontWeight.w500),),
          SizedBox(height: 8,),
          Text(desc,style: TextStyle(color: Colors.black54),)
        ],),
      ),
    );
  }


}

