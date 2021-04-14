import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BookmarkScreen extends StatefulWidget {
  static const routeName = '/bookmarks';

  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Widget bookmarkDisplay() {
    return Container(
      child: Text('Hi'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageBody = SafeArea(
      child: Material(child: bookmarkDisplay()),
    );
    return PlatformScaffold(
      body: pageBody,
    );
  }
}
