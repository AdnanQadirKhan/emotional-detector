import 'package:emotion_detector/components/bottom_bar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({super.key});
  
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/images/notification.png'),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 2),

    );
  }
}