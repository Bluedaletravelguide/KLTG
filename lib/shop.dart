import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Import generated localization

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: Text(S.of(context).placesToShop,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList2(
        items: [
          ItemData(
            title: S.of(context).avenueKShop,
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/avenuek.jpg',
            location: S.of(context).avenueKShopLocation,
            hours: S.of(context).avenueKShopHours,
            website: S.of(context).avenueKShopWebsite,
          ),
          ItemData(
            title: S.of(context).sanctuaryMall,
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/sanctuary.jpg',
            location: S.of(context).sanctuaryMallLocation,
            hours: S.of(context).sanctuaryMallHours,
            website: S.of(context).sanctuaryMallWebsite,
          ),
          ItemData(
            title: S.of(context).lincKL,
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/linc.jpeg',
            location: S.of(context).lincKLLocation,
            hours: S.of(context).lincKLHours,
            website: S.of(context).lincKLWebsite,
          ),
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
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].website);
                      },
                      child: Text(
                        '${S.of(context).website}: ${items[index].website}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
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
  final String website;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    required this.website,
  });
}
