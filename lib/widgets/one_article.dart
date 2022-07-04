import 'package:flutter_boutique/models/article.dart';
import 'package:flutter_boutique/screens/un_article.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OneArticle extends StatelessWidget {
  const OneArticle({Key? key, required this.oneArticle}) : super(key: key);
  final Article oneArticle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeumorphicButton(
          style: const NeumorphicStyle(depth: -20),
          child: Row(
            children: [
              Expanded(
                child: Image.asset('assets/images/${oneArticle.photo[0]}'),
                flex: 2,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Neumorphic(
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.concave),
                          child: SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  oneArticle.nom,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              )),
                        ),
                      ),
                      if (oneArticle.marque != '')
                        const SizedBox(
                          height: 8,
                        ),
                      if (oneArticle.marque != '')
                        Expanded(
                          child: Neumorphic(
                            style: const NeumorphicStyle(
                                shape: NeumorphicShape.concave),
                            child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    oneArticle.marque,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                          ),
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Neumorphic(
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.concave),
                          child: SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  '${oneArticle.prix} FCFA',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 3,
              )
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UnArticle(article: oneArticle)));
          },
        ),
      ),
    );
  }
}
