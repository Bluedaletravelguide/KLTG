import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BookmarkWidget extends StatefulWidget {
  final void Function(bool isBookmark) onBookmarkChanged;
  final bool isBookmark;

  BookmarkWidget({Key key, this.isBookmark, this.onBookmarkChanged})
      : super(key: key);

  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmark;
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkChanged(isBookmarked);
    });
  }

  Widget platformType() {
    if (Platform.isIOS) {
      return IconButton(
          icon:
              isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
          color: Colors.black,
          onPressed: toggleBookmark);
    } else {
      return IconButton(
          icon:
              isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
          color: Colors.white,
          onPressed: toggleBookmark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return platformType();
  }
}
