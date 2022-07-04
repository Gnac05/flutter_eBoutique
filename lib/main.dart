import 'package:flutter_boutique/screens/home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //     'resource://drawable/res_app_icon',
  //     [
  //       NotificationChannel(
  //           channelKey: 'basic_channel',
  //           channelName: 'Basic notifications',
  //           channelDescription: 'Notification channel for basic tests',
  //           channelGroupKey: 'basic_channel_group',
  //           defaultColor: const Color(0xFF9D50DD),
  //           ledColor: Colors.white)
  //     ],
  //     channelGroups: [
  //       NotificationChannelGroup(
  //           channelGroupkey: 'basic_channel_group',
  //           channelGroupName: 'Basic group')
  //     ],
  //     debug: true);

  // // Allowed
  // AwesomeNotifications().isNotificationAllowed().then((isAllowed){
  //   if(!isAllowed){
  //     print('$isAllowed');
  //     AwesomeNotifications().requestPermissionToSendNotifications();
  //   }
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // detect tap
  // AwesomeNotifications().actionStream.listen(
  //   (ReceivedNotification receivedNotification){
  //     Navigator.of(context).pushNamed(
  //       '/NotificationPage',
  //       arguments: {
  //         // id: receivedNotification.id
  //       }
  //     );
  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
  //   }
  // );
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: NeumorphicThemeData.dark(
          iconTheme: IconThemeData(color: Colors.white)),
      home: Home(),
    );
    // MaterialApp(
    //   title: 'Flutter Boutique',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const Home(),
    // );
  }
}
