import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  final GlobalKey? twoKey;

  const BottomBar({
    Key? key,
    required this.currentIndex,
    this.twoKey,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _onTappedItem(int index) async {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/reports');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/notification');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      iconSize: 32,
      unselectedItemColor: Colors.grey,
      elevation: 14,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_page), label: 'Reports'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none), label: 'Notification'),
        BottomNavigationBarItem(
          icon: widget.twoKey != null
              ? Showcase.withWidget(
                  key: widget.twoKey!,
                  width: 370,
                  height: 400,
                  targetPadding: EdgeInsets.all(18),
                  targetShapeBorder: CircleBorder(),
                  tooltipPosition: TooltipPosition.top,
                  container: Container(
                      margin: EdgeInsets.only(right: 200, bottom: 500),
                      child: Image.asset("assets/images/vital_signs.png")),
                  child: Icon(Icons.person_outline_rounded))
              : Icon(Icons
                  .person_outline_rounded), // Use Showcase only if twoKey is provided
          label: 'Profile',
        ),
      ],
      currentIndex: widget.currentIndex,
      onTap: _onTappedItem,
      selectedItemColor: Theme.of(context).primaryColor,
    );
  }
}
