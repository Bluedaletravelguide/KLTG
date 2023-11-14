// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiData {
  final String title;
  final String content;
  final String content2;
  final String image;
  final String location;
  final String locationurl;
  final String hours;
  final String phone;
  final String website;

  ApiData({
    required this.location,
    required this.locationurl,
    required this.hours,
    required this.phone,
    required this.title,
    required this.content,
    required this.content2,
    required this.image,
    required this.website,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      content2: json['content2'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      locationurl: json['locationurl'] ?? '',
      hours: json['hours'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
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
        if (item.location != '') {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            title: item.title,
                            image: item.image,
                            content: item.content,
                            content2: item.content2,
                            location: item.location,
                            locationurl: item.locationurl,
                            hours: item.hours.replaceAll('/', '\n'),
                            phone: item.phone.replaceAll('/', '\n'),
                            website: item.website,
                          )));
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
                        if (item.content != '') const SizedBox(height: 8.0),
                        if (item.content != '')
                          Text(item.content.replaceAll('\\n', '\n')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Card(
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
          );
        }
      },
    );
  }
}

class ExploreKL extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      "name": "What To Do",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/wtd.webp"
    },
    {
      "name": "Historical Sites",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/hs.webp"
    },
    {
      "name": "Places Of Worship",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/pwor.webp"
    },
    {
      "name": "What To Eat",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/wte.webp"
    },
    {
      "name": "Night Life",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/nl.webp"
    },
    {
      "name": "KL 4 Kids",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/kl4kids.webp"
    },
    {
      "name": "Sightseeing",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/ss.webp"
    },
    {
      "name": "Parks",
      "image": "https://www.kltheguide.com.my/assets/img/explorekl/parks.jpg"
    },
    // Add more items as needed
  ];

  ExploreKL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Explore KL", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
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

  const CardItem({
    Key? key,
    required this.name,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/explorekl-$index',
            arguments: {'index': index});
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover, // Make the image cover the entire card
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(), // Placeholder while loading
            ),
            errorWidget: (context, url, error) => Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ), // Error placeholder
            ),
            // You can adjust the cache width and height as needed
            memCacheWidth: 200,
            memCacheHeight: 200,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover, // Make the image cover the entire card
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.5),
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
      ),
    );
  }
}
class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String content2;
  final String image;
  final String location;
  final String locationurl;
  final String hours;
  final String phone;
  final String website;

  const DetailPage({
    super.key,
    required this.location,
    required this.locationurl,
    required this.hours,
    required this.phone,
    required this.title,
    required this.content,
    required this.content2,
    required this.image,
    required this.website,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Details", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display article title
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 16),

            Text(
              title, // Replace with the actual title key
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (content != '') const SizedBox(height: 16.0),

            // Display article content
            if (content != '')
              Text(
                content != ''
                    ? content
                    : '', // Replace with the actual content key
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),

            if (content2 != '')
              Text(
                content2, // Replace with the actual content key
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            if (location != '')
              ListTile(
                leading: const Icon(Icons.location_pin),
                title: Text('Location: $location'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL(locationurl);
                },
              ),
            if (phone != '')
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text('Phone: $phone'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL('tel:$phone');
                },
              ),
            if (hours != '')
              ListTile(
                leading: const Icon(Icons.watch_later),
                title: Text('Hours:\n $hours'),
              ),
            if (website != '')
              ListTile(
                leading: const Icon(Icons.public),
                title: Text('Website: $website'),
                onTap: () {
                  // Add functionality to open the email app with the recipient's email address pre-filled
                  _launchURL(website);
                },
              ),
            // Add other widgets to display additional details as needed
          ],
        ),
      ),
    );
  }
}

class ExploreKL_WTD extends StatefulWidget {
  const ExploreKL_WTD({super.key});

  @override
  _ExploreKL_WTDState createState() => _ExploreKL_WTDState();
}

class _ExploreKL_WTDState extends State<ExploreKL_WTD> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData('appExploreKL_WTD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("What To Do", style: TextStyle(color: Colors.white)),
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

class ExploreKL_HS extends StatefulWidget {
  const ExploreKL_HS({super.key});

  @override
  _ExploreKL_HSState createState() => _ExploreKL_HSState();
}

class _ExploreKL_HSState extends State<ExploreKL_HS> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData('appExploreKL_HS');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Historical Sites",
            style: TextStyle(color: Colors.white)),
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

class ExploreKL_P extends StatefulWidget {
  const ExploreKL_P({super.key});

  @override
  _ExploreKL_PState createState() => _ExploreKL_PState();
}

class _ExploreKL_PState extends State<ExploreKL_P> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData('appExploreKL_P');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Parks", style: TextStyle(color: Colors.white)),
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

class ExploreKL_KL4K extends StatefulWidget {
  const ExploreKL_KL4K({super.key});

  @override
  _ExploreKL_KL4KState createState() => _ExploreKL_KL4KState();
}

