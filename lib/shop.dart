import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

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
          color: Colors.white, //change your color here
        ),
        title:
            const Text("Places To Shop", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList2(
        items: [
          ItemData(
            title: 'Avenue K Shop',
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/avenuek.jpg',
            location:
                '156, Jalan Ampang, Kuala Lumpur City Centre, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
            hours: '10.00 am - 10.00 pm (Daily)',
            website: 'http://www.avenuek.com.my/',
          ),
          ItemData(
            title: 'Sanctuary Mall',
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/sanctuary.jpg',
            location:
                'Persiaran Eco Sanctuary, 8/3, Eco Santuari, 42500, Selangor',
            hours: '10.00 am - 10.00 pm (Daily)',
            website: 'https://www.facebook.com/SanctuaryMall',
          ),
          ItemData(
            title: 'The LINC KL',
            imageUrl:
                'https://www.kltheguide.com.my/assets/img/place_to_shop/linc.jpeg',
            location: 'Lingkaran Syed Putra, 59200 Kuala Lumpur',
            hours: '10.00 am - 10.00 pm (Daily)',
            website: 'https://thelinckl.com.my/',
          ),
          // Add more shops here as needed
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







// API method
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:kltheguide/main.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ApiData {
//   final String title;
//   final String content;
//   final String content2;
//   final String image;
//   final String location;
//   final String locationurl;
//   final String hours;
//   final String phone;
//   final String website;

//   ApiData({
//     required this.location,
//     required this.locationurl,
//     required this.hours,
//     required this.phone,
//     required this.title,
//     required this.content,
//     required this.content2,
//     required this.image,
//     required this.website,
//   });

//   factory ApiData.fromJson(Map<String, dynamic> json) {
//     return ApiData(
//       title: json['title'] ?? '',
//       content: json['content'] ?? '',
//       content2: json['content2'] ?? '',
//       image: json['image'] ?? '',
//       location: json['location'] ?? '',
//       locationurl: json['locationurl'] ?? '',
//       hours: json['hours'] ?? '',
//       phone: json['phone'] ?? '',
//       website: json['website'] ?? '',
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
//         if (item.location != '') {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DetailPage(
//                             title: item.title,
//                             image: item.image,
//                             content: item.content,
//                             content2: item.content2,
//                             location: item.location,
//                             locationurl: item.locationurl,
//                             hours: item.hours.replaceAll('/', '\n'),
//                             phone: item.phone.replaceAll('/', '\n'),
//                             website: item.website,
//                           )));
//             },
//             child: Card(
//               elevation: 4.0,
//               margin: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CachedNetworkImage(
//                     imageUrl: item.image,
//                     fit: BoxFit.cover,
//                     height: 200,
//                     width: double.infinity,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           (item.title),
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         if (item.content != '') const SizedBox(height: 8.0),
//                         if (item.content != '')
//                           Text(item.content.replaceAll('\\n', '\n')),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return Card(
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
//           );
//         }
//       },
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

//         Navigator.pushNamed(context, '/explorekl-$index',
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
//   final String title;
//   final String content;
//   final String content2;
//   final String image;
//   final String location;
//   final String locationurl;
//   final String hours;
//   final String phone;
//   final String website;

//   const DetailPage({
//     super.key,
//     required this.location,
//     required this.locationurl,
//     required this.hours,
//     required this.phone,
//     required this.title,
//     required this.content,
//     required this.content2,
//     required this.image,
//     required this.website,
//   });

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title: const Text("Details", style: TextStyle(color: Colors.white)),
//         // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
//         backgroundColor: const Color.fromARGB(255, 0, 71, 133),
//         actions: const <Widget>[
//           AppBarMore(),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display article title
//             CachedNetworkImage(
//               imageUrl: image,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//             const SizedBox(height: 16),

//             Text(
//               title, // Replace with the actual title key
//               style: const TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             if (content != '') const SizedBox(height: 16.0),

//             // Display article content
//             if (content != '')
//               Text(
//                 content != ''
//                     ? content
//                     : '', // Replace with the actual content key
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),

//             if (content2 != '')
//               Text(
//                 content2, // Replace with the actual content key
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             if (location != '')
//               ListTile(
//                 leading: const Icon(Icons.location_pin),
//                 title: Text('Location: $location'),
//                 onTap: () {
//                   // Add functionality to open the email app with the recipient's email address pre-filled
//                   _launchURL(locationurl);
//                 },
//               ),
//             if (phone != '')
//               ListTile(
//                 leading: const Icon(Icons.phone),
//                 title: Text('Phone: $phone'),
//                 onTap: () {
//                   // Add functionality to open the email app with the recipient's email address pre-filled
//                   _launchURL('tel:$phone');
//                 },
//               ),
//             if (hours != '')
//               ListTile(
//                 leading: const Icon(Icons.watch_later),
//                 title: Text('Hours:\n $hours'),
//               ),
//             if (website != '')
//               ListTile(
//                 leading: const Icon(Icons.public),
//                 title: Text('Website: $website'),
//                 onTap: () {
//                   // Add functionality to open the email app with the recipient's email address pre-filled
//                   _launchURL(website);
//                 },
//               ),
//             // Add other widgets to display additional details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Shop extends StatefulWidget {
//   const Shop({super.key});

//   @override
//   _ShopState createState() => _ShopState();
// }

// class _ShopState extends State<Shop> {
//   late Future<List<ApiData>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = fetchData('appShop');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         title:
//             const Text("Places To Shop", style: TextStyle(color: Colors.white)),
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
