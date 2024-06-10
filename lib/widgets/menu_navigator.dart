import 'package:flutter/material.dart';
import 'package:pos_app/app/modules/home/widgets/homepage.dart';

const List<Widget> contentItems = <Widget>[
  HomePage(),
  Text('Index 1: Business'),
  Text('Index 2: School'),
  Text('Index 3: Settings'),
];

const List<BottomNavigationBarItem> navigatorMenu = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.history),
    label: 'History',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.receipt_long),
    label: 'Order',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];
