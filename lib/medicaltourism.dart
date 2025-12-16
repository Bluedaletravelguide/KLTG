import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Data class for Medical Tourism items
class MedicalItemData {
  final String title;
  final String content;
  final String location;
  final String locationUrl; // Maps URL
  final String imageUrl; // This should be the full URL from the PHP API
  final String hours;
  final String phone;
  final String category;

  MedicalItemData({
    required this.title,
    required this.content,
    required this.location,
    required this.locationUrl,
    required this.imageUrl,
    required this.hours,
    required this.phone,
    required this.category,
  });

  // Factory constructor to create an instance from a JSON map
  factory MedicalItemData.fromJson(Map<String, dynamic> json, String category) {
    // Determine the correct prefix based on the category
    String tablePrefix;
    switch (category.toLowerCase()) {
      case 'healthcare':
        tablePrefix = 'medical_tourism_hc';
        break;
      case 'dental':
        tablePrefix = 'medical_tourism_dtl';
        break;
      case 'dermatology': // Match the category string you pass
        tablePrefix = 'medical_tourism_der';
        break;
      case 'ophthalmology': // Match the category string you pass
        tablePrefix = 'medical_tourism_oph';
        break;
      case 'plastic surgery': // Match the category string you pass
        tablePrefix = 'medical_tourism_ps';
        break;
      default:
        tablePrefix = 'medical_tourism'; // Fallback or handle error
    }

    // Now construct the keys using the determined prefix
    String titleKey = '${tablePrefix}_title';
    String contentKey = '${tablePrefix}_content';
    String locationKey = '${tablePrefix}_location';
    String locationUrlKey = '${tablePrefix}_locationurl';
    String imageKey = '${tablePrefix}_image'; // This should already be the full URL from PHP
    String hoursKey = '${tablePrefix}_hours';
    String phoneKey = '${tablePrefix}_phone';

    return MedicalItemData(
      // Use the constructed keys
      title: json[titleKey] as String? ?? '',
      content: json[contentKey] as String? ?? '',
      location: json[locationKey] as String? ?? '',
      locationUrl: json[locationUrlKey] as String? ?? '',
      // Use the image URL directly from the JSON (as constructed by PHP)
      imageUrl: json[imageKey] as String? ?? '',
      hours: json[hoursKey] as String? ?? '',
      phone: json[phoneKey] as String? ?? '',
      category: category,
    );
  }
}

// Main Screen Widget
class MedicalT extends StatefulWidget {
  const MedicalT({super.key});

  @override
  State<MedicalT> createState() => _MedicalTState();
}

class _MedicalTState extends State<MedicalT> {
  // Define API endpoints for each category
  static const String apiUrlHc = 'http://10.0.2.2/kltheguide.com.my/api/get_medicaltourism_hc.php';
  static const String apiUrlDtl = 'http://10.0.2.2/kltheguide.com.my/api/get_medicaltourism_dtl.php';
  static const String apiUrlDer = 'http://10.0.2.2/kltheguide.com.my/api/get_medicaltourism_der.php';
  static const String apiUrlOph = 'http://10.0.2.2/kltheguide.com.my/api/get_medicaltourism_oph.php';
  static const String apiUrlPs = 'http://10.0.2.2/kltheguide.com.my/api/get_medicaltourism_ps.php';

