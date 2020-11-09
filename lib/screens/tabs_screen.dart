import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'catgeroies_screen.dart';
import 'about_us_screen.dart';
import 'contact_us_screen.dart';
import 'e-book_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Widget bottomNav(Widget child, String text) {
    return CupertinoTabView(builder: (context) {
      return CupertinoPageScaffold(
          child: SafeArea(child: Material(child: child)),
          navigationBar: CupertinoNavigationBar(middle: Text(text)));
    });
  }

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

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

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

    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: _items,
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return CupertinoPageScaffold(
          child: SafeArea(child: Material(child: CategoriesScreen())),
          navigationBar: CupertinoNavigationBar(middle: Text('KL The Guide')));
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
        : Scaffold(
            appBar: AppBar(
              title: Text(_pages[_selectedPageIndex]['title']),
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

    // PlatformScaffold(
    //     appBar: PlatformAppBar(
    //       title: Text('Travel Tips')),
    //       body: _pages[_selectedPageIndex]['page'],
    //       bottomNavBar: PlatformNavBar(
    //         itemChanged: _selectPage,
    //           backgroundColor: Theme.of(context).primaryColorDark,
    //           currentIndex: _selectedPageIndex,
    //          // type: BottomNavigationBarType.fixed,
    //           items: [
    //             BottomNavigationBarItem(
    //               backgroundColor: Theme.of(context).primaryColorDark,
    //               icon: Icon(Icons.home),
    //               label: 'Home',
    //             ),
    //             BottomNavigationBarItem(
    //                 backgroundColor: Theme.of(context).primaryColorDark,
    //                 icon: Icon(Icons.book),
    //                 label: 'E-Book'),
    //             BottomNavigationBarItem(
    //                 backgroundColor: Theme.of(context).primaryColorDark,
    //                 icon: Icon(Icons.contacts),
    //                 label: 'Contact Us'),
    //             BottomNavigationBarItem(
    //               backgroundColor: Theme.of(context).primaryColorDark,
    //               icon: Icon(Icons.info),
    //               label: 'About US',
    //             ),
    //           ],
    //         ),
    //     );

    //  Platform.isIOS
    //     ? CupertinoTabScaffold(
    //         tabBar: CupertinoTabBar(items: [
    //           BottomNavigationBarItem(
    //             backgroundColor: Theme.of(context).primaryColorDark,
    //             icon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //               backgroundColor: Theme.of(context).primaryColorDark,
    //               icon: Icon(Icons.book),
    //               label: 'E-Book'),
    //           BottomNavigationBarItem(
    //               backgroundColor: Theme.of(context).primaryColorDark,
    //               icon: Icon(Icons.contacts),
    //               label: 'Contact Us'),
    //           BottomNavigationBarItem(
    //             backgroundColor: Theme.of(context).primaryColorDark,
    //             icon: Icon(Icons.info),
    //             label: 'About US',
    //           ),
    //         ]),
    //         tabBuilder: (context, index) {
    //           if (index == 0) {
    //             return CupertinoPageScaffold(
    //                 navigationBar:
    //                     CupertinoNavigationBar(middle: Text('KL THE GUIDE')),
    //                 child:
    //                     SafeArea(child: Material(child: CategoriesScreen())));
    //           } else if (index == 1) {
    //             return CupertinoPageScaffold(
    //                 navigationBar:
    //                     CupertinoNavigationBar(middle: Text('E-Book')),
    //                 child: SafeArea(child: Material(child: FirstPage())));
    //           } else if (index == 2) {
    //             return CupertinoPageScaffold(
    //                 navigationBar:
    //                     CupertinoNavigationBar(middle: Text('Contact Us')),
    //                 child: SafeArea(child: Material(child: ContactUsScreen())));
    //           } else {
    //             return CupertinoPageScaffold(
    //                 navigationBar:
    //                     CupertinoNavigationBar(middle: Text('About US')),
    //                 child: SafeArea(child: Material(child: AboutUsScreen())));
    //           }
    //         },
    //       )
    //    :
  }
}
