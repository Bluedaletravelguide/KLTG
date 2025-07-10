import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Import localization file
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class GlancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(S.of(context).klAtAGlance,
            style: const TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://www.kltheguide.com.my/assets/img/highlights/KLATGLANCE-01-2.jpg',
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).klAtAGlance,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              S.of(context).klDescription1,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              S.of(context).klDescription2,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class GetAround extends StatefulWidget {
  const GetAround({super.key});

  @override
  State<GetAround> createState() => _GetAroundState();
}

class _GetAroundState extends State<GetAround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(S.of(context).gettingAroundKL,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList(
          context:
              context), // This is where the images and text will be displayed.
    );
  }
}

class MyList extends StatelessWidget {
  final BuildContext context;

  MyList({required this.context}); // Constructor accepting context

  final List<ItemData> items = [];

  @override
  Widget build(BuildContext context) {
    // Initializing items inside build where context is accessible
    final List<ItemData> items = [
      ItemData(
        S.of(this.context).lrtTitle,
        'https://www.kltheguide.com.my/assets/img/highlights/getaround/1.-lrt.png',
        S.of(this.context).lrtDescription,
      ),
      ItemData(
        S.of(this.context).mrtTitle,
        'https://www.kltheguide.com.my/assets/img/highlights/getaround/2.-mrt.png',
        S.of(this.context).mrtDescription,
      ),
      ItemData(
        S.of(this.context).ktmKomuterTitle,
        'https://www.kltheguide.com.my/assets/img/highlights/getaround/3.-ktm-komuter.png',
        S.of(this.context).ktmKomuterDescription,
      ),
      ItemData(
        S.of(this.context).klMonorailTitle,
        'https://www.kltheguide.com.my/assets/img/highlights/getaround/4.-kl-monorail.png',
        S.of(this.context).klMonorailDescription,
      ),
      ItemData(
        S.of(this.context).rapidKLBusTitle,
        'https://www.kltheguide.com.my/assets/img/highlights/getaround/5.-rapid-kl-bus.png',
        S.of(this.context).rapidKLBusDescription,
      ),
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      items[index].content,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemData {
  final String text;
  final String imageUrl;
  final String content;

  ItemData(this.text, this.imageUrl, this.content);
}

class ItemData2 {
  final String text;
  final String imageUrl;
  final String content;
  final String goto;

  ItemData2(this.text, this.imageUrl, this.content, this.goto);
}

class TravelTips extends StatefulWidget {
  const TravelTips({super.key});

  @override
  State<TravelTips> createState() => _TravelTipsState();
}

class _TravelTipsState extends State<TravelTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(S.of(context).travelTips,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList2(),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData2> items = [
    ItemData2(
      'Weather', // This will be replaced by S.of(context).weather
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/weather.png',
      'The climate in KL is quite humid all year-round. Anyone travelling to KL must always be ready for rains at any time of the year. Regardless, the best time to visit KL is from May-July or December-February.\nThe weather can be pretty hot between March - April. Due to the forest fires from Sumatera which typically happens between June - August, the dust particles may cast a haze over KL thus making it not an ideal time to visit the city.', // Will be replaced with localized text
      'https://www.ventusky.com/',
    ),
    ItemData2(
      'Time Zone', // This will be replaced by S.of(context).timeZone
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/timezone.png',
      'Standard Malaysian time is 8 hours ahead of GMT (GMT +8).', // Will be replaced with localized text
      'https://www.timeanddate.com/',
    ),
    ItemData2(
      'Currency', // This will be replaced by S.of(context).currency
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/currency-code.png',
      'Malaysia’s currency unit is divided into two. The term Ringgit Malaysia (RM) is used to refer to paper money. The denominations are RM1, RM5, RM10, RM 20, RM 50 and RM100. Whereas the coins are referred to as sen (cents). The denominations are 5 sen, 10 sen, 20 sen and 50 sen.', // Will be replaced with localized text
      'https://www.xe.com/',
    ),
    ItemData2(
      'Visa and Passport', // This will be replaced by S.of(context).visaAndPassport
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/visa-and-passports.png',
      'Passports must be valid for at least 6 months at the time of entry. Visa requirements vary from time to time, so it is best to check with the Malaysian embassy or consulate or the Immigration Department website.', // Will be replaced with localized text
      'https://www.imi.gov.my/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _launchURL(items[index].goto),
          child: Card(
            elevation: 3.0, // Adjust the elevation as needed
            margin: const EdgeInsets.all(16.0), // Adjust the margin as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    items[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Adjust the padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getLocalizedTitle(
                            index, context), // Using localized titles
                        style: const TextStyle(
                          fontSize: 20.0, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8.0), // Add spacing between title and content
                      Text(
                        _getLocalizedContent(
                            index, context), // Using localized content
                        style: const TextStyle(
                            fontSize: 16.0), // Adjust the font size as needed
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function to get localized title based on index
  String _getLocalizedTitle(int index, BuildContext context) {
    switch (index) {
      case 0:
        return S.of(context).weatherTitle;
      case 1:
        return S.of(context).timeZoneTitle;
      case 2:
        return S.of(context).currencyTitle;
      case 3:
        return S.of(context).visaAndPassportTitle;
      default:
        return '';
    }
  }

  // Helper function to get localized content based on index
  String _getLocalizedContent(int index, BuildContext context) {
    switch (index) {
      case 0:
        return S.of(context).weatherDescription;
      case 1:
        return S.of(context).timeZoneDescription;
      case 2:
        return S.of(context).currencyDescription;
      case 3:
        return S.of(context).visaAndPassportDescription;
      default:
        return '';
    }
  }
}

class ApiData {
  final String title;
  final String content;
  final String image;
  final String location;

  ApiData({
    required this.location,
    required this.title,
    required this.content,
    required this.image,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
    );
  }
}

class CardListWidget extends StatelessWidget {
  final List<ApiData> data;

  const CardListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        return GestureDetector(
          onTap: () {
            // print(item.location);
            if (item.location != '') {
              _launchURL(item.location);
            }
          },
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (item.title),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(item.content.replaceAll('\\n', '\n')),
                    ],
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

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  final int index;

  const CardItem(
      {super.key,
      required this.name,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover, // Make the image cover the entire card
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black
                    .withOpacity(0.5), // Adjust the opacity as needed
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
