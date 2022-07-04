// import 'package:flutter/material.dart';
// import 'package:flutter_boutique/function/wa_buisness.dart';
// import 'package:flutter_boutique/models/article.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:whatsapp_share2/whatsapp_share2.dart';

// void commande(Article article, BuildContext context) async {
//   bool hasWh = await isInstalled();
//   if (hasWh) {
//     await WhatsappShare.shareFile(
//       filePath: article.photo,
//       phone: article.numero,
//       text: "Bonjour!!!\nJ'aimerai vous acheter l'un de ces ${article.nom}.",
//     );
//   } else {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     duration: Duration(seconds: 1),
    //     content: Center(
    //       child: Text( 
    //           'Action Impossible. Veuille installer Whatsapp ou WhatsappBusiness !!',
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //     )
    // ));
//   }
// }
