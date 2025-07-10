import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Import generated localization

class Spa extends StatefulWidget {
  const Spa({super.key});

  @override
  _SpaState createState() => _SpaState();
}

class _SpaState extends State<Spa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: Text(S.of(context).spaTime,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList2(
        items: [
          ItemData(
            title: S.of(context).manjakaki,
            imageUrl: 'https://www.kltheguide.com.my/assets/img/spa/8.jpg',
            location: S.of(context).manjakakiLocation,
            hours: S.of(context).manjakakiHours,
            // website: S.of(context).manjakakiWebsite,
          ),
          ItemData(
            title: S.of(context).urbanRetreatSpaKL,
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/spa/Picture5-1.jpg',
            location: S.of(context).urbanRetreatSpaKLLocation,
            hours: S.of(context).urbanRetreatSpaKLHours,
            // website: S.of(context).urbanRetreatSpaKLWebsite,
          ),
          ItemData(
            title: S.of(context).ozmosisSpa,
            imageUrl: 'https://www.kltheguide.com.my/assets/img/spa/1.jpg',
            location: S.of(context).ozmosisSpaLocation,
            hours: S.of(context).ozmosisSpaHours,
            // website: S.of(context).ozmosisSpaWebsite,
          ),
          // Add more spa locations here
        ],
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData> items;

  MyList2({required this.items});

  @override
  Widget build(BuildContext context) {
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
                child: CachedNetworkImage(
                  imageUrl: items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${S.of(context).location}: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${S.of(context).operatingHours}: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // GestureDetector(
                    //   child: Text(
                    //     '${S.of(context).website}: ${items[index].website}',
                    //     style: const TextStyle(
                    //       fontSize: 16.0,
                    //       color: Colors.blue,
                    //       decoration: TextDecoration.underline,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData {
  final String title;
  final String imageUrl;
  final String location;
  final String hours;
  // final String website;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    // required this.website,
  });
}
