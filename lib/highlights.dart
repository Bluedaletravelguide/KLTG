import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GlancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("KL @ A Glance", style: TextStyle(color: Colors.white)),
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
            CachedNetworkImage(imageUrl: 'https://www.kltheguide.com.my/assets/img/highlights/KLATGLANCE-01-2.jpg' ,
               ),
            SizedBox(height: 16),
            Text(
              'KL @ A Glance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Kuala Lumpur city center (KL) is renowned for its tall, futuristic skyscrapers and modern structures. Yet, to experience KL, you 're going to have to walk through its streets and roads to appreciate KL at its best. That's how you're going to be able to smell the food from the hawker stalls, appreciate the murals on the some of the older buildings. The more you walk, the more you will come to realise that KL is not just about concrete skyscrapers, but is a work of architectural art. Sauntering along the streets, you would be able to take in the sights of KL better.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "KL's establishment was almost an accident. In 1857, 87 Chinese prospectors, looking for tin, arrived at the meeting point of the Klang and Gombak rivers and set up camp, naming the place Kuala Lumpur, meaning 'muddy confluence'.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            // const Text(
            //   "No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor.",
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 8),
            // Container(
            //   child: const Text(
            //     "Opening Hours:",
            //     textAlign: TextAlign.start,
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
            // RichText(
            //   text: const TextSpan(
            //     text: 'Monday-Friday :',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '9:00AM - 6:00PM',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 8),
            // RichText(
            //   text: TextSpan(
            //     text: 'Mobile Num.: ',
            //     style: const TextStyle(
            //         color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '+6012-2200622',
            //         style: const TextStyle(color: Colors.blue),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             _launchURL('tel:+60122200622');
            //           },
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 8),
            // RichText(
            //   text: TextSpan(
            //     text: 'Telephone Num.: ',
            //     style: const TextStyle(
            //         color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '+603-7886 9219',
            //         style: const TextStyle(color: Colors.blue),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             _launchURL('tel:+60378869219');
            //           },
            //       ),
            //     ],
            //   ),
            // ),
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
          color: Colors.white, //change your color here
        ),
        title: const Text("Getting Around KL",
            style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  final List<ItemData> items = [
    ItemData(
      'Light Rail Transit (LRT)',
      'https://www.kltheguide.com.my/assets/img/highlights/getaround/1.-lrt.png',
      'The Light Rail Transit (LRT) is one of the most commonly used public rail transport. The LRT is divided into two lines; Ampang/Sri Petaling and Kelana Jaya. This is the best means of transport if you are thinking of visiting places that aren’t within walking distance of Kuala Lumpur city centre. Helpline: 03-7885 2585',
    ),
    ItemData(
      'Mass Rapid Transit (MRT)',
      'https://www.kltheguide.com.my/assets/img/highlights/getaround/2.-mrt.png',
      'The Mass Rapid Transit (MRT) is divided into two lines; the first is the Sungai Buloh-Kajang line that is 51km-long with 31 stations along its route. All the stations start operating at 6.00 am daily. Closing times varies based on respective stations. A single journey is priced at RM1.20 and upwards. Helpline: 1800-82-6868',
    ),
    ItemData(
      'KTM Komuter',
      'https://www.kltheguide.com.my/assets/img/highlights/getaround/3.-ktm-komuter.png',
      'The oldest rail system in Malaysia, the KTM is catered more for the locals rather than tourists. It acts as a cheaper travel alternative to longer destinations. The lines are divided into two; Rawang - Pelabuhan Klang and Batu Caves - Seremban. Helpline: 03-2267 1200',
    ),
    ItemData(
      'KL Monorail',
      'https://www.kltheguide.com.my/assets/img/highlights/getaround/4.-kl-monorail.png',
      'The KL Monorail is a simple yet well-connected train system which runs between Kuala Lumpur’s transport hub KL Sentral and Titiwangsa in the heart of KL. It acts as a bridge between Kuala Lumpur city centre and the inner areas of Kuala Lumpur. The KL Monorail starts operations at 6.00 am and ceases at 12.00 am. Helpline: 03-2267 9888',
    ),
    ItemData(
      'RapidKL Bus',
      'https://www.kltheguide.com.my/assets/img/highlights/getaround/5.-rapid-kl-bus.png',
      'The RapidKL Bus is commonly seen at most train stations and usually acts as a transit-based mode of transportation for passengers to directly get to their preferred destinations. Each trip on the bus can cost up to RM5.00 per trip which can be paid by using exact change or through tapping your Touch n’ Go card upon entry and exit. Helpline: 03-7885 2585',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
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
                padding:
                    const EdgeInsets.all(16.0), // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 8.0), // Add spacing between title and content
                    Text(
                      items[index].content,
                      style: const TextStyle(
                          fontSize: 16.0), // Adjust the font size as needed
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
        title: const Text("Travel Tips", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
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
      'Weather',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/weather.png',
      'The climate in KL is quite humid all year-round. Anyone travelling to KL must always be ready for rains at any time of the year. Regardless, the best time to visit KL is from May-July or December-February.\nThe weather can be pretty hot between March - April. Due to the forest fires from Sumatera which typically happens between June - August, the dust particles may cast a haze over KL thus making it not an ideal time to visit the city.',
      'https://www.ventusky.com/',
    ),
    ItemData2(
      'Time Zone',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/timezone.png',
      'Standard Malaysian time is 8 hours ahead of GMT (GMT +8).Standard Malaysian time is 8 hours ahead of GMT (GMT +8).',
      'https://www.timeanddate.com/',
    ),
    ItemData2(
      'Currency',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/currency-code.png',
      'Malaysia’s currency unit is divided into two. The term Ringgit Malaysia (RM) is used to refer to paper money. The denominations are RM1, RM5, RM10, RM 20, RM 50 and RM100. Whereas the coins are referred to as sen (cents). The denominations are 5 sen, 10 sen, 20 sen and 50 sen.\n',
      'https://www.xe.com/',
    ),
    ItemData2(
      'Visa and Passport',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/visa-and-passports.png',
      'Passports must be valid for at least 6 months at the time of entry. Visa requirements vary from time to time, so it is best to check with the Malaysian embassy or consulate or the Immigration Department website.',
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
                        items[index].text,
                        style: const TextStyle(
                          fontSize: 20.0, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8.0), // Add spacing between title and content
                      Text(
                        items[index].content,
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
}


class ApiData {
  final String title;
  final String content;
  final String image;
  final String location;

  ApiData(
     {required this.location,
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

        return GestureDetector(
          onTap: () {
            // print(item.location);
            if(item.location != ''){
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



class GetAround2 extends StatefulWidget {
  const GetAround2({super.key});

  @override
  _GetAround2State createState() => _GetAround2State();
}

class _GetAround2State extends State<GetAround2> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData2('appHighlights','traveltips');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Getting Around KL", style: TextStyle(color: Colors.white)),
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





class TravelTips2 extends StatefulWidget {
  const TravelTips2({super.key});

  @override
  _TravelTips2State createState() => _TravelTips2State();
}

class _TravelTips2State extends State<TravelTips2> {
  late Future<List<ApiData>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData2('appHighlights','gettingaround');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Travel Tips", style: TextStyle(color: Colors.white)),
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


void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
