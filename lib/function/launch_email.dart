import 'package:url_launcher/url_launcher.dart';

launchEmail() async{
  String? encodeQueryParameters(Map<String, String> params){
    return params.entries.map((e)=> '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'gnacsentreprise@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!'
    })
  );
  await launchUrl(emailLaunchUri);
}