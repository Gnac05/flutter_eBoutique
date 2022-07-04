
import 'package:flutter_boutique/models/article.dart';
import 'package:flutter_boutique/widgets/one_article.dart';
import 'package:flutter_boutique/widgets/search_delegate2categorie_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
List<Article>? copieArticles21genre;

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key, required this.articles, required this.genre})
      : super(key: key);
  final String genre;
  final List<Article> articles;

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: const NeumorphicBackButton(),
        title: Text(widget.genre),
        centerTitle: true,
        actions: [
          NeumorphicButton(
            child: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                copieArticles21genre = widget.articles;
              });
              showSearch(context: context,delegate: CustomSearchDelegate2CategoriePage());
            },
          ),
        ],
      ),
      body: SizedBox(
        child: ListView.builder(
          itemCount: widget.articles.length,
          itemBuilder: (BuildContext context, int index) {
            return OneArticle(oneArticle: widget.articles[index]);
          },
        ),
      ),
    );
  }
}

