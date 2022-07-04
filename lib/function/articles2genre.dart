import 'package:flutter_boutique/models/article.dart';

List<Article> articles2genre(String genre,List<Article> articles){
  List<Article> newArticles = [];
  for (var element in articles) {
    if (genre == element.genre) {
      newArticles.add(element);
    }
  }
  return newArticles;
}