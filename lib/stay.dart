import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Data class for Stay items
class StayItemData {
  final String title;
  final String content; // Assuming 'content' is used for description
  final String location; // Assuming 'location' is used for address
  final String locationUrl; // Maps URL
  final String imageUrl;
  final String hours; // Potentially unused for stay, but fetched from DB
  final String phone; // Used for contact
  final String website; // Used for website
  final String category; // To identify the source tab/api

  StayItemData({
    required this.title,
    required this.content,
    required this.location,
    required this.locationUrl,
    required this.imageUrl,
    required this.hours,
    required this.phone,
    required this.website,
    required this.category,
  });

  // Factory constructor to create an instance from a JSON map
  factory StayItemData.fromJson(Map<String, dynamic> json, String category) {
    String tablePrefix;
    switch (category.toLowerCase()) {
      case 'top':
        tablePrefix = 'accommodation_top';
        break;
      case 'hotels':
        tablePrefix = 'accommodation_h';
        break;
      case 'budget hotels': // Match the tab name exactly
        tablePrefix = 'accommodation_bh';
        break;
      case 'backpackers lodge':
        tablePrefix = 'accommodation_bks';
        break;
      default:
        tablePrefix = 'accommodation'; // Fallback
    }

    String titleKey = '${tablePrefix}_title';
    String contentKey = '${tablePrefix}_content';
    String locationKey = '${tablePrefix}_location'; // Address
    String locationUrlKey = '${tablePrefix}_locationurl';
    String imageKey = '${tablePrefix}_image';
    String hoursKey = '${tablePrefix}_hours';
    String phoneKey = '${tablePrefix}_phone';

    return StayItemData(
      title: json[titleKey] as String? ?? '',
      content: json[contentKey] as String? ?? '',
      location: json[locationKey] as String? ?? '', // Address
      locationUrl: json[locationUrlKey] as String? ?? '',
      imageUrl: json[imageKey] as String? ?? '',
      hours: json[hoursKey] as String? ?? '',
      phone: json[phoneKey] as String? ?? '',
      website: json['${tablePrefix}_website'] as String? ?? '', // Assuming website field exists
      category: category,
    );
  }
}

class Stay extends StatefulWidget {
  const Stay({super.key});

  @override
  _StayState createState() => _StayState();
}

class _StayState extends State<Stay> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Define API endpoints for each category
  static const String apiUrlTop = 'http://10.0.2.2/kltheguide.com.my/api/get_accommodation_top.php';
  static const String apiUrlHotels = 'http://10.0.2.2/kltheguide.com.my/api/get_accommodation_h.php';
  static const String apiUrlBudget = 'http://10.0.2.2/kltheguide.com.my/api/get_accommodation_bh.php'; // Your existing API
  static const String apiUrlBackpackers = 'http://10.0.2.2/kltheguide.com.my/api/get_accommodation_bks.php';

  // Fetch functions for each category
  Future<List<StayItemData>> fetchTopItems() async {
    final response = await http.get(Uri.parse(apiUrlTop));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StayItemData.fromJson(item, 'Top')).toList();
    } else {
      print('API Error (Top): ${response.statusCode}');
      throw Exception('Failed to load Top Places data: ${response.statusCode}');
    }
  }

  Future<List<StayItemData>> fetchHotelItems() async {
    final response = await http.get(Uri.parse(apiUrlHotels));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StayItemData.fromJson(item, 'Hotels')).toList();
    } else {
      print('API Error (Hotels): ${response.statusCode}');
      throw Exception('Failed to load Hotels data: ${response.statusCode}');
    }
  }

  Future<List<StayItemData>> fetchBudgetHotelItems() async {
    final response = await http.get(Uri.parse(apiUrlBudget));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StayItemData.fromJson(item, 'Budget Hotels')).toList();
    } else {
      print('API Error (Budget Hotels): ${response.statusCode}');
      throw Exception('Failed to load Budget Hotels data: ${response.statusCode}');
    }
  }

  Future<List<StayItemData>> fetchBackpackersItems() async {
    final response = await http.get(Uri.parse(apiUrlBackpackers));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StayItemData.fromJson(item, 'Backpackers Lodge')).toList();
    } else {
      print('API Error (Backpackers): ${response.statusCode}');
      throw Exception('Failed to load Backpackers Lodge data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          S.of(context).placesToStay,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: const Color.fromARGB(255, 0, 71, 133),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              tabs: [
                Tab(text: S.of(context).topPlacesToStay),
                Tab(text: S.of(context).hotels),
                Tab(text: S.of(context).budgetHotels),
                Tab(text: S.of(context).backpackersLodge),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[50]!,
              Colors.white,
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Tab 0: Top Places To Stay
            FutureBuilder<List<StayItemData>>(
              future: fetchTopItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No top places data found.'));
                }
                return MyList2(items: snapshot.data!);
              },
            ),
            // Tab 1: Hotels
            FutureBuilder<List<StayItemData>>(
              future: fetchHotelItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hotels data found.'));
                }
                return MyList2(items: snapshot.data!);
              },
            ),
            // Tab 2: Budget Hotels
            FutureBuilder<List<StayItemData>>(
              future: fetchBudgetHotelItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No budget hotels data found.'));
                }
                return MyList2(items: snapshot.data!);
              },
            ),
            // Tab 3: Backpackers Lodge
            FutureBuilder<List<StayItemData>>(
              future: fetchBackpackersItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No backpackers lodge data found.'));
                }
                return MyList2(items: snapshot.data!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<StayItemData> items;

  const MyList2({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                      placeholder: (context, url) => Container(
                        height: 220,
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 0, 71, 133),
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 220,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, size: 50),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 71, 133),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description (using content field)
                      if (item.content.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item.content, // Use content for description
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      // Address (using location field)
                      if (item.location.isNotEmpty) ...[
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          label: S.of(context).address, // Use localization for 'Address'
                          value: item.location, // Use location for address
                        ),
                        const SizedBox(height: 10),
                      ],

                      // Contact (using phone field)
                      if (item.phone.isNotEmpty) ...[
                        _buildInfoRow(
                          icon: Icons.phone_outlined,
                          label: S.of(context).contact, // Use localization for 'Contact'
                          value: item.phone, // Use phone for contact
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Action Buttons
                      Row(
                        children: [
                          if (item.locationUrl.isNotEmpty) // Use locationUrl for map link
                            Expanded(
                              child: Material(
                                color: const Color.fromARGB(255, 0, 71, 133),
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () => _launchURL(item.locationUrl), // Launch locationUrl
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.map_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'View Location', // You could localize this too if needed
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (item.website.isNotEmpty) ...[ // Use website field
                            const SizedBox(width: 10),
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () => _launchURL(item.website), // Launch website
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 0, 71, 133),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.language_outlined,
                                          color:
                                          Color.fromARGB(255, 0, 71, 133),
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Website', // You could localize this too if needed
                                          style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 0, 71, 133),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
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

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color.fromARGB(255, 0, 71, 133),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// No need for the old ItemData class as it's replaced by StayItemData