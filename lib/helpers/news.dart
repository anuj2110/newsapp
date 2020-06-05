import 'dart:convert';

import 'package:NewsApp/Models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=6ac8d3913a244390a2fadb01d2665aa8";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
  
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            desc: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> categnews = [];
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=6ac8d3913a244390a2fadb01d2665aa8";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
  
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            desc: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          categnews.add(article);
        }

      });
    }
  }
}
