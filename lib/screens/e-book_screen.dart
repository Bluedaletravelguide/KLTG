import '../Data/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Data/ebook-data.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class FirstPage extends StatefulWidget {
  static const routeName = '/ebooks';

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int bookIndex = 40;
  String edition;
//Function to create book edtion numbers
  String bookEdition() {
    setState(() {
      bookIndex--;
    });
    if (bookIndex < 40 && bookIndex > 0) {
      return edition = bookIndex.toString();
    }
    return (bookIndex = 40).toString();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('E-book'),
      ),
      body: SafeArea(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(children: [
              Text(
                'KL The Guide Editions',
                style: Theme.of(context).textTheme.headline1,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  //This function is to import the e-book data into this widget:
                  children: EbookData.map(
                    (con) => Padding(
                      padding: EdgeInsets.all(15),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          final url = con.bookPdf;
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
                                      con.bookcover,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: SizeConfig.blockSizeVertical * 10,
                                width: SizeConfig.blockSizeHorizontal * 7,
                                color: Colors.transparent,
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff103783),
                                        Color(0xff9bafd9),
                                      ]),
                                      borderRadius: new BorderRadius.only(
                                          topRight: const Radius.circular(40.0),
                                          bottomRight:
                                              const Radius.circular(40.0))),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        bookEdition(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
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
