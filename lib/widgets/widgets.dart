import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:NewsApp/views/article_view.dart';
import 'package:NewsApp/views/category_view.dart';

class CategoryTile extends StatelessWidget {
  final imageURL;
  final categoryName;

  CategoryTile({this.imageURL, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryView(category: categoryName,)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageURL,
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
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
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
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc, url;
  BlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticlView(blogURL: url)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageURL,
                  width: MediaQuery.of(context).size.width,
                )),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget Appbar() {
  return AppBar(
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
  );
}

PreferredSizeWidget AppbarCenter() {
  return AppBar(
    actions: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
      )
    ],
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
  );
}
