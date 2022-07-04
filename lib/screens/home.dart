import 'package:flutter_boutique/data/mes_genres.dart';
import 'package:flutter_boutique/widgets/categorie.dart';
import 'package:flutter_boutique/widgets/search_delegate2home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text("All In One"),
        actions: [
          NeumorphicButton(
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate:CustomSearchDelegate2Home());
            },
          ),
        ],
      ),
      body:SizedBox(
          child: ListView.builder(
            itemCount: genres.length,
            itemBuilder: (BuildContext context, int index) {
              return Categorie(maCategorie: genres[index]);
            },
          ),
      )
    );
  }
}
