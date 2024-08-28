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

// class ExploreKL_HS extends StatefulWidget {
//   const ExploreKL_HS({super.key});

//   @override
//   _ExploreKL_HSState createState() => _ExploreKL_HSState();
// }

// class _ExploreKL_HSState extends State<ExploreKL_HS> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appExploreKL_HS');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Historical Sites",
//             style: TextStyle(color: Colors.white)),
//         // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//         backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//         actions: const <Widget>[
//           AppBarMore(),
//         ],
//       ),
//       body: FutureBuilder<List<ApiData>>(
//         future: _data,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return CardListWidget(data: snapshot.data ?? []);
//           }
//         },
//       ),
//     );
//   }
// }

class ExploreKL_HS2 extends StatefulWidget {
  const ExploreKL_HS2({super.key});

  @override
  State<ExploreKL_HS2> createState() => _ExploreKL_HS2();
}

class _ExploreKL_HS2 extends State<ExploreKL_HS2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Historical Sites",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList(), // This is where the images and text will be displayed.
    );
  }
}

class MyList extends StatelessWidget {
  final List<ItemData> items = [
    ItemData(
        'Dataran Merdeka',
        'https://www.kltheguide.com.my/assets/img/explorekl/hs/dataranmerdeka.jpg',
        'Dataran Merdeka, also known as Merdeka Square, is without a doubt KL\'s most well-known landmark. It is located in front of the Sultan Abdul Samad Building and is also known as Dataran Merdeka (the former State Secretariat). This is the historical site where the Union Flag was lowered and the Malayan flag was lifted for the first time on August 31, 1957, at the stroke of midnight. Merdeka Square has been the site of the annual Merdeka Parade since then.',
        'Location: Jalan Raja, City Centre, 50050 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
        'Open 24 hours (Daily)'),
    ItemData(
      'Kuala Lumpur Railway Station',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/klrailway.jpg',
      'To the southeast of the National Mosque is the Kuala Lumpur Railway Station, a nearly fairytale Moorish-style structure. It was KL\'s main railway hub until 2001 when Kuala Lumpur Sentral took over much of its function. It is situated along Jalan Sultan Hishamuddin (previously known as Victory Avenue). Because of its stunning façade, the building is a popular tourist destination in the area. The open-plan Renaissance-style building\'s expansive verandas with arched colonnades make for beautiful photo opportunities.',
      'Location: Kampung Attap, 50000 Kuala Lumpur, Federal Territory of Kuala Lumpur',
      '',
    ),
    ItemData(
      'Royal Museum',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/royalmuseum.jpg',
      'Would you like to see what it\'s like to live in a palace? The Royal Museum is perhaps the best location to see and experience the royal way of life. The Royal Museum opened its doors on 1 February 2013, is housing in the old National Palace, which served as the official residence of Malaysia\'s King and Queen. The former National Palace has been turned into a museum and is now open to the public. Within this two-story structure, you will see the Balairung Seri (a room where the King addresses his subjects), the sleeping chamber, the royal office, the dining hall, and the nation\'s King\'s resting lounge.',
      'Location : Jln Istana, Istana Negara, 50460 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
      '9.00 am - 5.00 pm (Daily',
    ),
    ItemData(
      'Sultan Abdul Samad',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/sultanabdul.jpg',
      'The Sultan Abdul Samad Building (named after the 4th Sulatan of Selangor, Sultan Abdul Samad Ibni Raja Abdullah (1857-1898)) was built in 1897 and designed by A.C. Norman. The house, which is entirely made of brick, has heavy gothic, western, and Moorish influences, with an elegant porch, graceful arches, circular colonnades capped with polished copper cupolas, and a domineering 41.2m high clock tower. It is also used as a backdrop for Malaysia\'s annual Independence Day parades (which take place past Dataran Merdeka).',
      'Location : Jalan Raja, Kuala Lumpur City Centre, 50050 Kuala Lumpur, Federal Territory of Kuala Lumpur',
      'Open 24hours (Daily)',
    ),
    ItemData(
      'Tugu Negara',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/tugunegara.jpg',
      'The National Monument (Tugu Negara) was built in memory of Malaysia \'s fallen "soldiers" during the country\'s struggle for independence. It commemorates the fallen veterans of World War II, when Japan invaded this part of Southeast Asia next to that also the repelling of communism is often mentioned. The monument is one of the world \'s largest bronze sculptures, standing 15.5 metres tall and designed by architect Felix de Weldon in 1966 has designed others such as the famous Iwo Jima monument.',
      'Location : Perdana Botanical Garden, Jalan Parlimen, Kuala Lumpur City Centre, 50480 Kuala Lumpur, Federal Territory of Kuala Lumpur',
      '7.00 am - 6.00 pm (Daily)',
    ),
    ItemData(
      'Victoria Fountain',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/6.jpg',
      'The Queen Victoria fountain in Kuala Lumpur, Malaysia was completed in 1904. The two-tiered fountain is adorned with gargoyles on all four sides of its foundation. Lights are lit up at night time which illuminates the structure of the fountain as well as its reservoir.',
      'Location : City Centre, 50050 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
      'Open 24 hours (Daily)',
    ),
    ItemData(
      'Ilham Baru Tower',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/7.jpg',
      'The Ilham Baru Tower is a 58 storey skyscraper on Jalan Binjai, in the KLCC enclave in downtown Kuala Lumpur. Ilham Baru Tower is the third tallest skyscraper in the KLCC area with 978 feet of height.',
      'Location : Ilham Tower, 8, Jln Binjai, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
      '9.00 am - 5.00 pm (Daily)',
    ),
    ItemData(
      'Bangunan Sulaiman',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/8.jpg',
      'Bangunan Sulaiman is one of Kuala Lumpur\'s most well-known British colonial monuments, spanning 16,430 square metres. It was founded in 1933 and has hosted a variety of government departments, including the Syariah court.',
      'Location : Jalan Sultan Hishamuddin, Kampung Attap, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
      '8.30 am - 5.30 pm (Monday - Friday) /Closed on Saturday & Sunday',
    ),
    ItemData(
      'Central Market @ Pasar Seni',
      'https://www.kltheguide.com.my/assets/img/explorekl/hs/centralmarket.jpg',
      'This building was built in 1892 and functioned as a wet market until the 1980s. It was later revamped and turned into a tourist attraction that sells local handicrafts.',
      'Location : No. 10, 1st-3rd floor, Jalan Hang Kasturi',
      '10.00 am - 6.00 pm (Daily)',
    ),
  ];

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
  final String location;
  final String hours;

