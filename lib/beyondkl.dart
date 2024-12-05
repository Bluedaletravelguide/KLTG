import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'generated/l10n.dart';

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
                        item.title,
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

class BeyondKL extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      "name": S.current.islands, // localized key for "Islands"
      "image": "https://www.kltheguide.com.my/assets/img/beyondkl/ISLAND-01.jpg"
    },
    {
      "name": S.current.hillStation, // localized key for "Hill Station"
      "image":
          "https://www.kltheguide.com.my/assets/img/beyondkl/HILL-STATION-01.jpg"
    },
    {
      "name": S.current.waterfall, // localized key for "Waterfall"
      "image":
          "https://www.kltheguide.com.my/assets/img/beyondkl/WATERFALL-01.jpg"
    },
    {
      "name": S.current.hiking, // localized key for "Hiking"
      "image": "https://www.kltheguide.com.my/assets/img/beyondkl/HIKING.jpg"
    },
    {
      "name": S.current.extremeSports, // localized key for "Extreme Sports"
      "image":
          "https://www.kltheguide.com.my/assets/img/beyondkl/EXTREME-SPORT-2.webp"
    },
  ];

  BeyondKL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          S.of(context).beyondKL, // localized key for "Beyond KL"
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
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
    super.key,
    required this.name,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/beyondkl-$index',
            arguments: {'index': index});
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
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
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String location;

  const DetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(location),
      ),
    );
  }
}

