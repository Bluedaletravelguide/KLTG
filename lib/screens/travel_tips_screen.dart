import 'package:flutter/material.dart';
import '../Data/travel_tips_data.dart';
import '../widgets/travelTips_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TravelTipsScreen extends StatefulWidget {
  static const routeName = '/travel_tips_screen';
  final String appbartitle;

  const TravelTipsScreen({Key key, this.appbartitle}) : super(key: key);

  @override
  _TravelTipsScreenState createState() => _TravelTipsScreenState();
}

class _TravelTipsScreenState extends State<TravelTipsScreen> {
  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                  children: TravelTipsData.map(
                (con) => TravelTips(
                  con.id,
                  con.title,
                  con.description,
                  con.image,
                ),
              ).toList()),
            ),
          ),
        ),
      ),
    );

    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(subCategoryTitle),
        ),
        body: pageBody);
  }
}