  ItemData(this.text, this.imageUrl, this.content, this.location, this.hours);
}

class ExploreKL_P2 extends StatefulWidget {
  const ExploreKL_P2({super.key});

  @override
  _ExploreKL_P2State createState() => _ExploreKL_P2State();
}

class _ExploreKL_P2State extends State<ExploreKL_P2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Parks", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList7(
        items: [
          ItemData7(
            'Taman Eko Rimba, Kuala Lumpur',
            'https://www.kltheguide.com.my/assets/img/explorekl/p/1024px-KL_Forest_Eco-Park_Canopy_Walk_9.jpg',
            'Kuala Lumpur, 50250 Kuala Lumpur, Federal Territory of Kuala Lumpur',
            '7.00 am - 6.00 pm',
            '+603- 2020 1606',
          ),
          ItemData7(
            'ASEAN Sculpture Garden',
            'https://www.kltheguide.com.my/assets/img/explorekl/p/asean-sculture-park.webp',
            'ASEAN Sculpture Garden, Persiaran Sultan Salahuddin, Taman Tasik Perdana, 50480 Kuala Lumpur',
            '7:00 AM - 10:00 PM',
            '+6016-333 7328',
          ),
          ItemData7(
            'KLCC Park',
            'https://www.kltheguide.com.my/assets/img/explorekl/p/1024px-Kuala_Lumpur._KLCC_Park._2019-12-09_22-22-42.jpg',
            'Jalan Ampang, Kuala Lumpur City Centre, 50088 Kuala Lumpur',
            '7.00 am - 10.00 pm ( Daily )',
            '',
          ),
          // Add more parks here
        ],
      ),
    );
  }
}

class ItemData7 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String contact;

  ItemData7(this.text, this.imageUrl, this.location, this.hours, this.contact);
}

class MyList7 extends StatelessWidget {
  final List<ItemData7> items;

  MyList7({required this.items});

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    if (items[index].contact.isNotEmpty) ...[
                      const SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {
                          _launchURL(items[index].contact);
                        },
                        child: Text(
                          'Website: ${items[index].contact}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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

// class ExploreKL_KL4K extends StatefulWidget {
//   const ExploreKL_KL4K({super.key});

//   @override
//   _ExploreKL_KL4KState createState() => _ExploreKL_KL4KState();
// }

// class _ExploreKL_KL4KState extends State<ExploreKL_KL4K> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appExploreKL_KL4K');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("KL 4 Kids", style: TextStyle(color: Colors.white)),
//         // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//         backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//         actions: const <Widget>[
//           AppBarMore(),
//         ],
//       ),
//       body: FutureBuilder<List<ApiData>>(
//         future: _data,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return CardListWidget(data: snapshot.data ?? []);
//           }
//         },
//       ),
//     );
//   }
// }

class ExploreKL_KL4K2 extends StatefulWidget {
  const ExploreKL_KL4K2({super.key});

  @override
  _ExploreKL_KL4K2State createState() => _ExploreKL_KL4K2State();
}

class _ExploreKL_KL4K2State extends State<ExploreKL_KL4K2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // change your color here
        ),
        title: const Text("KL 4 Kids", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList6(
        items: [
          ItemData6(
            'Aeon Fantasy',
            'https://www.kltheguide.com.my/assets/img/explorekl/kl4k/TM.jpg',
            'F41, Tingkat 1, AEON Alpha Angle Shopping Centre, Jln R1, Seksyen 1, Bandar Baru Wangsa Maju, 53300 Kuala Lumpur.',
            '10.00 AM - 10.00 PM (Sun - Thur), 10.00 AM - 11.00 PM (Friday - Saturday)',
            '+603-41497666',
          ),
          ItemData6(
            'KL Upside Down House',
            'https://www.kltheguide.com.my/assets/img/explorekl/kl4k/klupsidedown.webp',
            'Off, Jalan P Ramlee, &, Jalan Puncak, 50250 Kuala Lumpur',
            '10 am - 10 pm ( Daily )',
            '+603-50319458',
          ),
          ItemData6(
            'KL Tower Mini Zoo',
            'https://www.kltheguide.com.my/assets/img/explorekl/kl4k/kltowerminizoo.webp',
            'Ground Floor, Menara Kuala Lumpur, WP, Jalan Puncak, 50250 Kuala Lumpur',
            '10 am - 9 pm ( Daily )',
            '+603-20223943',
          ),
          ItemData6(
            'Petrosains KLCC',
            'https://www.kltheguide.com.my/assets/img/explorekl/kl4k/Petrosains%20KLCC%20by%20Emran%20Kassim.jpg',
            'Level 4, Suria KLCC, PETRONAS Twin Towers, Kuala Lumpur City Centre, 50088, Kuala Lumpur',
            ': 9.30am - 5.30pm (Tue - Sun)',
            '+603-2331 8181',
          ),
          // Add more kids-friendly places here
        ],
      ),
    );
  }
}

