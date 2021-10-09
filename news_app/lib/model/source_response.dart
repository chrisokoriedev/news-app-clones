import 'package:news_app/model/article.dart';

class SourceResponse {
  final List<ArticleModel> articles;
  final String error;

  SourceResponse(this.articles, this.error);
  SourceResponse.fromJson(Map<String,dynamic>json)
      :articles=(json["article"]as List).map((i) => new ArticleModel.fromJson(i)).toList(),
        error ="";
  SourceResponse.withError(String errorValue)
      :articles=List (),
        error =errorValue;

}
