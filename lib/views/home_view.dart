import 'package:NewsApp/Models/article_model.dart';
import 'package:NewsApp/Models/category_model.dart';
import 'package:NewsApp/helpers/data.dart';
import 'package:NewsApp/helpers/news.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    articles = getNews();
  }

  getNews() async {
    News newsClass = new News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _loading
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imageURL: categories[index].imageURL,
                          categoryName: categories[index].categoryName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageURL;
  final categoryName;

  CategoryTile({this.imageURL, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageURL,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.black26),
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc;
  BlogTile(
      {@required this.imageURL, @required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Image.network(imageURL), Text(title), Text(desc)],
      ),
    );
  }
}
