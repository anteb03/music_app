import 'package:aplikacija1/display2.dart';
import 'package:flutter/material.dart';
import 'package:aplikacija1/display3.dart';
import 'package:aplikacija1/display1.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _selectedIndex = 0;
  final screens = [
    Display1(),
    Display2(),
    Display3(),
  ];

  var _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              setState(() {
                _selectedIndex = _pageController.page?.round() ?? 0;
              });
            }
            return true;
          },
          child: PageView(
            children: screens,
            controller: _pageController,
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'My playlists',
              ),
            ],
          ),
        ));
  }
}