  // Fetch functions for each category
  Future<List<MedicalItemData>> fetchHealthcareItems() async {
    final response = await http.get(Uri.parse(apiUrlHc));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MedicalItemData.fromJson(item, 'Healthcare')).toList();
    } else {
      print('API Error (Healthcare): ${response.statusCode}');
      throw Exception('Failed to load Healthcare data: ${response.statusCode}');
    }
  }

  Future<List<MedicalItemData>> fetchDentalItems() async {
    final response = await http.get(Uri.parse(apiUrlDtl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MedicalItemData.fromJson(item, 'Dental')).toList();
    } else {
      print('API Error (Dental): ${response.statusCode}');
      throw Exception('Failed to load Dental data: ${response.statusCode}');
    }
  }

  Future<List<MedicalItemData>> fetchDermatologyItems() async {
    final response = await http.get(Uri.parse(apiUrlDer));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MedicalItemData.fromJson(item, 'Dermatology')).toList();
    } else {
      print('API Error (Dermatology): ${response.statusCode}');
      throw Exception('Failed to load Dermatology data: ${response.statusCode}');
    }
  }

  Future<List<MedicalItemData>> fetchOphthalmologyItems() async {
    final response = await http.get(Uri.parse(apiUrlOph));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MedicalItemData.fromJson(item, 'Ophthalmology')).toList();
    } else {
      print('API Error (Ophthalmology): ${response.statusCode}');
      throw Exception('Failed to load Ophthalmology data: ${response.statusCode}');
    }
  }

  Future<List<MedicalItemData>> fetchPlasticSurgeryItems() async {
    final response = await http.get(Uri.parse(apiUrlPs));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MedicalItemData.fromJson(item, 'Plastic Surgery')).toList();
    } else {
      print('API Error (Plastic Surgery): ${response.statusCode}');
      throw Exception('Failed to load Plastic Surgery data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 71, 133),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.local_hospital, size: 18),
                        const SizedBox(width: 6),
                        Text(S.of(context).healthcare),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.medical_services, size: 18),
                        const SizedBox(width: 6),
                        Text(S.of(context).dental),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.face, size: 18),
                        const SizedBox(width: 6),
                        Text(S.of(context).dermatologist),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.visibility, size: 18),
                        const SizedBox(width: 6),
                        Text(S.of(context).ophthalmologist),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.healing, size: 18),
                        const SizedBox(width: 6),
                        Text(S.of(context).plasticSurgery),
                      ],
                    ),
                  ),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          title: Text(
            S.of(context).medicalTourism,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[AppBarMore()],
        ),
        body: Container(
          color: Colors.grey[100],
          child: TabBarView(
            children: [
              // Tab 0: Healthcare
              FutureBuilder<List<MedicalItemData>>(
                future: fetchHealthcareItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No healthcare data found.'));
                  }
                  return MyList2(items: snapshot.data!);
                },
              ),
              // Tab 1: Dental
              FutureBuilder<List<MedicalItemData>>(
                future: fetchDentalItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No dental data found.'));
                  }
                  return MyList2(items: snapshot.data!);
                },
              ),
              // Tab 2: Dermatology
              FutureBuilder<List<MedicalItemData>>(
                future: fetchDermatologyItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No dermatology data found.'));
                  }
                  return MyList2(items: snapshot.data!);
                },
              ),
              // Tab 3: Ophthalmology
              FutureBuilder<List<MedicalItemData>>(
                future: fetchOphthalmologyItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No ophthalmology data found.'));
                  }
                  return MyList2(items: snapshot.data!);
                },
              ),
              // Tab 4: Plastic Surgery
              FutureBuilder<List<MedicalItemData>>(
                future: fetchPlasticSurgeryItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No plastic surgery data found.'));
                  }
                  return MyList2(items: snapshot.data!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget to display the list of medical items
class MyList2 extends StatelessWidget {
  final List<MedicalItemData> items;

  const MyList2({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Card(
            elevation: 2,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _showDetailsBottomSheet(context, item),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with gradient overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                          placeholder: (context, url) => Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Icon(Icons.error, size: 50),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Color.fromARGB(255, 0, 71, 133),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.location,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Hours
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 20,
                              color: Color.fromARGB(255, 0, 71, 133),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.hours,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Action Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _launchURL(item.locationUrl), // Use locationUrl
                            icon: const Icon(Icons.map, size: 20),
                            label: Text(S.of(context).maps),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 0, 71, 133),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDetailsBottomSheet(BuildContext context, MedicalItemData item) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_on,
                  color: Color.fromARGB(255, 0, 71, 133)),
              title: Text(item.location),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time,
                  color: Color.fromARGB(255, 0, 71, 133)),
              title: Text(item.hours),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _launchURL(item.locationUrl); // Use locationUrl
                },
                icon: const Icon(Icons.directions),
                label: const Text('Get Directions'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 71, 133),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
// No need for the old ItemData class as it's replaced by MedicalItemData