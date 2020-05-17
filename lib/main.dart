import 'package:flutter/material.dart';
import 'package:nav_bar/plugin/persistent-tab-view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen("Home" ),
      HomeScreen("Search"),
      HomeScreen("Chat"),
      HomeScreen("Settings"),
      HomeScreen("Category"),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        titleFontSize: 10,
        title: ("Home"),
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        isTranslucent: false,
        
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        titleFontSize: 10,
        title: ("Search"),
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        titleFontSize: 10,
        title: ("Chat"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        titleFontSize: 10,
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
       PersistentBottomNavBarItem(
        icon: Icon(Icons.category),
        title: ("Category"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
        isTranslucent: false,
        titleFontSize: 10,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items:
            _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        
        onItemSelected: (int) {
          setState(
              () {}); // This is required to update the nav bar if Android back button is pressed
        },
        itemCount: 5,
        iconSize: 22,
        horizontalPadding: 5,
        bottomPadding: 10,
        navBarStyle:
            NavBarStyle.style3 // Choose the nav bar style with this property
        );
  }
}




class HomeScreen extends StatelessWidget {
  String title;
HomeScreen(titl){
title=titl;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}