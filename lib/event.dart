import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';


// Model class for Event Data
class EventData {
  final String title;
  final String content;
  final String location;
  final String image;
  final String day;
  final String month;
  final String year; // Added event_year here

  EventData({
    required this.title,
    required this.content,
    required this.location,
    required this.image,
    required this.day,
    required this.month,
    required this.year, // Initialize event_year
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      title: json['event_title'] ?? '',
      content: json['event_content'] ?? '',
      location: json['event_location'] ?? '',
      image: json['event_image'] ?? '',
      day: json['event_day'] ?? '',
      month: json['event_month'] ?? '',
      year: json['event_year'] ?? '', // Map event_year from JSON
    );
  }
}

// Function to fetch data from the API, filtered by selected month and year
Future<List<EventData>> fetchEventData(
    String selectedMonth, String selectedYear) async {
  final response = await http.post(
    Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
    body: {'fetch_events': 'true'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData
        .map((json) => EventData.fromJson(json))
        .where((event) =>
    event.month == selectedMonth && event.year == selectedYear)
        .toList();
  } else {
    throw Exception('Failed to load events');
  }
}

// Fallback data for different months (e.g., October, November, December)
List<EventData> fallbackEventDataForOctober = [
  // Hardcoded October events...
];
List<EventData> fallbackEventDataForNovember = [
  // Hardcoded November events...
];
List<EventData> fallbackEventDataForDecember = [
  // Hardcoded December events...
];

// More fallback data...

// Helper function to get fallback data by selected month and year
List<EventData> getFallbackData(String selectedMonth) {
  switch (selectedMonth) {
    case '10':
      return fallbackEventDataForOctober;
    case '11':
      return fallbackEventDataForNovember;
    case '12':
      return fallbackEventDataForDecember;
    default:
      return [];
  }
}

// Mapping month numbers to their names
Map<int, String> monthNames = {
  10: 'October',
  11: 'November',
  12: 'December',
};

class EventCardList extends StatelessWidget {
  final List<EventData> data;

  const EventCardList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.image.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    Text(item.content),
                    const SizedBox(height: 8.0),
                    Text("Event Day: ${item.day}"),
                    if (item.location.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Location: ${item.location}"),
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

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<List<EventData>> _data;
  String selectedMonth = DateTime.now().month.toString(); // Get current month
  String selectedYear = DateTime.now().year.toString(); // Get current year

  @override
  void initState() {
    super.initState();
    _data = fetchEventData(selectedMonth, selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    // List of available months (current and upcoming months)
    final currentMonth = DateTime.now().month;
    final availableMonths = [for (int i = currentMonth; i <= 12; i++) i];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing & Upcoming Events',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedMonth,
              items: availableMonths.map((month) {
                return DropdownMenuItem(
                  value: month.toString(),
                  child: Text(monthNames[month]!),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMonth = value!;
                  _data = fetchEventData(selectedMonth, selectedYear);
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<EventData>>(
              future: _data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Display fallback data if there's an error with the API
                  return EventCardList(
                    data: getFallbackData(selectedMonth),
                  );
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(
                      child:
                      Text('No events available for the selected month.'));
                } else {
                  return EventCardList(data: snapshot.data ?? []);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
