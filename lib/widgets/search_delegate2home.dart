import 'package:flutter_boutique/data/my_articles.dart';
import 'package:flutter_boutique/widgets/categorie.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomSearchDelegate2Home extends SearchDelegate{
  CustomSearchDelegate2Home() : super(
    searchFieldLabel: 'Recherche',
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );
  // List searchTems = [];
  // myArticles.forEach((element) {
  //   searchTems.add(element.genre);
  //   searchTems.add(element.nom);
  // });
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        onPressed: (){
        query = '';
        },
        icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        onPressed: (){
        close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    // List<String> genres = mesGenres(myArticles);
    // for (var article in genres) {
    //   if (article.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(article);
    //   }
    // }
    for (var article in myArticles) {
      if (article.genre.toLowerCase().contains(query.toLowerCase()) || article.nom.toLowerCase().contains(query.toLowerCase())) {
        if (matchQuery.isEmpty) {
          matchQuery.add(article.genre);
        } else {
          if (matchQuery.contains(article.genre)) {
            continue;
          } else {
            matchQuery.add(article.genre);
          }
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return Categorie(maCategorie: result);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
     List<String> matchQuery = [];
    // List<String> genres = mesGenres(myArticles);
    // for (var article in genres) {
    //   if (article.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(article);
    //   }
    // }
    for (var article in myArticles) {
      if (article.genre.toLowerCase().contains(query.toLowerCase()) || article.nom.toLowerCase().contains(query.toLowerCase())) {
        if (matchQuery.isEmpty) {
          matchQuery.add(article.genre);
        } else {
          if (matchQuery.contains(article.genre)) {
            continue;
          } else {
            matchQuery.add(article.genre);
          }
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return Categorie(maCategorie: result);
      },
    );
  }
}