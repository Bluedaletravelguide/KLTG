import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart'; // Adjust import if necessary
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Adjust import if necessary
import 'dart:convert';
import 'package:http/http.dart' as http;

// Data class for Spa items
class SpaItemData {
  final String title;
  final String imageUrl;
  final String location;
  final String hours;
  final String content; // Added for potential use
  final String locationUrl; // Added for navigation
  final String phone; // Added for potential use

  SpaItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    required this.content,
    required this.locationUrl,
    required this.phone,
  });

  // Factory constructor to create an instance from a JSON map
  factory SpaItemData.fromJson(Map<String, dynamic> json) {
    return SpaItemData(
      title: json['spa_title'] as String? ?? '',
      imageUrl: json['spa_image'] as String? ?? '', // Assuming the PHP API returns the full URL
      location: json['spa_location'] as String? ?? '',
      hours: json['spa_hours'] as String? ?? '',
      content: json['spa_content'] as String? ?? '',
      locationUrl: json['spa_locationurl'] as String? ?? '',
      phone: json['spa_phone'] as String? ?? '',
    );
  }
}

// Main Screen Widget
class Spa extends StatefulWidget {
  const Spa({super.key});

  @override
  State<Spa> createState() => _SpaState();
}

class _SpaState extends State<Spa> {
  static const String apiUrl = 'http://10.0.2.2/kltheguide.com.my/api/get_spa.php';

  Future<List<SpaItemData>> fetchSpaItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => SpaItemData.fromJson(item)).toList();
    } else {
      print('API Error: ${response.statusCode}'); // Log status code for debugging
      throw Exception('Failed to load Spa data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          S.of(context).spaTime,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        elevation: 0,
        actions: const <Widget>[
          AppBarMore(), // Make sure this is imported/available
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 0, 71, 133).withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: FutureBuilder<List<SpaItemData>>(
          future: fetchSpaItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No spa data found.'));
            }

            // Pass the fetched data to your list widget
            return MyList2(items: snapshot.data!);
          },
        ),
      ),
    );
  }
}

// Widget to display the list of spa items
class MyList2 extends StatelessWidget {
  final List<SpaItemData> items;

  const MyList2({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section with Overlay
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          fit: BoxFit.cover,
                          height: 220,
                          width: double.infinity,
                          placeholder: (context, url) => Container(
                            height: 220,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.purple.shade400,
                                ),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 220,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                        // Gradient overlay
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Content Section
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16.0),

                          // Content
                          _buildInfoRow(
                            icon: Icons.description_rounded,
                            iconColor: Colors.green.shade400,
                            label: S.of(context).description,
                            value: item.content,
                          ),
                          const SizedBox(height: 16.0),

                          // Location
                          _buildInfoRowWithAction(
                            icon: Icons.location_on_rounded,
                            iconColor: Colors.red.shade400,
                            label: S.of(context).location,
                            value: item.location,
                            action: () => _launchURL(item.locationUrl), // Launch location URL
                          ),
                          const SizedBox(height: 12.0),

                          // Operating Hours
                          _buildInfoRow(
                            icon: Icons.access_time_rounded,
                            iconColor: Colors.purple.shade400,
                            label: S.of(context).operatingHours,
                            value: item.hours,
                          ),
                          const SizedBox(height: 16.0),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade800,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRowWithAction({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback action,
  }) {
    return InkWell( // Wrap the info row in InkWell for tap feedback
      onTap: action,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300!), // Optional subtle border
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue, // Indicate it's tappable
                      decoration: TextDecoration.underline,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios, // Indicate it's tappable
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
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