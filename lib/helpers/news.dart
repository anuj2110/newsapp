import 'dart:convert';

import 'package:NewsApp/Models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6ac8d3913a244390a2fadb01d2665aa8";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["desc"]!=null){
          ArticleModel article = ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            desc: element["description"],
            publishedAt: element["publishedAt"]
          );
          news.add(article);
        }
      });
    }
  }
}