class ItemData6 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String contact;

  ItemData6(this.text, this.imageUrl, this.location, this.hours, this.contact);
}

class MyList6 extends StatelessWidget {
  final List<ItemData6> items;

  MyList6({required this.items});

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].contact);
                      },
                      child: Text(
                        'Contact: ${items[index].contact}',
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

// class ExploreKL_PWOR extends StatefulWidget {
//   const ExploreKL_PWOR({super.key});

//   @override
//   _ExploreKL_PWORState createState() => _ExploreKL_PWORState();
// }

// class _ExploreKL_PWORState extends State<ExploreKL_PWOR> {
//   late Future<List<ApiData>> _data;
//   late Future<List<ApiData>> _data2;

//   late Future<List<ApiData>> _data3;

//   late Future<List<ApiData>> _data4;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData2('appExploreKL_PWOR', 'muslim');
//     _data2 = fetchData2('appExploreKL_PWOR', 'tao');
//     _data3 = fetchData2('appExploreKL_PWOR', 'hindu');
//     _data4 = fetchData2('appExploreKL_PWOR', 'other');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.white, //change your color here
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Muslim'),
//               Tab(text: 'Buddhist/Tao'),
//               Tab(text: 'Hindu'),
//               Tab(text: 'Others'),
//             ],
//             unselectedLabelColor: Colors.white,
//             labelColor: Colors.white,
//             labelStyle: TextStyle(fontWeight: FontWeight.w800),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
//           ),
//           title: const Text("Places Of Worship",
//               style: TextStyle(color: Colors.white)),
//           // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//           backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//           actions: const <Widget>[
//             AppBarMore(),
//           ],
//         ),
//         body: TabBarView(children: [
//           FutureBuilder<List<ApiData>>(
//             future: _data,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//           FutureBuilder<List<ApiData>>(
//             future: _data2,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),

//           // Content for Tab 2
//           FutureBuilder<List<ApiData>>(
//             future: _data3,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),

//           // Content for Tab 3
//           FutureBuilder<List<ApiData>>(
//             future: _data4,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }

class ExploreKL_PWOR2 extends StatefulWidget {
  const ExploreKL_PWOR2({super.key});

  @override
  _ExploreKL_PWOR2State createState() => _ExploreKL_PWOR2State();
}

class _ExploreKL_PWOR2State extends State<ExploreKL_PWOR2> {
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
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList2(
              items: [
                ItemData2(
                  'Masjid Negara',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/masjidnegara.jpg',
                  'Jalan Perdana, Tasik Perdana, 50480 Kuala Lumpur',
                  '9.00 am - 11.00 pm (Sat- Thurs) / 2.45 am - 6.00pm (Friday)',
                  'http://masjidnegara.gov.my/mn/',
                  '',
                ),
                ItemData2(
                  'Masjid Jamek',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/masjidjamek.jpg',
                  'Jalan Tun Perak, City Centre, 50050 Kuala Lumpur',
                  '10.00 am - 12.30 pm; 2.30 pm - 4.00 pm (Sat - Thurs) / Closed on Fridays',
                  'http://www.facebook.com/jamekmosque2',
                  '',
                ),
                ItemData2(
                  'Federal Territory Mosque Kuala Lumpur',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Masjid_Wilayah_Persekutuan.jpg',
                  'Jalan Sultan Mizan Zainal Abidin, Kompleks Kerajaan, Kuala Lumpur',
                  '',
                  '',
                  '+603 6201 8791',
                ),
                ItemData2(
                  'Masjid Al Bukhari',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Masjid%20Al%20Bukhari.jpg',
                  '1, Jalan Hang Tuah, Bukit Bintang, 55200 Kuala Lumpur',
                  '',
                  '',
                  '+603-9221 0554',
                ),
                ItemData2(
                  'Masjid Jamek Abdullah Hukum - KL Eco City',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Masjid_Jamek_Abdullah_Hukum.jpg',
                  '59200 Kuala Lumpur, Federal Territory of Kuala Lumpur',
                  '',
                  '',
                  '+603-2201 8492',
                ),
                ItemData2(
                  'Masjid Asy-Syakirin KLCC',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/As_Syakirin_Mosque,_Kuala_Lumpur.jpg',
                  'Lot 41, Seksyen, 58, Jalan Pinang, 50450 Kuala Lumpur',
                  '',
                  '',
                  '+603-2380 1293',
                ),
                ItemData2(
                  'Masjid Al -Firdaus',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/alfirdaus.jpg',
                  'Jalan Masjid Firdaus, Jalan 1/42, Segambut Luar, 51200 Kuala Lumpur',
                  '',
                  '',
                  '+6011-2847 0032',
                ),
                ItemData2(
                  'Masjid Jamiul Ehsan',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/jamiulehsan.jpg',
                  'Jalan Pahang, Taman Setapak Indah Jaya, 53000 Kuala Lumpur',
                  '',
                  '',
                  '',
                ),
                // Add more Muslim places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'Thean Hou Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/theanhou.jpg',
                  '65, Persiaran Endah, Taman Persiaran Desa, 50460 Kuala Lumpur',
                  'Operating Hours: 8.00am - 2.00pm / 4.00pm - 10.00pm (Daily)',
                  'https://www.hainannet.com.my'
                      '',
                  '+603-2274 7088',
                ),
                ItemData2(
                  'Guan Di Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/guandi.jpg',
                  '168, Jalan Tun H S Lee, City Centre, 50000 Kuala Lumpur',
                  '8.30am - 5.30pm (Weekdays) / Closed on Weekends',
                  'http://kwongsiew.org/',
                  '+603-2072 6669',
                ),
                ItemData2(
                  'Buddhist Maha Vihara Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/mahavihara.png',
                  '123 Jalan Berhala, Brickfields, Kuala Lumpur',
                  '8.00am - 2.00pm /5.00pm - 9.00pm (Daily)',
                  'https://buddhistmahavihara.org/',
                  '+603-2274 1141',
                ),
                ItemData2(
                  'Sin Sze Si Ya Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/szeyatemple.png',
                  '113A, Jalan Tun H S Lee, City Centre, 50050 Kuala Lumpur',
                  '7.00am - 5.00pm (Daily)',
                  '',
                  '+603-2078 9052',
                ),
                ItemData2(
                  'Sri Jayanti Buddhist Temple Sentul',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Sri%20Jayanti%20Buddhist%20Temple%20Sentul.jpg',
                  'Jalan Tujuh, Sentul Selatan, 51000 Kuala Lumpur',
                  '',
                  '',
                  '+603-4041 9459',
                ),
                ItemData2(
                  'Wong Loo Sen See Chee Choong Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/7.jpg',
                  'Off, Jalan Cheras & Jalan Lombong, Cheras Batu 2 1/2, 55200 Kuala Lumpur',
                  '',
                  '',
                  '+603-92845396',
                ),
                // Add more Buddhist/Tao places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'Sri Mahamariamman Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/SriMahamariammanTemple.jpg',
                  'Jalan Tun H S Lee, City Centre, 50000 Kuala Lumpur',
                  '6.00 am - 8.30 pm (Sun- Thurs) / 6.00 am - 9.30pm (Friday) / 6.00 am - 9.00pm (Sunday)',
                  '',
                  '+603-2078 5323',
                ),
                ItemData2(
                  'Batu Caves Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/batucaves.jpg',
                  'Gombak, 68100 Batu Caves, Selangor',
                  '',
                  '',
                  '+603-6189 6284',
                ),
                ItemData2(
                  'Sri Kandaswamy Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Sri%20Kandaswamy%20Temple.jpg',
                  'Brickfields, 50470 Kuala Lumpur',
                  '',
                  'http://www.srikandaswamykovil.org/',
                  '+603-2274 2987',
                ),
                ItemData2(
                  'Shree Lakshmi Narayan Mandir',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/shree.jpg',
                  'Lot 68, 69, Jalan Kasipillay, Kampung Kasipillay, 51200 Kuala Lumpur',
                  '8.00 am - 12.00 pm /4.00pm - 8.00pm (Daily)',
                  'https://www.sdskl.com.my/',
                  '+603-4041 2993',
                ),
                ItemData2(
                  'Arulmigu Sri Ramalinga Eeswarar Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/arulmigu.jpg',
                  '8, Jalan Tandok, Bangsar, 59100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  '',
                  '',
                  '',
                ),
                ItemData2(
                  'Sri Maha Sakthi Mohambigai Amman Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/sri%20(30).jpg',
                  'Mid Valley Megamall, 75, Lingkaran Syed Putra, Mid Valley City, 58000 Kuala Lumpur',
                  '+603-2282 1317',
                  '',
                  '',
                ),
                ItemData2(
                  'Korttu Malai Pillayar Temple',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/korttu.jpg',
                  'Jalan Persiaran Maybank, Bukit Bintang, 50200 Kuala Lumpur',
                  '5.00am - 10.30am/3.45pm - 8.30pm (Daily)',
                  '',
                  '+603-2078 9825',
                ),
                ItemData2(
                  'Athi Eeswaran Temple Sentul Timur',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/athi.jpg',
                  'Jalan Tanah Lapang, Sentul Selatan, 51000 Kuala Lumpur',
                  '6.00 am - 10.00 am /11.30 am - 1.00 pm /5.30 pm - 9.00 pm (Daily)',
                  '',
                  '+603-40411028',
                ),
                // Add more Hindu places of worship here
              ],
            ),
            MyList2(
              items: [
                ItemData2(
                  'St Mary\'s Anglican Cathedral',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/stmary.png',
                  'Jalan Raja, City Centre, 50050 Kuala Lumpur',
                  '',
                  'http://www.stmaryscathedral.org.my/',
                  '+603-2692 8672',
                ),
                ItemData2(
                  'WMCKL Wesley Methodist Church Kuala Lumpu',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/2.jpg',
                  '2, Jalan Wesley, City Centre, 50150 Kuala Lumpur',
                  '8.30am - 4.30pm (Mon-Fri) / 8.30am - 12.30pm (Sat) / 8.00am - 10.30am (Sun)',
                  'https://linktr.ee/wmckl',
                  '+603-2072 0338',
                ),
                ItemData2(
                  'Church of The Holy Rosary',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Church%20of%20The%20Holy%20Rosary%20(30).jpg',
                  'Holy Rosary Church, 10, Jalan Tun Sambanthan, 50470 Kuala Lumpur',
                  '+603-2274 2747',
                  'http://www.hrckl.com/',
                  '',
                ),
                ItemData2(
                  'Kuala Lumpur Baptist Church',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/4.jpg',
                  '70, Changkat Bukit Bintang, Bukit Bintang, 50200 Kuala Lumpur',
                  '9.30am - 12.30pm (Sun) /8.30am - 4.30pm (Mon-Fri) /Closed on Saturday',
                  'http://www.klbc.org.my/',
                  '+603-2141 9154',
                ),
                ItemData2(
                  'Praise City Church, KL',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/5.jpg',
                  'No. 5 Jalan 1/118C, Desa Tun Razak Industrial Park, Bandar Tun Razak, 56000, Federal Territory of Kuala Lumpur',
                  '9.00am - 5.00pm (Tue-Fri) /9.00am - 1.00pm (Weekend) /Closed on Monday',
                  'http://www.praisecitykl.com/',
                  '+603-9171 3616',
                ),
                ItemData2(
                  'Guru Nanak Darbar Tatt Khalsa Diwan Gurdwara',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/Guru%20Nanak%20Darbar%20Tatt%20Khalsa%20Diwan%20Gurdwara.jpg',
                  '24, Jalan Raja Alang, Chow Kit, 50300 Kuala Lumpur',
                  '',
                  'https://facebook.com/TattKhalsaDiwan/',
                  '+603-2692 2215',
                ),
                ItemData2(
                  'Gurudwara Sahib Titiwangsa',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/7%20(30).jpg',
                  '41, Jalan Pahang, Titiwangsa, 53000 Kuala Lumpur',
                  '',
                  '',
                  '',
                ),
                ItemData2(
                  'Gurdwara Sahib Kuyow',
                  'https://www.kltheguide.com.my/assets/img/explorekl/pwor/10.jpg',
                  'Sungai Besi, 57000 Kuala Lumpur',
                  '',
                  'https://www.facebook.com/GurdwaraSahibKuyow/',
                  '+6018-967 7083',
                ),
                // Add more other places of worship here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData2> items;

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].website);
                      },
                      child: Text(
                        'Website: ${items[index].website}',
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

class ItemData2 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String website;
  final String contact;

  ItemData2(this.text, this.imageUrl, this.location, this.hours, this.website,
      this.contact);
}

