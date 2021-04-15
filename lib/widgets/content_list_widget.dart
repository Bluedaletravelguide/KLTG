import 'package:kltheguide/models/content_List.dart';
import 'package:kltheguide/screens/bookmark_screen.dart';
import '../widgets/bookmark_widget.dart';
import '../screens/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../screens/medical_screen.dart';

class ContentList extends StatefulWidget {
  final String title;
  final String id;
  final String image;
  final String description;
  final Set<ContentLi> _bookmark = new Set<ContentLi>();
  ContentList({this.image, this.title, this.id, this.description});

  void execute() {
    _ContentListState().pushToScreen(_ContentListState().context);
  }

  Set<ContentLi> getBookmark() {
    return _ContentListState().getbookmark();
  }

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  void initState() {
    super.initState();
  }

  void selectContentList(BuildContext context) {
    if (widget.id == 'cl1_14' ||
        widget.id == 'cl2_14' ||
        widget.id == 'cl3_14') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) => new Medical(
              appbartitle: widget.title, id: widget.id, image: widget.image),
        ),
      );
    } else {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) => new ContentScreen(
              appbartitle: widget.title, id: widget.id, image: widget.image),
        ),
      );
    }
  }

  Set<ContentLi> getbookmark() {
    return widget._bookmark;
  }

  Widget isBookmarked(bool bk) {
    if (bk) {
      return Icon(Icons.bookmark);
    } else {
      return Icon(Icons.bookmark_outline);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      autofocus: true,
      onTap: () => selectContentList(context),
      onLongPress: () => print(widget.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  widget.image,
                  height: constraints.maxHeight * 0.78,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        child: BookmarkWidget(),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.05,
                      ),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.subtitle2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }

  Future pushToScreen(BuildContext context) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => BookmarkScreen()));
  }
}
