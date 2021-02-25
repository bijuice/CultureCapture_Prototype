import 'package:flutter/material.dart';
import 'Leaderboard.dart';
import 'Profile.dart';
import 'Add.dart';
import 'Feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Culture Capture';
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Feed(),
    Add(),
    Leaderboard(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.grey[300],
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: Colors
                          .white))), // sets the inactive color of the `BottomNavigationBar`,
          child: BottomNavigationBar(
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon:
                      Icon(Icons.add_circle_outline_sharp, color: Colors.black),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard, color: Colors.black),
                  label: ''),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/me.jpg'),
                    radius: 18,
                  ),
                  label: '')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
