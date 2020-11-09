import 'package:KlTheGuide/screens/travel_tips_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../screens/sub_categories_screen.dart';

class Catgeories extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  const Catgeories(
    this.id,
    this.title,
    this.color,
    this.image,
  );

  void selectCategory(BuildContext context) {
    if (id == 'c1') {
      Navigator.of(context).push(platformPageRoute(
        context: context,
        builder: (context) => TravelTipsScreen(
          appbartitle: title,
        ),
      ));
    } else {
      Navigator.of(context).push(platformPageRoute(
          context: context,
          builder: (context) =>
              new SubCategoriesScreen(appbartitle: title, id: id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              color,
              Colors.blueGrey,
            ],
            begin: Alignment.center,
            end: new Alignment(1, 1),
          ),
        ),
        child: Stack(children: [
          Opacity(
            opacity: 0.60,
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.only(right: 30.0),
              decoration: BoxDecoration(
                color: Colors.black45,
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.black,
                    Colors.black54,
                    Colors.black38,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Text(
                title,
                style: MediaQuery.of(context).size.width > 500
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.fade,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
