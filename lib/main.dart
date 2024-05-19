import 'package:camera/camera.dart';
import 'package:emotion_detector/notification_screen.dart';
import 'package:emotion_detector/profile_screen.dart';
import 'package:emotion_detector/report_screen.dart';
import 'package:emotion_detector/splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

List<CameraDescription>? cameras;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => Home(),
        '/notification': (context) => NotificationScreen(),
        '/reports': (context) => ReportScreen(),
        '/profile': (context) => ProfileScreen()
      },

    );
  }


}