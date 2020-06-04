class ArticleModel{

  String author;
  String title;
  String desc;
  String url;
  String urlToImage;
  String content;
  // DateTime publishedAt;

  ArticleModel(
    {
      this.author,
      this.title,
      this.url,
      this.urlToImage,
      this.desc,
      this.content,
      // this.publishedAt
    }
  );
}