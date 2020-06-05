import 'package:flutter/material.dart';
import 'package:NewsApp/widgets/widgets.dart';
import 'package:NewsApp/helpers/news.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({@required this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var articles= [];
  bool _loading = true;

   void getCatNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.categnews;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    
    super.initState();
    getCatNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppbarCenter(),
      body: Container(
        child: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :
          SingleChildScrollView(
                      child: Column(
            children: <Widget>[
              Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageURL: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].desc,
                                url: articles[index].url,
                              );
                            }),
                      )
            ],
        ),
          ),
      ),

    );
  }
}