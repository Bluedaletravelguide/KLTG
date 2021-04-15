import 'package:flutter/material.dart';

class BookmarkWidget extends StatefulWidget {
  final void Function(bool isBookmark) onBookmarkChanged;
  bool isBookmark;

  BookmarkWidget({Key key, this.onBookmarkChanged}) : super(key: key);

  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    widget.isBookmark = isBookmarked;
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkChanged(isBookmarked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
      onPressed: toggleBookmark,
      iconSize: MediaQuery.of(context).size.height * 0.04,
    );
  }
}
