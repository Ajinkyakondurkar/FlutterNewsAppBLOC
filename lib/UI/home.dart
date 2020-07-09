import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsfeedapp/BLoC/news_bloc.dart';
import 'package:newsfeedapp/DataLayer/article_model.dart';
import 'package:newsfeedapp/DataLayer/news_model.dart';
import 'package:newsfeedapp/UI/category_news.dart';

import 'article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsBloc newsBloc;
  //NewsBloc newsData;
  InheritedNewsList inheritedNewsList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   /*
    scheduleMicrotask(()async{
      await newsBloc.fetchNewsData();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    inheritedNewsList= InheritedNewsList.of(context);
    newsBloc=inheritedNewsList.data;
    newsBloc.newsFetchController.add("event");
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text("News", style: TextStyle(color: Colors.blue),)
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
        body: Container(
            child: StreamBuilder<List<ArticleModel>>(
              stream: newsBloc.newsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ArticleModel> articleList = snapshot.data;
                  return _NewsListView(articleList);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center
                  (child: CircularProgressIndicator());
              },
            )
        ),
      );
  }

  @override
  void dispose() {
    newsBloc.dispose();
    // TODO: implement dispose
    super.dispose();
  }
/*body: Center(
        child: _loading? Container(
          child: CircularProgressIndicator(),
        ):SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: <Widget>[
                Container(
                  height: 70,
                  child: ListView.builder(
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return CategoryTitle(
                          imageUrl: categoryList[index].imageUrl,
                          categoryName: categoryList[index].categoryName,
                        );
                      }),
                ),

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
      ),*/

}

class CategoryTitle extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTitle({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                CategoryNews(
                  category: categoryName.toString().toLowerCase(),
                )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26
              ),
              child: Text(categoryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }
}

ListView _NewsListView(articleList) {
  return ListView.builder(
      itemCount: articleList.length,
      itemBuilder: (context, index) {
        return BlogTitle(imageUrl: articleList[index].urlToImage,
          title: articleList[index].title,
          desc: articleList[index].description,
          url: articleList[index].url,
        );
      });
}

Container _buildNewsScreen(NewsModel data) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: <Widget>[
        //Articles
        Container(
          padding: EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: data.articleList.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return BlogTitle(imageUrl: data.articleList[index].urlToImage,
                  title: data.articleList[index].title,
                  desc: data.articleList[index].description,
                  url: data.articleList[index].url,
                );
              }),
        )
      ],
    ),
  );
}

class BlogTitle extends StatelessWidget {

  final String imageUrl, title, desc, url;

  BlogTitle(
      {@required this.imageUrl, @required this.title, @required this.desc, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                ArticleView(
                  articleUrl: url,
                )
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl),
          ),
          SizedBox(height: 8,),
          Text(title, style: TextStyle(fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500),),
          SizedBox(height: 8,),
          Text(desc, style: TextStyle(color: Colors.black54),)
        ],),
      ),
    );
  }



}

class InheritedNewsList extends InheritedWidget{
  final NewsBloc data;

  InheritedNewsList({Key key,@required this.data ,@required Widget child}) : super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedNewsList of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

}

