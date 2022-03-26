import 'package:bazimat_vendor_app/getStart.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:firebase_core/firebase_core.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async
// {
//     await Firebase.init
// }
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.instance.getToken().then((value) {
  //   print("Fcm in vendor app..." + value.toString());
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetStart(),
    );
  }
}
