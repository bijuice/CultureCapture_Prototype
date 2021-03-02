import 'package:flutter/material.dart';
import 'Leaderboard.dart';
import 'Profile.dart';
import 'Add.dart';
import 'Feed.dart';

//TODO: implement search bar
//TODO: remove add page from bottom bar

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Feed(),
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
            title = 'Leaderboard';
          }
          break;
        case 2:
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
          backgroundColor: Colors.grey[100],
          elevation: 0,
          title: Image(
            height: 30,
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle_outline_rounded),
              onPressed: () {},
              color: Colors.black,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
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
          selectedItemColor: Colors.amber[200],
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
