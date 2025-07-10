// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ApiData {
  final String title;
  final String content;
  final String image;

  ApiData({
    required this.title,
    required this.content,
    required this.image,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

Future<List<ApiData>> fetchData(bodyparse) async {
  final response = await http.post(
    Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
    body: {bodyparse: bodyparse},
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => ApiData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<ApiData>> fetchData2(bodyparse, category) async {
  final response = await http.post(
    Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
    body: {bodyparse: bodyparse, 'category': category},
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => ApiData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
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
        print(item.image);
        return GestureDetector(
          onTap: () {
            if (item.content != '') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(
                    pdfUrl: item.content,
                    pdfTitle: item.title,
                  ),
                ),
              );
            } else {
              final snackBar = SnackBar(
                content: const Text('PDF not available'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(
                    seconds:
                        3), // Duration for how long the Snackbar is displayed
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    // You can add custom actions when the action button is pressed
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  placeholder: (context, url) =>
                      const LinearProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons
                      .error), // Display an error icon if the image fails to load
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
}

class Ebook extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      "name": "KL The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/kltg/KLTG44.jpg"
    },
    {
      "name": "Klang Valley 4 Locals",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/kv4l/35.jpg"
    },
    {
      "name": "Melaka The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/mktg/4.jpg"
    },
    {
      "name": "Taiping The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/tptg/1.jpg"
    },
    {
      "name": "Uzbekistan The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/uztg/3.jpg"
    },
    {
      "name": "Keningau The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/kntg/1.jpg"
    },
    {
      "name": "Tawau The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/twtg/1.jpg"
    },
    {
      "name": "Tambunan The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/tbtg/1.jpg"
    },
    {
      "name": "Hulu Selangor The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/hstg/1.jpg"
    },
    {
      "name": "Perak The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/prtg/1.jpg"
    },
    {
      "name": "Seremban The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/sbtg/1.jpg"
    },
    {
      "name": "Kuala Selangor The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/kstg/1.jpg"
    },
    {
      "name": "Kuala Langat The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/klgt/1.jpg"
    },
    {
      "name": "Kazakhstan The Guide",
      "image": "https://www.kltheguide.com.my/assets/img/ebook/kztg/1.jpg"
    },
    // Add more items as needed
  ];

  Ebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final item = dataList[index];
          return CardItem(
              name: item["name"], image: item["image"], index: index);
        },
      ),
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
      onTap: () {
        Navigator.pushNamed(context, '/ebook-$index', arguments: {
          'index': {index}
        });
        // Navigate to a detail page or perform an action when the card is tapped
        // You can use Navigator to navigate to a detail page with specific data
        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(name: name, image: image)));
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return MyAdBanner(
        //       index: index,
        //     );
        //   },
        // );
      },
      child: SizedBox(
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),

                fit: BoxFit.contain,
                // Make the image cover the entire card
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black
                    .withOpacity(0.5), // Adjust the opacity as needed
                child: Text(
                  name,
                  textAlign: TextAlign.justify,
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

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final int index;

  const DetailPage(
      {super.key,
      required this.name,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Text('Detail for $index'),
      ),
    );
  }
}

class Ebook_view extends StatefulWidget {
  final String category;
  final String name;
  const Ebook_view({super.key, required this.category, required this.name});

  @override
  State<Ebook_view> createState() => _Ebook_viewState();
}

class _Ebook_viewState extends State<Ebook_view> {
  late Future<List<ApiData>> _data;
  @override
  void initState() {
    super.initState();

    _data = fetchData2('appEbook', widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(widget.name, style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: FutureBuilder<List<ApiData>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return CardListWidget(data: snapshot.data ?? []);
          }
        },
      ),
    );
  }
}

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  final String pdfTitle;
  const PdfViewerPage(
      {super.key, required this.pdfUrl, required this.pdfTitle});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? filePath;

  @override
  void initState() {
    super.initState();

    // checkIfFileExists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(widget.pdfTitle, style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: const PDF(
        swipeHorizontal: true,
      ).cachedFromUrl(
        widget.pdfUrl,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class MyAdBanner extends StatefulWidget {
  final dynamic index;

  const MyAdBanner({super.key, this.index});

  @override
  _MyAdBannerState createState() => _MyAdBannerState();
}

class _MyAdBannerState extends State<MyAdBanner> {
  late BannerAd _bannerAd;
  bool isAdLoaded = false; // Add a flag to track ad loading

  @override
  void initState() {
    super.initState();

    // Initialize the Google Mobile Ads SDK
    MobileAds.instance.initialize();

    // Create a BannerAd instance
    _bannerAd = BannerAd(
      adUnitId:
          'ca-app-pub-7002644831588730/4427349537', // Replace with your Ad Unit ID
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isAdLoaded = true; // Set the flag to true when ad is loaded
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Ad failed to load
        },
      ),
    );

    // Load the ad
    _bannerAd.load();
  }

  @override
  void dispose() {
    // Dispose of the BannerAd when it's no longer needed
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(
          ad: _bannerAd,
        ),
      ),
      actions: [
        if (isAdLoaded) // Only show the "OK" button if the ad is loaded
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.pushNamed(context, '/ebook-${widget.index}',
                  arguments: {
                    'index': {widget.index}
                  });
            },
            child: const Text('OK'),
          ),
      ],
    );
  }
}
