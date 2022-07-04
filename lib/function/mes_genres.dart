import 'package:flutter_boutique/models/article.dart';

List<String> mesGenres(List<Article> mesArticles) {
  List<String> genres = [];
  genres.add(mesArticles[0].genre);
  for (var element in mesArticles) {
    if (genres.contains(element.genre)) {
    } else {
      genres.add(element.genre);
    }
  }
  return genres;
}