class _ExploreKL_KL4KState extends State<ExploreKL_KL4K> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData('appExploreKL_KL4K');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("KL 4 Kids", style: TextStyle(color: Colors.white)),
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

class ExploreKL_PWOR extends StatefulWidget {
  const ExploreKL_PWOR({super.key});

  @override
  _ExploreKL_PWORState createState() => _ExploreKL_PWORState();
}

class _ExploreKL_PWORState extends State<ExploreKL_PWOR> {
  late Future<List<ApiData>> _data;
  late Future<List<ApiData>> _data2;

  late Future<List<ApiData>> _data3;

  late Future<List<ApiData>> _data4;

  @override
  void initState() {
    super.initState();
    _data = fetchData2('appExploreKL_PWOR', 'muslim');
    _data2 = fetchData2('appExploreKL_PWOR', 'tao');
    _data3 = fetchData2('appExploreKL_PWOR', 'hindu');
    _data4 = fetchData2('appExploreKL_PWOR', 'other');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Muslim'),
              Tab(text: 'Buddhist/Tao'),
              Tab(text: 'Hindu'),
              Tab(text: 'Others'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Places Of Worship",
              style: TextStyle(color: Colors.white)),
          // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          FutureBuilder<List<ApiData>>(
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
          FutureBuilder<List<ApiData>>(
            future: _data2,
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

          // Content for Tab 2
          FutureBuilder<List<ApiData>>(
            future: _data3,
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

          // Content for Tab 3
          FutureBuilder<List<ApiData>>(
            future: _data4,
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
        ]),
      ),
    );
  }
}

class ExploreKL_WTE extends StatefulWidget {
  const ExploreKL_WTE({super.key});

  @override
  _ExploreKL_WTEState createState() => _ExploreKL_WTEState();
}

class _ExploreKL_WTEState extends State<ExploreKL_WTE> {
  late Future<List<ApiData>> _data;
  late Future<List<ApiData>> _data2;

  late Future<List<ApiData>> _data3;

  @override
  void initState() {
    super.initState();
    _data = fetchData('appExploreKL_WTE_SF');
    _data2 = fetchData('appExploreKL_WTE_C');
    _data3 = fetchData('appExploreKL_WTE_R');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Street Food'),
              Tab(text: 'Cafes'),
              Tab(text: 'Restaurants'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("What To Eat", style: TextStyle(color: Colors.white)),
          // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          FutureBuilder<List<ApiData>>(
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
          FutureBuilder<List<ApiData>>(
            future: _data2,
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

          // Content for Tab 2
          FutureBuilder<List<ApiData>>(
            future: _data3,
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
        ]),
      ),
    );
  }
}

class ExploreKL_NL extends StatefulWidget {
  const ExploreKL_NL({super.key});

  @override
  _ExploreKL_NLState createState() => _ExploreKL_NLState();
}

class _ExploreKL_NLState extends State<ExploreKL_NL> {
  late Future<List<ApiData>> _data;
  late Future<List<ApiData>> _data2;

  late Future<List<ApiData>> _data3;

  @override
  void initState() {
    super.initState();
    _data = fetchData2('appExploreKL_NL', 'nl');
    _data2 = fetchData2('appExploreKL_NL', 'bars');
    _data3 = fetchData2('appExploreKL_NL', 'nm');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Night-Life'),
              Tab(text: 'Bars'),
              Tab(text: 'Night Market'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Night Life", style: TextStyle(color: Colors.white)),
          // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          FutureBuilder<List<ApiData>>(
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
          FutureBuilder<List<ApiData>>(
            future: _data2,
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

          // Content for Tab 2
          FutureBuilder<List<ApiData>>(
            future: _data3,
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
        ]),
      ),
    );
  }
}

class ExploreKL_SS extends StatefulWidget {
  const ExploreKL_SS({super.key});

  @override
  _ExploreKL_SSState createState() => _ExploreKL_SSState();
}

class _ExploreKL_SSState extends State<ExploreKL_SS> {
  late Future<List<ApiData>> _data;
  late Future<List<ApiData>> _data2;

  late Future<List<ApiData>> _data3;

  @override
  void initState() {
    super.initState();
    _data = fetchData2('appExploreKL_SS', 'mv');
    _data2 = fetchData2('appExploreKL_SS', 'mm');
    _data3 = fetchData2('appExploreKL_SS', 'art');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Must Visit'),
              Tab(text: 'Museums'),
              Tab(text: 'KL Art Scene'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title:
              const Text("Sightseeing", style: TextStyle(color: Colors.white)),
          // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          FutureBuilder<List<ApiData>>(
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
          FutureBuilder<List<ApiData>>(
            future: _data2,
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

          // Content for Tab 2
          FutureBuilder<List<ApiData>>(
            future: _data3,
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
        ]),
      ),
    );
  }
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2,mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
