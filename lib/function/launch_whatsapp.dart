// launchWhatsApp() {
// const link = WhatsAppUnilink(
//   phoneNumber: '22969931639',
//   text: "Hello World !!!"
// );
// // url_launcher
// await launchUrlString('$link');
// whatsa

// }

import 'dart:io';

import 'package:flutter_boutique/models/article.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

File? _image;

Future<void> launchWhatsApp(Article article, BuildContext context) async {
  final isWhatsapp = await WhatsappShare.isInstalled(package: Package.whatsapp);
  final isWhatsappBusiness =
      await WhatsappShare.isInstalled(package: Package.businessWhatsapp);
      

  if (isWhatsapp! || isWhatsappBusiness!) {
    // ignore: avoid_function_literals_in_foreach_calls, unused_local_variable
     await getImage(article);
    Directory? directory = await getExternalStorageDirectory();
    print('${directory!.path} / ${_image!.path}');

    List<String>  filesPath =[];
     for (var element in article.photo) {
          filesPath.add("assets/Images/"+element);
        }
    await WhatsappShare.shareFile(
        filePath:[(_image!.path)],
        phone: '22995425623',
        text: "Salut\nJ'aimerais vous acheter cet article",
        // package: isWhatsapp ? Package.whatsapp : Package.businessWhatsapp
        );
  } else {
    print("Il n'y a pas de whatsapp sur cet appareil!!!\nVeuiller l'installer et recommencer\nMerci pour la compréhension.");
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Center(
          child: Text( 
              "Action Impossible. Veuille installer Whatsapp ou WhatsappBusiness !!\nIl n'y a pas de whatsapp sur cet appareil!!!\nVeuiller l'installer et recommencer\nMerci pour la compréhension.",
              overflow: TextOverflow.ellipsis,
            ),
        )
    ));
  }
}

 ///Pick Image From gallery using image_picker plugin
  Future getImage(Article article) async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? _pickedFile =
          (await _picker.pickImage(source: ImageSource.gallery));

      if (_pickedFile != null) {
        // getting a directory path for saving
        final directory = await getExternalStorageDirectory();

        // copy the file to a new path
        await _pickedFile.saveTo('${directory!.path}/${article.photo[0]}');
        _image = File('${directory.path}/${article.photo[0]}');
      }
    } catch (er) {
      print(er);
    }
  }