import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Import generated localization

class Stay extends StatefulWidget {
  const Stay({super.key});

  @override
  _StayState createState() => _StayState();
}

class _StayState extends State<Stay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Change your color here
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).topPlacesToStay),
              Tab(text: S.of(context).hotels),
              Tab(text: S.of(context).budgetHotels),
              Tab(text: S.of(context).backpackersLodge),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: Text(S.of(context).placesToStay,
              style: const TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).bukitBintang,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/top/1024px-Bukit_Bintang_intersection.jpg',
                  description: S.of(context).bukitBintangDescription,
                  address: '',
                  location: 'https://maps.app.goo.gl/k87vsCoKXVFHZyfW9',
                  contact: '',
                  website: '',
                ),
                ItemData(
                  title: S.of(context).klcc,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/top/kong-kuala-2937763_1280.jpg',
                  description: S.of(context).klccDescription,
                  address: '',
                  location: 'https://maps.app.goo.gl/i3dLezxAhc9S8bS77',
                  contact: '',
                  website: '',
                ),
                ItemData(
                  title: S.of(context).bangsarSouth,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/top/bangsarsouth-5321307_1280.jpg',
                  description: S.of(context).bangsarSouthDescription,
                  address: '',
                  location: 'https://maps.app.goo.gl/EKJTaVCAnJw1fF4V6',
                  contact: '',
                  website: '',
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).mercureKL,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/h/mercure.jpg',
                  description: '',
                  address:
                      'Jalan Kontraktor U1/14, Seksyen U1, 40150 Shah Alam, Selangor',
                  location: 'https://maps.app.goo.gl/9VFWM6zzMLhUBNXr9',
                  contact: S.of(context).mercureKLContact,
                  website: '',
                ),
                ItemData(
                  title: S.of(context).ritz_carlton,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/h/ritz-carlton.jpg',
                  description: S.of(context).ritz_description,
                  address:
                      '168, Jln Imbi, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/BSxbdTf4GybJ5XeD7',
                  contact: S.of(context).ritz_contact,
                  website: S.of(context).ritz_website,
                ),
                ItemData(
                  title: S.of(context).ansa_hotel,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/h/ansa.jpg',
                  description: S.of(context).ansa_description,
                  address:
                      '101, Jln Bukit Bintang, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/FmoJ8AogLGyPuiS88',
                  contact: S.of(context).ansa_contact,
                  website: S.of(context).ansa_website,
                ),
                ItemData(
                  title: S.of(context).royale_chulan,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/h/1.jpg',
                  description: S.of(context).chulan_description,
                  address:
                      '5, Jalan Conlay, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/oBNP96QsVrYcfDqn9',
                  contact: S.of(context).chulan_contact,
                  website: S.of(context).chulan_website,
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).grandCampbellHotel,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bh/campbell.jpg',
                  description: '',
                  address:
                      'Ground Campbell Complex, 98, Jalan Dang Wangi, 50100 Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/zYWR3Z1DHsGR2iga7',
                  contact: S.of(context).grandCampbellHotelContact,
                  website: '',
                ),
                ItemData(
                  title: S.of(context).miles_hotel,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bh/1000milesH.jpg',
                  description: S.of(context).hotel_description,
                  address:
                      '17 & 19, Jalan Tun H S Lee, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/EekrrWWjGxhCysKN6',
                  contact: S.of(context).hotel_contact,
                  website: S.of(context).hotel_website,
                ),
                ItemData(
                  title: S.of(context).ymca_hostel,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bh/ymca.jpg',
                  description: S.of(context).ymca_description,
                  address:
                      '95, Jalan Padang Belia, Brickfields, 50470 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/RjJZew8T2KFq2nuv9',
                  contact: S.of(context).ymca_contact,
                  website: S.of(context).ymca_website,
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).leoBackpackers,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bks/leo.jpg',
                  description: '',
                  address:
                      'Jalan Hang Kasturi, City Centre, 50000 Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/Rkgm5YZUP2hErhDC7',
                  contact: S.of(context).leoBackpackersContact,
                  website: '',
                ),
                ItemData(
                  title: S.of(context).pods_hostel,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bks/pod.jpg',
                  description: S.of(context).pods_description,
                  address:
                      'G-6, 30, Jalan Thambipillay, Brickfields, 50470 Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/Ly9uK9Tarp1Y4oVx5',
                  contact: S.of(context).pods_contact,
                  website: S.of(context).pods_website,
                ),
                ItemData(
                  title: S.of(context).bunk_bilik,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/accommodation/bks/bunkbilik.jpg',
                  description: S.of(context).bunk_description,
                  address:
                      'No, 9, Jalan Radin Bagus, Bandar Baru Sri Petaling, 57000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
                  location: 'https://maps.app.goo.gl/kmiWh5oqbGV96Nst9',
                  contact: S.of(context).bunk_contact,
                  website: S.of(context).bunk_website,
                ),
              ],
            ),
          ],
        ),
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
                    if (items[index].description.isNotEmpty)
                      Text(
                        '${S.of(context).description}: ${items[index].description}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    const SizedBox(height: 8.0),
                    if (items[index].address.isNotEmpty)
                      Text(
                        '${S.of(context).address}: ${items[index].address}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].location);
                      },
                      child: Text(
                        '${S.of(context).location}: ${items[index].location}',
                        style:
                            const TextStyle(fontSize: 16.0, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    if (items[index].contact.isNotEmpty)
                      Text(
                        '${S.of(context).contact}: ${items[index].contact}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].website);
                      },
                      child: Text(
                        '',
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

  void _launchURL(String url, {bool isLocation = false}) async {
    final formattedUrl = isLocation
        ? 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(url)}'
        : url;

    if (await canLaunch(formattedUrl)) {
      await launch(formattedUrl);
    } else {
      throw 'Could not launch $formattedUrl';
    }
  }
}

class ItemData {
  final String title;
  final String imageUrl;
  final String description;
  final String address;
  final String location;
  final String contact;
  final String website;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.location,
    required this.contact,
    required this.website,
  });
}