// class ExploreKL_WTE extends StatefulWidget {
//   const ExploreKL_WTE({super.key});

//   @override
//   _ExploreKL_WTEState createState() => _ExploreKL_WTEState();
// }

// class _ExploreKL_WTEState extends State<ExploreKL_WTE> {
//   late Future<List<ApiData>> _data;
//   late Future<List<ApiData>> _data2;

//   late Future<List<ApiData>> _data3;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appExploreKL_WTE_SF');
//     _data2 = fetchData('appExploreKL_WTE_C');
//     _data3 = fetchData('appExploreKL_WTE_R');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.white, //change your color here
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Street Food'),
//               Tab(text: 'Cafes'),
//               Tab(text: 'Restaurants'),
//             ],
//             unselectedLabelColor: Colors.white,
//             labelColor: Colors.white,
//             labelStyle: TextStyle(fontWeight: FontWeight.w800),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
//           ),
//           title:
//               const Text("What To Eat", style: TextStyle(color: Colors.white)),
//           // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//           backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//           actions: const <Widget>[
//             AppBarMore(),
//           ],
//         ),
//         body: TabBarView(children: [
//           FutureBuilder<List<ApiData>>(
//             future: _data,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//           FutureBuilder<List<ApiData>>(
//             future: _data2,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),

