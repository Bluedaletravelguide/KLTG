import '../Data/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Data/articles-data.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/articles';

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String edition;
//Function to create book edtion numbers

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PlatformScaffold(
      body: SafeArea(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(children: [
              Text(
                'Articles Editions',
                style: Theme.of(context).textTheme.headline1,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  //This function is to import the e-book data into this widget:
                  children: ArticlesData.map(
                    (con) => Padding(
                      padding: EdgeInsets.all(15),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          final url = con.article_pdf;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 10,
                                shadowColor: Colors.black,
                                borderRadius: BorderRadius.circular(9),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical * 30,
                                    child: Image.asset(
                                      con.article_cover,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
