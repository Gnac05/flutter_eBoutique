import 'package:flutter_boutique/models/article.dart';
import 'package:flutter_boutique/screens/categorie_page.dart';
import 'package:flutter_boutique/widgets/one_article.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomSearchDelegate2CategoriePage extends SearchDelegate{
  CustomSearchDelegate2CategoriePage() : super(
    searchFieldLabel: 'Recherche',
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );
  // const Home({Key? key}) : super(key: key);
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
    List<Article> matchQuery = [];
    // List<String> genres = mesGenres(myArticles);
    // for (var article in genres) {
    //   if (article.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(article);
    //   }
    // }
    for (var article in copieArticles21genre!) {
      if (article.nom.toLowerCase().contains(query.toLowerCase())) {
        if (matchQuery.isEmpty) {
          matchQuery.add(article);
        } else {
          if (matchQuery.contains(article)) {
            continue;
          } else {
            matchQuery.add(article);
          }
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return OneArticle(oneArticle: result);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
     List<Article> matchQuery = [];
    // List<String> genres = mesGenres(myArticles);
    // for (var article in genres) {
    //   if (article.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(article);
    //   }
    // }
    for (var article in copieArticles21genre!) {
      if (article.nom.toLowerCase().contains(query.toLowerCase())) {
        if (matchQuery.isEmpty) {
          matchQuery.add(article);
        } else {
          if (matchQuery.contains(article)) {
            continue;
          } else {
            matchQuery.add(article);
          }
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return OneArticle(oneArticle: result);
      },
    );
  }
}