//           // Content for Tab 2
//           FutureBuilder<List<ApiData>>(
//             future: _data3,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }

class ExploreKL_WTE2 extends StatefulWidget {
  const ExploreKL_WTE2({super.key});

  @override
  _ExploreKL_WTE2State createState() => _ExploreKL_WTE2State();
}

class _ExploreKL_WTE2State extends State<ExploreKL_WTE2> {
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
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            // Street Food Tab
            MyList5(
              items: [
                ItemData5(
                  'Jalan Alor',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/sf/jalanalor.jpg',
                  'Bukit Bintang, Kuala Lumpur, Federal Territory of Kuala Lumpur',
                  '',
                  '',
                ),
                ItemData5(
                  'Taman Connaught Night Market',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/sf/tamanconnaught.png',
                  '130, 108, Jalan Cerdas, Taman Connaught, 56000 Kuala Lumpur, Federal Territory of Kuala Lumpur',
                  '6.00 pm - 1.00 am (Wed)',
                  '',
                ),
                ItemData5(
                  'Petaling Street',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/sf/petalingstreet.jpg',
                  'Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  'Open 24 Hours (Daily)',
                  '',
                ),
                // Add more Street Food places here
              ],
            ),
            // Cafes Tab
            MyList5(
              items: [
                ItemData5(
                  'Wildflowers KL',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/c/wildflowerskl.webp',
                  'Jalan Petaling, 50000 Kuala Lumpur',
                  '12.00 pm - 12.00 am (Fri-Sat) 12.00 pm - 10.00 pm (Sun) 5.00 pm - 10.00 pm (Tues,Wed,Thurs) Monday (Closed)',
                  '',
                ),
                ItemData5(
                  'Lisette\'s Café & Bakery',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/c/lisette.webp',
                  'No. 8, Jalan Kemuja, Bangsar, 59000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  '8.00 am - 10.00 pm (Daily)',
                  '',
                ),
                ItemData5(
                  'Merchant\'s Lane',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/c/merchantlane.webp',
                  '8.00 am - 10.00 pm (Daily)',
                  '150, Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  '',
                ),
                // Add more Cafes here
              ],
            ),
            // Restaurants Tab
            MyList5(
              items: [
                ItemData5(
                  'Bijan Bar & Restaurant',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/r/bijan.webp',
                  'No 3, Jalan Ceylon, Bukit Ceylon, 50200 Kuala Lumpur',
                  '12.00 PM - 11.00 PM (Daily)',
                  '+603-2031 3575',
                ),
                ItemData5(
                  'Songket Restaurant',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/r/songket.webp',
                  '31G, Plaza Crystavilla, 1, Jalan 22a/70a, Desa Sri Hartamas, 50480 Kuala Lumpur',
                  '12.00 PM - 10.00 PM (Daily)',
                  '+6010-958 9598',
                ),
                ItemData5(
                  'Manja Old Malaya',
                  'https://www.kltheguide.com.my/assets/img/explorekl/wte/r/manja.webp',
                  '6, Lorong Raja Chulan, Kuala Lumpur, 50250 Kuala Lumpur',
                  '12.00 PM - 12.00 AM (Daily)',
                  '+6012-373 7063',
                ),
                // Add more Restaurants here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList5 extends StatelessWidget {
  final List<ItemData5> items;

  MyList5({required this.items});

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
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
                        'Website: ${items[index].website}',
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

class ItemData5 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String website;

  ItemData5(this.text, this.imageUrl, this.location, this.hours, this.website);
}

// class ExploreKL_NL extends StatefulWidget {
//   const ExploreKL_NL({super.key});

//   @override
//   _ExploreKL_NLState createState() => _ExploreKL_NLState();
// }

// class _ExploreKL_NLState extends State<ExploreKL_NL> {
//   late Future<List<ApiData>> _data;
//   late Future<List<ApiData>> _data2;

//   late Future<List<ApiData>> _data3;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData2('appExploreKL_NL', 'nl');
//     _data2 = fetchData2('appExploreKL_NL', 'bars');
//     _data3 = fetchData2('appExploreKL_NL', 'nm');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.white, //change your color here
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Night-Life'),
//               Tab(text: 'Bars'),
//               Tab(text: 'Night Market'),
//             ],
//             unselectedLabelColor: Colors.white,
//             labelColor: Colors.white,
//             labelStyle: TextStyle(fontWeight: FontWeight.w800),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
//           ),
//           title:
//               const Text("Night Life", style: TextStyle(color: Colors.white)),
//           // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//           backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//           actions: const <Widget>[
//             AppBarMore(),
//           ],
//         ),
//         body: TabBarView(children: [
//           FutureBuilder<List<ApiData>>(
//             future: _data,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//           FutureBuilder<List<ApiData>>(
//             future: _data2,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),

//           // Content for Tab 2
//           FutureBuilder<List<ApiData>>(
//             future: _data3,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }

class ExploreKL_NL2 extends StatefulWidget {
  const ExploreKL_NL2({super.key});

  @override
  _ExploreKL_NL2State createState() => _ExploreKL_NL2State();
}

class _ExploreKL_NL2State extends State<ExploreKL_NL2> {
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
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList3(
              items: [
                ItemData3(
                  'Changkat, Bukit Bintang',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/Changkat.jpg',
                  'Hosting heaps of themed nights, talented DJs, and live band shows, it\'s safe to say that Changkat Bukit Bintang\'s nightlife is anything but boring. Among the many watering holes available here, there are a few establishments that stand out because of their unique concepts. Stand-up comedy, international film screenings and open mic nights are just some of the activities you can find in this area.',
                  '',
                  '',
                ),
                ItemData3(
                  'Bangsar',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/bangsar.png',
                  'Bangsar and Mid Valley play hosts to a number of trendy resto-bars, pubs, and cocktail lounges. Most of these nightlife hotspots are concentrated around Jalan Telawi in Bangsar Baru and are within walking distances from each other. A 10- minute drive from KL city centre, the area is always bustling with late-night revellers every Friday until Sunday.',
                  '',
                  '',
                ),
                ItemData3(
                  'Ampang',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/1024px-JalanAmpangNight.jpg',
                  'It goes without saying that the nightlife in Ampang is diverse; rooftop bars are ideal for those who choose to sit back and enjoy a glass of wine while enjoying a breathtaking view of KL\'s glittering skyline, while late-night enthusiasts should head to one of the city\'s largest nightclubs to mingle with fashion-forward locals and dance the night away to heart-wrenching electronic dance music.',
                  '',
                  '',
                ),
                ItemData3(
                  'Petaling Street',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/1024px-Petaling_Street,_Kuala_Lumpur.jpg',
                  'Petaling Street is a league of its own. It\'s not about rows of clubs, pubs and bars providing music-and-alcohol-fuelled entertainment, but the lively after-dark market that dominates the nightlife scene here. The entire area is turned into a lively and vibrant night market when the sun sets. You can also find a variety of nightlife hotspots here, from inns complete with outdoor rooftop bars to chatelaines and cocktail bars are hidden along narrow alleyways.',
                  '',
                  '',
                ),
                // Add more Night-Life places here
              ],
            ),
            MyList3(
              items: [
                ItemData3(
                  'Marini \'s On 57',
                  'https://lh3.googleusercontent.com/p/AF1QipOw-nEwlxUnjIX50EgmfBVdO24HGkvKGgW0XsCv=s680-w680-h510',
                  '57 Menara 3 Petronas Persiaran, Kuala Lumpur City Centre, 50088 Kuala Lumpur',
                  '5.00 pm - 3.00 am (Daily)',
                  '',
                ),
                ItemData3(
                  'Heli Lounge Bar',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/Heli%20Lounge%20Bar%20(30).png',
                  '4 Menara KH, Jalan Sultan Ismail, Bukit Bintang, 50450, Wilayah Persekutuan Kuala Lumpur',
                  '5.00 pm - 12.00 am (Sun-Wed)',
                  'https://theroof.com.my/',
                ),
                ItemData3(
                  'Zeta Bar',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/zeta%20bar%20(30).png',
                  'Level 5, 3, Jalan Stesen Sentral, Kuala Lumpur Sentral, 50470 Kuala Lumpur',
                  '10 am - 10 pm (Daily)',
                  '6017-877 9912',
                ),
                // Add more Bars here
              ],
            ),
            MyList3(
              items: [
                ItemData3(
                  'Connaught Night market',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/11.jpg',
                  'This street market is well-known among the locals for its wide selection of Chinese hawker fare such as curry noodles, char kuey teow, laksa, and satay, as well as local desserts, ice cream, and snacks.',
                  '130, 108, Jalan Cerdas, Taman Connaught, 56000 Kuala Lumpur',
                  '6.00 pm - 1.00 am (Wednesday)',
                ),
                ItemData3(
                  'Petaling Street',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/12.jpg',
                  'Jalan Petaling, City Centre, 50000 Kuala Lumpur',
                  '8.00 am - 8.00 pm (Monday - Sunday)',
                  '',
                ),
                ItemData3(
                  'Kasturi Walk',
                  'https://www.kltheguide.com.my/assets/img/explorekl/nl/13.jpg',
                  'Jalan Hang Kasturi, City Centre, 50050 Kuala Lumpur',
                  'Open 24 Hours',
                  '',
                ),

                // Add more Night Markets here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyList3 extends StatelessWidget {
  final List<ItemData3> items;

  MyList3({required this.items});

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    if (items[index].website.isNotEmpty)
                      const SizedBox(height: 8.0),
                    if (items[index].website.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          _launchURL(items[index].website);
                        },
                        child: Text(
                          'Website: ${items[index].website}',
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

class ItemData3 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String website;

  ItemData3(this.text, this.imageUrl, this.location, this.hours, this.website);
}

// class ExploreKL_SS extends StatefulWidget {
//   const ExploreKL_SS({super.key});

//   @override
//   _ExploreKL_SSState createState() => _ExploreKL_SSState();
// }

// class _ExploreKL_SSState extends State<ExploreKL_SS> {
//   late Future<List<ApiData>> _data;
//   late Future<List<ApiData>> _data2;

//   late Future<List<ApiData>> _data3;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData2('appExploreKL_SS', 'mv');
//     _data2 = fetchData2('appExploreKL_SS', 'mm');
//     _data3 = fetchData2('appExploreKL_SS', 'art');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.white, //change your color here
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Must Visit'),
//               Tab(text: 'Museums'),
//               Tab(text: 'KL Art Scene'),
//             ],
//             unselectedLabelColor: Colors.white,
//             labelColor: Colors.white,
//             labelStyle: TextStyle(fontWeight: FontWeight.w800),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
//           ),
//           title:
//               const Text("Sightseeing", style: TextStyle(color: Colors.white)),
//           // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//           backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//           actions: const <Widget>[
//             AppBarMore(),
//           ],
//         ),
//         body: TabBarView(children: [
//           FutureBuilder<List<ApiData>>(
//             future: _data,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//           FutureBuilder<List<ApiData>>(
//             future: _data2,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),

//           // Content for Tab 2
//           FutureBuilder<List<ApiData>>(
//             future: _data3,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return CardListWidget(data: snapshot.data ?? []);
//               }
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }

class ExploreKL_SS2 extends StatefulWidget {
  const ExploreKL_SS2({super.key});

  @override
  _ExploreKL_SS2State createState() => _ExploreKL_SS2State();
}

class _ExploreKL_SS2State extends State<ExploreKL_SS2> {
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
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(children: [
          // Must Visit Tab
          MyList4(
            items: [
              ItemData4(
                'KLCC',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/kong-kuala-2937763_1280.jpg',
                'Jalan Ampang, Golden Triangle, Kuala Lumpur City Centre, 50088',
                '10:00 am to 10:00 pm',
                '+603 2382 2828',
              ),
              ItemData4(
                'Istana Negara',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1024px-ISTANA_NEGARA_MALAYSIA.jpg',
                'Jalan Tuanku Abdul Halim, Bukit Damansara, 50480 Kuala Lumpur',
                '24 hours',
                '',
              ),
              ItemData4(
                'Tunku Abdul Rahman Putra Memorial',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/tarmemo.webp',
                'Jalan Dato Onn, 50480 Kuala Lumpur',
                '10.00am - 5.30pm (Tuesday to Sunday) , 12.00pm - 3.00pm (Temporary closed on Friday)',
                '+603-2694 7277',
              ),
              ItemData4(
                'Menara Kuala Lumpur/ KL Tower',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/kuala-lumpur-2720830_1280.jpg',
                'No. 2 Jalan Punchak Off Jalan P.Ramlee 50250 Kuala Lumpur',
                '11.00 am - 7.00 pm (Monday - Friday), 10.00 am - 10.00 pm (Saturday - Sunday)',
                '+603 2693 7905',
              ),
              // Add more Must Visit places here
            ],
          ),
          // Museums Tab
          MyList4(
            items: [
              ItemData4(
                'Ethnology of the Malay World Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1.jpg',
                'Jalan Damansara, Tasik Perdana, 50480 Kuala Lumpur',
                '9.00 am - 5.00 pm (Tuesday - Sunday), Closed on Monday',
                '+603-2267 1000',
              ),
              ItemData4(
                'National Textiles Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/2.webp',
                '26, Jalan Sultan Hishamuddin, City Centre, 50000 Kuala Lumpur',
                '9.00 am - 6.00 pm (Daily)',
                '',
              ),
              ItemData4(
                'Museum of Asian Arts',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/3.webp',
                'Jalan Ilmu, 50603 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                '8.30 am - 5.00 pm (Monday - Thursday), 8.30am - 5.00pm (Friday)',
                '+603-796 7380',
              ),
              // Add more Museums here
            ],
          ),
          // KL Art Scene Tab
          MyList4(
            items: [
              ItemData4(
                'Urban Museum',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/urmu.jpg',
                '3, Jalan Bedara, Bukit Bintang, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                '10.00 am - 8.30 pm (Tuesday - Sunday), Closed on Monday',
                '+603-2110 3004',
              ),
              ItemData4(
                'National Art Gallery',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/1art.jpg',
                'No. 2, Jalan Temerloh, Titiwangsa, 53200 Kuala Lumpur',
                'Operation Hours :10.00 am - 4.00 pm (Tuesday - Sunday), Closed on Monday',
                '+603-4026 7000',
              ),
              ItemData4(
                'OUR ArtProjects (The Zhongshan Building)',
                'https://www.kltheguide.com.my/assets/img/explorekl/ss/2.jpg',
                '80A, Jalan Rotan, Kampung Attap, 50460 Kuala Lumpur',
                '11.00 am - 7.00 pm (Tuesday - Saturday), Closed on Sunday & Monday',
                '+6016-660 2585',
              ),

              // Add more KL Art Scene places here
            ],
          ),
        ]),
      ),
    );
  }
}

class ItemData4 {
  final String text;
  final String imageUrl;
  final String location;
  final String hours;
  final String contact;

  ItemData4(this.text, this.imageUrl, this.location, this.hours, this.contact);
}

class MyList4 extends StatelessWidget {
  final List<ItemData4> items;

  MyList4({required this.items});

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
                      'Location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Operating Hours: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].contact);
                      },
                      child: Text(
                        'Website: ${items[index].contact}',
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
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
