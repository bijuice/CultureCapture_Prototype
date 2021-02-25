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
  String title = 'Home';
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

      switch (index) {
        case 0:
          {
            title = 'Home';
          }
          break;

        case 1:
          {
            title = 'Add';
          }
          break;
        case 2:
          {
            title = 'Leaderboard';
          }
          break;
        case 3:
          {
            title = 'Profile';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
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
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_sharp), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_outlined), label: 'Leaderboard'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                  radius: 17,
                ),
                label: 'User')
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
