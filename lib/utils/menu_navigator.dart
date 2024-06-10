import 'package:flutter/material.dart';

const List<Widget> contentItems = <Widget>[
  Text('Index 0: Home'),
  Text('Index 1: Business'),
  Text('Index 2: School'),
];

const List<BottomNavigationBarItem> navigatorMenu = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'Business',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'School',
  ),
];
