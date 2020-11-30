import 'package:flutter/material.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContentListScreen extends StatelessWidget {
  static const routeName = '/content_list';
  final String appbartitle;
  final String id;

  const ContentListScreen({Key key, this.appbartitle, this.id})
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final contentListTitle = appbartitle;
    final contentListId = id;
    //This function is to call the data from the data folder(ContentListData) then it will generate the widget according to item number. 
    final contentList = ContentListData.where((contentList) {
      return contentList.categories.contains(contentListId);
    }).toList();
    final pageBody = SafeArea(
      child: Material(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (ctx, index) {
            return ContentList(
              id: contentList[index].id,
              title: contentList[index].contentListTitle,
              image: contentList[index].image,
            );
          },
          itemCount: contentList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.97,
            crossAxisSpacing: 4,
            mainAxisSpacing: 3,
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text(contentListTitle)),
      body: pageBody,
    );
  }
}
