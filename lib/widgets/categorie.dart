import 'package:flutter_boutique/data/my_articles.dart';
import 'package:flutter_boutique/function/articles2genre.dart';
import 'package:flutter_boutique/screens/categorie_page.dart';
import 'package:flutter_boutique/screens/un_article.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Categorie extends StatelessWidget {
  const Categorie({Key? key, required this.maCategorie}) : super(key: key);
  final String maCategorie;

  @override
  Widget build(BuildContext context) {
    var articles = articles2genre(maCategorie, myArticles);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  maCategorie,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 25),
                ),
                NeumorphicButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriePage(
                              genre: maCategorie, articles: articles),
                        ));
                  },
                )
              ],
            )),
            Expanded(
              child: ListView.builder(
                  itemCount: articles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => NeumorphicButton(
                        style: const NeumorphicStyle(
                          depth: 7,
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/${articles[index].photo[0]}',
                          fit: BoxFit.fitHeight,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UnArticle(article: articles[index])));
                        },
                      )),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
