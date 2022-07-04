import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_boutique/models/article.dart';
import 'package:flutter_boutique/utils/regex.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

class UnArticle extends StatefulWidget {
  const UnArticle({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  State<UnArticle> createState() => _UnArticleState();
}

bool shouldIValidate = false;
int nbArticle = 1;

CarouselController carouselController = CarouselController();

int activeIndex = 0;

TextEditingController controller = TextEditingController();

String userEmail = '';

class _UnArticleState extends State<UnArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: NeumorphicBackButton(
          onPressed: () {
            activeIndex = 0;
            // userEmail ='';
            Navigator.pop(context);
            nbArticle=1;
          },
        ),
        title: Text(widget.article.nom),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: widget.article.photo.length,
                            itemBuilder: (context, index, realIndex) =>
                                GestureDetector(
                                  child: Image.asset(
                                      'assets/images/${widget.article.photo[index]}'),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            children: [
                                              const Expanded(child: SizedBox()),
                                              Expanded(
                                                flex: 3,
                                                child: Dialog(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/images/${widget.article.photo[index]}'),
                                                  ),
                                                ),
                                              ),
                                              const Expanded(child: SizedBox())
                                            ],
                                          );
                                        });
                                  },
                                ),
                            options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                viewportFraction: 0.6,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                })),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                            flex: 3,
                          ),
                          Expanded(
                            child: ClipRRect(
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(color: Colors.transparent)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  flex: 8,
                ),
                if (widget.article.photo.length != 1)
                  Expanded(
                      child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: widget.article.photo.length,
                    effect: const WormEffect(type: WormType.thin),
                    onDotClicked: (newIndex) {
                      carouselController.jumpToPage(newIndex);
                    },
                  ))
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Neumorphic(
                child: ListView(
                  children: [
                    const SizedBox(height: 7),
                    Center(
                        child: Text(
                      widget.article.genre,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 10),
                    if (widget.article.marque != '')
                      Center(
                          child: Text(
                        widget.article.marque,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 25),
                      )),
                    Center(
                        child: Text('${widget.article.prix} FCFA',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 25))),
                    Neumorphic(
                      margin: const EdgeInsets.all(12),
                      child: Center(
                          child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Entrez votre email',
                            border: OutlineInputBorder()),
                        controller: controller,
                        autovalidateMode: shouldIValidate
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (v) {
                          if (emailRegex.hasMatch(v?.trim() ?? "")) {
                            userEmail = controller.text;
                            return null;
                          }
                          return "Email incorrect";
                        },
                      )
                          //  TextField(
                          //   controller: controller,
                          //   keyboardType: TextInputType.emailAddress,
                          //   decoration:const InputDecoration(
                          //     hintText: 'Entrer votre E-mail',
                          //     prefixIcon: Icon(Icons.mail),
                          //     border: OutlineInputBorder()
                          //   ),
                          // ),
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text("Nombre ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 25)),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                              child: Center(
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  nbArticle = nbArticle + 5;
                                });
                              },
                              child: NeumorphicButton(
                                child: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    nbArticle++;
                                  });
                                },
                              ),
                            ),
                          )),
                          Expanded(
                              child: Center(
                            child: Text("$nbArticle",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 20)),
                          )),
                          Expanded(
                              child: Center(
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  nbArticle = 1;
                                });
                              },
                              child: NeumorphicButton(
                                child: const Icon(Icons.remove),
                                onPressed: () {
                                  if (nbArticle != 1) {
                                    setState(() {
                                      nbArticle--;
                                    });
                                  }
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NeumorphicButton(
                      style: const NeumorphicStyle(color: Colors.blue),
                      margin: const EdgeInsets.all(20),
                      child: const Center(
                          child: Text(
                        'Passer Votre Commande',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      )),
                      onPressed: () async {
                        print(controller.text);
                        setState(() {
                          shouldIValidate = true;
                        });
                        // userEmail == '' ? print("Mauvais") : print("Bon email");
                        if (userEmail == '') {
                          print("Mauvais");
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  duration: Duration(milliseconds: 1000),
                                  content: Text(
                                    'Format email incorrect !!',
                                    overflow: TextOverflow.ellipsis,
                                  )));
                        } else {
                          print("Bon email");
                          var hasWhatsapp = await WhatsappShare.isInstalled();
                          hasWhatsapp!
                              ? WhatsappShare.share(
                                  phone: "22995425623",
                                  text:
                                      "Nom : ${widget.article.nom}\nMarque : ${widget.article.marque}\nGenre : ${widget.article.genre}\nPrix Unitaire : ${widget.article.prix}\nNombre désiré : ${nbArticle.toString()}\n Prix Total : ${int.parse(widget.article.prix) * nbArticle}")
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text(
                                        "Vous n'avez pas Whatsapp.\nVeuillez bien l'installer et recommencer.\nMerci!!",
                                        overflow: TextOverflow.ellipsis,
                                      )));
                          // await launchEmail();
                          // await makerSMS();
                          // await launchWhatsApp(widget.article, context);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}
