
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/chatapp.dart';
import 'package:flutter_application_1/pages/screen1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(DriverSafetyApp());
}

class DriverSafetyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'loginpage':(context) => homepage(),
        chattAppPage.id:(context) => chattAppPage()
      },
      debugShowCheckedModeBanner: false,
     
      home: homepage(),
    );
  }
}

