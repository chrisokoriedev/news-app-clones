import 'package:news_app/model/source.dart';

class ArticleModel {
  final SourceModel source;
  final String author;
  final String title;
  final String url;
  final String description;
  final String content;
  final String img;
  final String date;

  ArticleModel(this.author, this.title, this.url, this.description,
      this.content, this.img, this.date, this.source);

  ArticleModel.fromJson(Map<String, dynamic> json)
      : author = json["author"],
        source =SourceModel.fromJson( json["source"]),
        title = json["title"],
        description = json["description"],
        url = json["url"],
        img = json["urlToImage"],
        date = json["publishAt"],
        content = json["content"];
}
