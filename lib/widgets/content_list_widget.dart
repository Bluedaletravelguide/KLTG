import '../widgets/bookmark_widget.dart';
import '../screens/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../screens/medical_screen.dart';

class ContentList extends StatelessWidget {
  final String title;
  final String id;
  final String image;
  final String description;
  final bool isBookmarked;
  final void Function(bool isBookmark) onBookmarkChanged;

  ContentList(
      {this.image,
      this.title,
      this.id,
      this.description,
      this.isBookmarked,
      this.onBookmarkChanged});

  void selectContentList(BuildContext context) {
    if (id == 'cl1_14' || id == 'cl2_14' || id == 'cl3_14' || id == 'cl4_14') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) =>
              new Medical(appbartitle: title, id: id, image: image),
        ),
      );
    } else {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) =>
              new ContentScreen(appbartitle: title, id: id, image: image),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      autofocus: true,
      onTap: () => selectContentList(context),
      onLongPress: () => print(id),
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
                  image,
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
                          child: BookmarkWidget(
                            onBookmarkChanged: onBookmarkChanged,
                            isBookmark: isBookmarked,
                          )),
                      SizedBox(
                        width: constraints.maxWidth * 0.05,
                      ),
                      Expanded(
                        child: Text(
                          title,
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
}
