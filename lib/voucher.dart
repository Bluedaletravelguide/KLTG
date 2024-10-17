import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

// Model class for Voucher Data
class VoucherData {
  final String voucher;
  final String title;
  final String image;
  final String expiryDate;

  VoucherData({
    required this.voucher,
    required this.title,
    required this.image,
    required this.expiryDate,
  });

  factory VoucherData.fromJson(Map<String, dynamic> json) {
    return VoucherData(
      voucher: json['voucher'] ?? '',
      title: json['voucher_title'] ?? '',
      image: json['voucher_image'] ?? '',
      expiryDate: json['voucher_expiry_date'] ?? '',
    );
  }
}

// Fallback voucher data in case the server is unreachable
List<VoucherData> fallbackVoucherData = [
  VoucherData(
    voucher: 'Voucher 1',
    title: 'Stand a chance to win this voucher now!',
    image: 'assets/images/voucher_1.jpg', // Local asset image 1
    expiryDate: '31st October 2024',
  ),
  VoucherData(
    voucher: 'Voucher 2',
    title: 'Stand a chance to win this voucher now!',
    image: 'assets/images/voucher_2.jpg', // Local asset image 2
    expiryDate: '31st October 2024',
  ),
];

// Function to fetch data from the API
Future<List<VoucherData>> fetchVouchers() async {
  final response = await http.post(
    Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
    body: {'fetch_vouchers': 'true'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => VoucherData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load vouchers');
  }
}

// Widget to display voucher data in a card format
class VoucherCardList extends StatelessWidget {
  final List<VoucherData> data;

  const VoucherCardList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        String fallbackImage = index % 2 == 0
            ? 'assets/images/voucher_1.jpg'
            : 'assets/images/voucher_2.jpg';

        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the voucher image with a fallback mechanism
              CachedNetworkImage(
                imageUrl: item.image.isNotEmpty ? item.image : '',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorWidget: (context, url, error) => Image.asset(
                  fallbackImage, // Local fallback image based on index
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display the voucher title
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Display the voucher content
                    Text(item.voucher),
                    const SizedBox(height: 8.0),
                    // Display the voucher expiry date
                    Text("Expiry Date: ${item.expiryDate}"),
                    const SizedBox(height: 8.0),
                    // Claim button at the bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL();
                        },
                        child: Text('Click to claim'),
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

  // Function to launch the URL
  void _launchURL() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLScg1O4jn8bJk8B2Rr5rYQIUNkEI0K8Abz2ann19HYG6_GSUMA/viewform?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// Main widget to display the vouchers
class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  late Future<List<VoucherData>> _data = fetchVouchers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vouchers', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: FutureBuilder<List<VoucherData>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display fallback data when there is an error fetching from the server
            return VoucherCardList(data: fallbackVoucherData);
          } else {
            return VoucherCardList(data: snapshot.data ?? []);
          }
        },
      ),
    );
  }
}