class BeyondKL_I extends StatelessWidget {
  BeyondKL_I({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ApiData> dataList = [
      ApiData(
        title:
            S.of(context).pangkorIsland, // localized key for "Pangkor Island"
        content: S
            .of(context)
            .pangkorIslandContent, // localized key for content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/i/pangkor.webp",
        location: "https://maps.app.goo.gl/rHbUNhRs3Tj1ywg69",
      ),
      ApiData(
        title: S.of(context).pulauRedang, // localized key for "Pulau Redang"
        content: S
            .of(context)
            .pulauRedangContent, // localized key for content description
        image: "https://www.kltheguide.com.my/assets/img/beyondkl/i/redang.jpg",
        location: "https://maps.app.goo.gl/3wB5KeBaBLT49yR58",
      ),
      ApiData(
        title:
            S.of(context).pulauLangkawi, // localized key for "Pulau Langkawi"
        content: S
            .of(context)
            .pulauLangkawiContent, // localized key for content description
        image: "https://www.kltheguide.com.my/assets/img/beyondkl/i/redang.jpg",
        location: "https://maps.app.goo.gl/Kmx69vmc9CWNp6LJ8",
      ),
      ApiData(
        title:
            S.of(context).sipadanIsland, // localized key for "Sipadan Island"
        content: S
            .of(context)
            .sipadanIslandContent, // localized key for content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/i/sipadan.jpg",
        location: "https://maps.app.goo.gl/VbSXWmMNwAq7pk6D8",
      ),
      ApiData(
        title: S
            .of(context)
            .mantananiIsland, // localized key for "Mantanani Island"
        content: S
            .of(context)
            .mantananiIslandContent, // localized key for content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/i/mantanani1.jpg",
        location: "https://maps.app.goo.gl/HU8eQ5xBpqXfxvUv7",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(S.of(context).islands,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: CardListWidget(data: dataList),
    );
  }
}

class BeyondKL_HS extends StatelessWidget {
  BeyondKL_HS({super.key});

  List<ApiData> _buildDataList(BuildContext context) {
    return [
      ApiData(
        title: S
            .of(context)
            .gentingHighlands, // localized title for "Genting Highlands, Pahang"
        content: S
            .of(context)
            .gentingHighlandsContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/hs/genting.jpg",
        location: "https://maps.app.goo.gl/UVBCR4wnuBBYP5Ka8",
      ),
      ApiData(
        title: S
            .of(context)
            .bukitTinggi, // localized title for "Bukit Tinggi, Pahang"
        content:
            S.of(context).bukitTinggiContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/hs/bukittinggi1.jpg",
        location: "https://maps.app.goo.gl/ooY7RjT7gxSo5eGo6",
      ),
      ApiData(
        title: S
            .of(context)
            .fraserHill, // localized title for "Fraser Hill, Pahang"
        content:
            S.of(context).fraserHillContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/hs/fraserhill.jpg",
        location: "https://maps.app.goo.gl/oUbq1qzrkK7wuV4H9",
      ),
      ApiData(
        title: S
            .of(context)
            .cameronHighland, // localized title for "Cameron Highland, Pahang"
        content: S
            .of(context)
            .cameronHighlandContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/hs/cameron.jpg",
        location: "https://maps.app.goo.gl/CZQuL7oUem4ET6pV6",
      ),
      ApiData(
        title: S
            .of(context)
            .maxwellHill, // localized title for "Maxwell Hill, Perak"
        content:
            S.of(context).maxwellHillContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/hs/cameron.jpg",
        location: "https://maps.app.goo.gl/NHNwxBvPn4Qc23Zb6",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final dataList = _buildDataList(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(S.of(context).hillStation,
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: CardListWidget(data: dataList),
    );
  }
}

class BeyondKL_W extends StatelessWidget {
  BeyondKL_W({super.key});

  List<ApiData> _buildDataList(BuildContext context) {
    return [
      ApiData(
        title: S
            .of(context)
            .sungaiPisangWaterfall, // localized title for "Sungai Pisang Waterfall, Batu Caves"
        content:
            S.of(context).sungaiPisangContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/w/sungaipisang.jpg",
        location: "https://maps.app.goo.gl/Mx2BdsVN1WPNzBgA6",
      ),
      ApiData(
        title: S
            .of(context)
            .jeramToi, // localized title for "Jeram Toi, Negeri Sembilan"
        content: S.of(context).jeramToiContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/w/jeramtoi.jpg",
        location: "https://maps.app.goo.gl/u4QKamLSrrF6RQqa6",
      ),
      ApiData(
        title:
            S.of(context).uluChepor, // localized title for "Ulu Chepor, Perak"
        content:
            S.of(context).uluCheporContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/w/uluchepor.jpg",
        location: "https://maps.app.goo.gl/xyMVK89D9XoMgp188",
      ),
      ApiData(
        title: S
            .of(context)
            .sungaiLembing, // localized title for "Sungai Lembing, Pahang"
        content:
            S.of(context).sungaiLembingContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/w/sungailembing.jpg",
        location: "https://maps.app.goo.gl/nuhAbMUbbA7ByYCCA",
      ),
      ApiData(
        title: S
            .of(context)
            .sevenWellsWaterfall, // localized title for "Seven Wells Waterfall, Kedah"
        content:
            S.of(context).sevenWellsContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/w/sevenwells1.jpg",
        location: "https://maps.app.goo.gl/eGkiZ5hRxmYQ8ips6",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final dataList = _buildDataList(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(S.of(context).waterfall,
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: CardListWidget(data: dataList),
    );
  }
}

class BeyondKL_H extends StatelessWidget {
  BeyondKL_H({super.key});

  List<ApiData> _buildDataList(BuildContext context) {
    return [
      ApiData(
        title: S
            .of(context)
            .brogaHill, // localized title for "Broga Hill, Semenyih"
        content:
            S.of(context).brogaHillContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/h/brogahill.jpg",
        location: "https://maps.app.goo.gl/tDdapXxffn8DEbtm6",
      ),
      ApiData(
        title: S
            .of(context)
            .mountPulai, // localized title for "Mount Pulai, Johor"
        content:
            S.of(context).mountPulaiContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/h/mountpulai.jpg",
        location: "https://maps.app.goo.gl/evbpwftijzWyfmYKA",
      ),
      ApiData(
        title: S
            .of(context)
            .panoramaHill, // localized title for "Panorama Hill, Sungai Lembing"
        content:
            S.of(context).panoramaHillContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/h/panoramahill.jpg",
        location: "https://maps.app.goo.gl/fDAgtnbzyfwDiKar9",
      ),
      ApiData(
        title: S
            .of(context)
            .mossyForest, // localized title for "Mossy Forest, Cameron Highlands"
        content:
            S.of(context).mossyForestContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/h/mossyforest.jpg",
        location: "https://maps.app.goo.gl/YyURpsoqwtc9yv5Z8",
      ),
      ApiData(
        title: S
            .of(context)
            .penangNationalPark, // localized title for "Penang National Park, Penang"
        content: S
            .of(context)
            .penangNationalParkContent, // localized content description
        image:
            "https://www.kltheguide.com.my/assets/img/beyondkl/h/penangnational.jpg",
        location: "https://maps.app.goo.gl/UhZS5nanNDCRAgJHA",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final dataList = _buildDataList(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            Text(S.of(context).hiking, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: CardListWidget(data: dataList),
    );
  }
}

class BeyondKL_ES extends StatelessWidget {
  BeyondKL_ES({super.key});

  List<ApiData> _buildDataList(BuildContext context) {
    return [
      ApiData(
        title: S
            .of(context)
            .kkbParaglidingPark, // localized key for "KKB Paragliding Park"
        content: S
            .of(context)
            .kkbParaglidingParkContent, // localized content description
        image: "https://www.kltheguide.com.my/assets/img/beyondkl/es/1.webp",
        location: "https://maps.app.goo.gl/QXFGUuurwNCTMAT56",
      ),
      ApiData(
        title: S
            .of(context)
            .whitewaterRafting, // localized key for "Whitewater Rafting Kuala Kubu Bharu"
        content: S
            .of(context)
            .whitewaterRaftingContent, // localized content description
        image: "https://www.kltheguide.com.my/assets/img/beyondkl/es/2.jpg",
        location: "https://maps.app.goo.gl/GLiYCoyCo5T4wjZ28",
      ),
      ApiData(
        title: S.of(context).jugraHill, // localized key for "Jugra Hill"
        content:
            S.of(context).jugraHillContent, // localized content description
        image: "https://www.kltheguide.com.my/assets/img/beyondkl/es/3.webp",
        location: "https://maps.app.goo.gl/3TGSagXPnaYTre3f9",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final dataList = _buildDataList(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(S.of(context).extremeSports,
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: CardListWidget(data: dataList),
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





































































//////////////////////////////////////**API METHOD**////////////////////////////////////////////*/

// ignore_for_file: camel_case_types

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:kltheguide/main.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ApiData {
//   final String title;
//   final String content;
//   final String image;
//   final String location;

//   ApiData({
//     required this.location,
//     required this.title,
//     required this.content,
//     required this.image,
//   });

//   factory ApiData.fromJson(Map<String, dynamic> json) {
//     return ApiData(
//       title: json['title'] ?? '',
//       content: json['content'] ?? '',
//       image: json['image'] ?? '',
//       location: json['location'] ?? '',
//     );
//   }
// }

// Future<List<ApiData>> fetchData(bodyparse) async {
//   final response = await http.post(
//     Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
//     body: {bodyparse: bodyparse},
//   );

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = jsonDecode(response.body);
//     return jsonData.map((json) => ApiData.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// Future<List<ApiData>> fetchData2(bodyparse, category) async {
//   final response = await http.post(
//     Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
//     body: {bodyparse: bodyparse, 'category': category},
//   );

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = jsonDecode(response.body);
//     return jsonData.map((json) => ApiData.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// class CardListWidget extends StatelessWidget {
//   final List<ApiData> data;

//   const CardListWidget({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         final item = data[index];

//         return GestureDetector(
//           onTap: () {
//             // print(item.location);
//             if (item.location != '') {
//               _launchURL(item.location);
//             }
//           },
//           child: Card(
//             elevation: 4.0,
//             margin: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: item.image,
//                   fit: BoxFit.cover,
//                   height: 200,
//                   width: double.infinity,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         (item.title),
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8.0),
//                       Text(item.content.replaceAll('\\n', '\n')),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class BeyondKL extends StatelessWidget {
//   final List<Map<String, dynamic>> dataList = [
//     {
//       "name": "Islands",
//       "image": "https://www.kltheguide.com.my/assets/img/beyondkl/ISLAND-01.jpg"
//     },
//     {
//       "name": "Hill Station",
//       "image":
//           "https://www.kltheguide.com.my/assets/img/beyondkl/HILL-STATION-01.jpg"
//     },
//     {
//       "name": "Waterfall",
//       "image":
//           "https://www.kltheguide.com.my/assets/img/beyondkl/WATERFALL-01.jpg"
//     },
//     {
//       "name": "Hiking",
//       "image": "https://www.kltheguide.com.my/assets/img/beyondkl/HIKING.jpg"
//     },
//     {
//       "name": "Extreme Sports",
//       "image":
//           "https://www.kltheguide.com.my/assets/img/beyondkl/EXTREME-SPORT-2.webp"
//     },

//     // Add more items as needed
//   ];

//   BeyondKL({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Beyond KL", style: TextStyle(color: Colors.white)),
//         // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//         backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//         actions: const <Widget>[
//           AppBarMore(),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: dataList.length,
//         itemBuilder: (context, index) {
//           final item = dataList[index];
//           return CardItem(
//               name: item["name"], image: item["image"], index: index);
//         },
//       ),
//     );
//   }
// }

// class CardItem extends StatelessWidget {
//   final String name;
//   final String image;
//   final int index;

//   const CardItem(
//       {super.key,
//       required this.name,
//       required this.image,
//       required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to a detail page or perform an action when the card is tapped
//         // You can use Navigator to navigate to a detail page with specific data
//         // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(name: name, image: image)));
//         Navigator.pushNamed(context, '/beyondkl-$index',
//             arguments: {'index': index});
//       },
//       child: Card(
//         elevation: 3,
//         margin: const EdgeInsets.all(10),
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(image),
//                 fit: BoxFit.cover, // Make the image cover the entire card
//               ),
//             ),
//             child: Center(
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 color: Colors.black
//                     .withOpacity(0.5), // Adjust the opacity as needed
//                 child: Text(
//                   name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DetailPage extends StatelessWidget {
//   final String name;
//   final String image;
//   final String location;

//   const DetailPage({
//     super.key,
//     required this.name,
//     required this.image,
//     required this.location,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Center(
//         child: Text(location),
//       ),
//     );
//   }
// }

// class BeyondKL_I extends StatefulWidget {
//   const BeyondKL_I({super.key});

//   @override
//   _BeyondKL_IState createState() => _BeyondKL_IState();
// }

// class _BeyondKL_IState extends State<BeyondKL_I> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appBeyondKL_i');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Islands", style: TextStyle(color: Colors.white)),
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

// class BeyondKL_HS extends StatefulWidget {
//   const BeyondKL_HS({super.key});

//   @override
//   _BeyondKL_HSState createState() => _BeyondKL_HSState();
// }

// class _BeyondKL_HSState extends State<BeyondKL_HS> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appBeyondKL_hs');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title:
//             const Text("Hill Station", style: TextStyle(color: Colors.white)),
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

// class BeyondKL_W extends StatefulWidget {
//   const BeyondKL_W({super.key});

//   @override
//   _BeyondKL_WState createState() => _BeyondKL_WState();
// }

// class _BeyondKL_WState extends State<BeyondKL_W> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appBeyondKL_w');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Waterfall", style: TextStyle(color: Colors.white)),
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

// class BeyondKL_H extends StatefulWidget {
//   const BeyondKL_H({super.key});

//   @override
//   _BeyondKL_HState createState() => _BeyondKL_HState();
// }

// class _BeyondKL_HState extends State<BeyondKL_H> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appBeyondKL_h');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Hiking", style: TextStyle(color: Colors.white)),
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

// class BeyondKL_ES extends StatefulWidget {
//   const BeyondKL_ES({super.key});

//   @override
//   _BeyondKL_ESState createState() => _BeyondKL_ESState();
// }

// class _BeyondKL_ESState extends State<BeyondKL_ES> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appBeyondKL_es');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title:
//             const Text("Extreme Sports", style: TextStyle(color: Colors.white)),
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

// void _launchURL(url) async {
//   var url2 = Uri.parse(url);
//   if (await canLaunchUrl(url2)) {
//     await launchUrl(url2, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
