import 'package:KlTheGuide/Data/SizeConfig.dart';
import 'package:KlTheGuide/screens/content_list_screen.dart';
import 'package:KlTheGuide/screens/kl_at_glance_screen.dart';
import 'package:flutter/material.dart';
import 'package:KlTheGuide/screens/transportation_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubCategories extends StatelessWidget {
  final String title;
  final String id;
  final String image;
  final String description;

  const SubCategories({this.image, this.title, this.id, this.description});

  void selectSubCategory(BuildContext context) {
    if (id == 'sc2') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) =>
              new KlAtGlanceScreen(appbartitle: title, id: id),
        ),
      );
    } else if (id == 'sc_16') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) =>
              new TransportationScreen(appbartitle: title, id: id),
        ),
      );
    } else {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) =>
              new ContentListScreen(appbartitle: title, id: id),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final media = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
          onTap: () => selectSubCategory(context),
          onLongPress: () => print(id),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * 0.75,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          image,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 4,
                        child: Container(
                          width: media > 500 ? media * 0.8 / 2 : media * 0.54,
                          color: Colors.black54,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(title,
                              style: media > 500
                                  ? Theme.of(context).textTheme.headline6
                                  : Theme.of(context).textTheme.headline5,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.height * 0.025),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(description,
                                style: Theme.of(context).textTheme.subtitle2),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
