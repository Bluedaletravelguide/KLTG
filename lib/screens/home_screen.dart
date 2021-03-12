import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';
import 'content_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'travel_tips_screen.dart';
import 'e-book_screen.dart';
import 'about_us_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Create a button that redirects the users to its respective catergory.
    Widget createButton(String appTitle, String id) {
      return ButtonTheme(
        minWidth: double.infinity,
        buttonColor: Colors.white60,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              platformPageRoute(
                context: context,
                builder: (context) =>
                    new ContentListScreen(appbartitle: appTitle, id: id),
              ),
            );
          },
          icon: Icon(Icons.view_list),
          label: Text('VIEW MORE'),
          shape: const StadiumBorder(),
        ),
      );
    }

    //Shows the three icon buttons for travel tips, e-book and about us respectively.
    final quickAccess = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Travel tips, e-book and about us
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.flight_takeoff),
                iconSize: 64,
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new TravelTipsScreen(
                              appbartitle: 'Travel Tips',
                            )),
                  );
                }),
            Text(
              'Travel Tips',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.book),
                iconSize: 64,
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context, builder: (context) => FirstPage()),
                  );
                }),
            Text(
              'E-book',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.info),
                iconSize: 64,
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new AboutUsScreen()),
                  );
                }),
            Text(
              'About Us',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ],
    );

    //The main home page layout
    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: quickAccess,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top 3 parks to visit in KL',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowListTile(selectTerm: 'Parks'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createButton('Parks', 'sc4'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Accomodation',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowListTile(selectTerm: ''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createButton('Accomodation', 'sc_15'),
            ),
          ],
        ),
      ),
    );
  }
}

//Shows the top 3 items in the list tile.
//Upon clicking it goes straight to the respective content screen.
class ShowListTile extends StatelessWidget {
  final String selectTerm;

  ShowListTile({Key key, @required this.selectTerm}) : super(key: key);

  Widget build(BuildContext context) {
    final sightseeingList = ContentListData.where((sightseeingList) {
      return sightseeingList.categories.contains('sc4');
    }).toList();
    final accomodationList = ContentListData.where((accomodationList) {
      return accomodationList.categories.contains('sc_15');
    }).toList();

    if (selectTerm == 'Parks') {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: SafeArea(
          child: Material(
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  autoPlayCurve: Curves.linearToEaseOut,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true),
              itemBuilder: (context, index) {
                return ContentList(
                    id: sightseeingList[index].id,
                    title: sightseeingList[index].contentListTitle,
                    image: sightseeingList[index].image);
              },
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: SafeArea(
          child: Material(
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  autoPlayCurve: Curves.linearToEaseOut,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true),
              itemBuilder: (context, index) {
                return ContentList(
                    id: accomodationList[index].id,
                    title: accomodationList[index].contentListTitle,
                    image: accomodationList[index].image);
              },
            ),
          ),
        ),
      );
    }
  }
}
