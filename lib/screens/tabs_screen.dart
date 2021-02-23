import 'dart:io';

import 'package:KlTheGuide/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'catgeroies_screen.dart';
import 'about_us_screen.dart';
import 'contact_us_screen.dart';
import 'e-book_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //We save the widget into a variable to prevenr code duplicating
// Widget variable
  Widget bottomNav(Widget child, String text) {
    return CupertinoTabView(builder: (context) {
      return CupertinoPageScaffold(
          child: SafeArea(child: Material(child: child)),
          navigationBar: CupertinoNavigationBar(middle: Text(text)));
    });
  }

//For android app bottom nevgation bar :
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'KL THE GUIDE',
    },
    {
      'page': FirstPage(),
      'title': ' E-Book',
    },
    {
      'page': ContactUsScreen(),
      'title': ' Contact Us',
    },
    {
      'page': AboutUsScreen(),
      'title': ' About Us',
    },
  ];

  int _selectedPageIndex = 0;
  final List<String> list = List.generate(10, (index) => "Text $index");

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

//The main widget
  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).primaryColorDark,
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(Icons.book),
          label: 'E-Book'),
      BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(Icons.contacts),
          label: 'Contact Us'),
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).primaryColorDark,
        icon: Icon(Icons.info),
        label: 'About US',
      ),
    ];
//IOS BottomNavigationBar
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: _items,
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return CupertinoPageScaffold(
                      child:
                          SafeArea(child: Material(child: CategoriesScreen())),
                      navigationBar: CupertinoNavigationBar(
                          middle: Text('KL THE GUIDE'),
                          trailing: Material(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  platformPageRoute(
                                      context: context,
                                      builder: (context) => new SearchScreen()),
                                );
                              },
                              icon: Icon(CupertinoIcons.search),
                            ),
                          )));
                case 1:
                  return bottomNav(FirstPage(), 'E-Book');

                case 2:
                  return bottomNav(ContactUsScreen(), 'Contact Us');

                case 3:
                  return bottomNav(AboutUsScreen(), 'About US');

                default:
                  return bottomNav(CategoriesScreen(), 'KL The Guide');
              }
            },
          )
        :
        //Android BottomNavigationBar
        Scaffold(
            appBar: AppBar(
              title: Text(_pages[_selectedPageIndex]['title']),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      platformPageRoute(
                          context: context,
                          builder: (context) => new SearchScreen()),
                    );
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            body: _pages[_selectedPageIndex]['page'],
            bottomNavigationBar: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Theme.of(context).primaryColorDark,
                unselectedItemColor: Colors.white70,
                selectedItemColor: Colors.white,
                currentIndex: _selectedPageIndex,
                type: BottomNavigationBarType.fixed,
                items: _items),
          );
  }
}
