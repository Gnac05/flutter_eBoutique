import 'package:url_launcher/url_launcher.dart';

makerSMS() async{
  // await launchUrlString('https://wa.me/22966648964?text=Hello%20world%20!!!');
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: '55337290'
  ) ;
  await launchUrl(smsUri);
}