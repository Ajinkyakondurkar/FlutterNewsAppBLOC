import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsfeedapp/helper/data.dart';
import 'package:newsfeedapp/helper/news.dart';
import 'package:newsfeedapp/model/article_model.dart';
import 'package:newsfeedapp/model/category_model.dart';
import 'package:newsfeedapp/views/category_news.dart';

import 'article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList=new List<CategoryModel>();
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList=getCategories();
    getNewsData();
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
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
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
      ),
    );
  }

  getNewsData() async{
    News news=News();
    await news.getNews();
    articles=news.newsList;
    setState(() {
      _loading=false;
    });
  }

}

class CategoryTitle extends StatelessWidget {
  final imageUrl,categoryName;
  CategoryTitle({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:  (context) => CategoryNews(
            category: categoryName.toString().toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26
              ) ,
              child: Text(categoryName,style: TextStyle(
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

