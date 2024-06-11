import 'package:flutter/material.dart';
import 'package:pos_app/app/modules/history/views/history_view.dart';
import 'package:pos_app/app/modules/home/views/homepage.dart';
import 'package:pos_app/app/modules/order/views/order_view.dart';
import 'package:pos_app/app/modules/profile/views/profile_view.dart';

const List<Widget> contentItems = <Widget>[
  HomePage(),
  HistoryView(),
  OrderView(),
  ProfileView(),
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
