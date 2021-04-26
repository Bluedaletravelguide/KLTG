import 'dart:io';
import '../screens/crosswordScreen.dart';
import '../screens/about_us_screen.dart';
import '../screens/bookmark_screen.dart';
import '../screens/e-book_screen.dart';
import '../screens/catgeroies_screen.dart';
import '../screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'contact_us_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //We save the widget into a variable to prevent code duplicating for iOS
// Widget variable
  Widget bottomNav(Widget child, String text) {
    return CupertinoPageScaffold(
        child: SafeArea(child: Material(child: child)),
        navigationBar: CupertinoNavigationBar(
            leading: createDrawerItems(context),
            middle: Text(text),
            trailing: Material(
              color: Colors.transparent,
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
  }

  Widget createDrawerItems(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('KL THE GUIDE'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.black,
            ),
            title: Text(
              'E-book',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context, builder: (context) => new FirstPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context,
                    builder: (context) => new AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.games,
              color: Colors.black,
            ),
            title: Text(
              'Crossword',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context,
                    builder: (context) => new CrosswordScreen(
                          title: 'Crossword',
                        )),
              );
            },
          )
        ],
      ),
    );
  }

//For android app bottom nevgation bar :
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'KL THE GUIDE'},
    {'page': BookmarkScreen(), 'title': 'My Bookmarks'},
    {
      'page': ContactUsScreen(),
      'title': 'Contact Us',
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
          icon: Icon(Icons.bookmark),
          label: 'My Bookmarks'),
      BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(Icons.contacts),
          label: 'Contact Us'),
    ];
//IOS BottomNavigationBar
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: _items,
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 1:
                  return bottomNav(BookmarkScreen(), 'My Bookmarks');

                case 2:
                  return bottomNav(ContactUsScreen(), 'Contact Us');

                default:
                  return bottomNav(CategoriesScreen(), 'KL THE GUIDE');
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
            drawer: createDrawerItems(context),
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
