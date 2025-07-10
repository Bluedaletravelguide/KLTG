import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart'; // Import generated localization

class MedicalT extends StatefulWidget {
  const MedicalT({super.key});

  @override
  _MedicalTState createState() => _MedicalTState();
}

class _MedicalTState extends State<MedicalT> {
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
              Tab(text: S.of(context).healthcare),
              Tab(text: S.of(context).dental),
              Tab(text: S.of(context).dermatologist),
              Tab(text: S.of(context).ophthalmologist),
              Tab(text: S.of(context).plasticSurgery),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
          ),
          title: Text(S.of(context).medicalTourism,
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
                  title: S.of(context).gleneagles,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/hc/Gleneagles.png',
                  location: S.of(context).gleneaglesLocation,
                  hours: S.of(context).gleneaglesHours,
                  maps: 'https://maps.app.goo.gl/soSkhAnzWpbsxZRR6',
                  // phone: S.of(context).gleneaglesPhone,
                ),
                ItemData(
                    title: S.of(context).kpjTawakkal,
                    imageUrl:
                        'https://www.kltheguide.com.my/assets/img/medical_tourism/hc/KPJ%20Tawakkal.png',
                    location: S.of(context).kpjTawakkalLocation,
                    hours: S.of(context).kpjTawakkalHours,
                    maps: 'https://maps.app.goo.gl/ZRfNu4rfUe2bPmNh9'
                    // phone: S.of(context).kpjTawakkalPhone,
                    ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).klinikPergigianBangsar,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/dtl/bangsardental2.png',
                  location: S.of(context).klinikPergigianBangsarLocation,
                  hours: S.of(context).klinikPergigianBangsarHours,
                  maps: 'https://maps.app.goo.gl/cNtYG1N2VLUnYZdA8',
                  // phone: S.of(context).klinikPergigianBangsarPhone,
                ),
                ItemData(
                  title: S.of(context).dentalPro,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/dtl/dentalpro.png',
                  location: S.of(context).dentalProLocation,
                  hours: S.of(context).dentalProHours,
                  maps: 'https://maps.app.goo.gl/bz4df7x6QXS43g9e9',
                  // phone: S.of(context).dentalProPhone,
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).drJaneClinic,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/der/DrJaneClinic.jpg',
                  location: S.of(context).drJaneClinicLocation,
                  hours: S.of(context).drJaneClinicHours,
                  maps: 'https://maps.app.goo.gl/7UzWTKXMhCq1ZNtaA',
                  // phone: S.of(context).drJaneClinicPhone,
                ),
                ItemData(
                  title: S.of(context).dermlaze,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/der/Dermlaze.jpeg',
                  location: S.of(context).dermlazeLocation,
                  hours: S.of(context).dermlazeHours,
                  maps: 'https://maps.app.goo.gl/12UwhMvjy6ywzxfr7',
                  // phone: S.of(context).dermlazePhone,
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).isec,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/oph/isec.JPG',
                  location: S.of(context).isecLocation,
                  hours: S.of(context).isecHours,
                  maps: 'https://maps.app.goo.gl/f4pXArGmPdcnK6Uy9',
                  // phone: S.of(context).isecPhone,
                ),
                ItemData(
                  title: S.of(context).vistaEyeSpecialist,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/oph/vista.jpg',
                  location: S.of(context).vistaEyeSpecialistLocation,
                  hours: S.of(context).vistaEyeSpecialistHours,
                  maps: 'https://maps.app.goo.gl/wRsZkXypZHUBzJ1AA',
                  // phone: S.of(context).vistaEyeSpecialistPhone,
                ),
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: S.of(context).somaPlasticSurgery,
                  imageUrl:
                      'https://www.kltheguide.com.my/assets/img/medical_tourism/ps/soma_plastic_surgery.jpeg',
                  location: S.of(context).somaPlasticSurgeryLocation,
                  hours: S.of(context).somaPlasticSurgeryHours,
                  maps: 'https://maps.app.goo.gl/kNBG3FZLBCQXXEhi6',
                  // phone: S.of(context).somaPlasticSurgeryPhone,
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
                    Text(
                      '${S.of(context).location}: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${S.of(context).operatingHours}: ${items[index].hours}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        _launchURL(items[index].maps);
                      },
                      child: Text(
                        '${S.of(context).maps}: ${items[index].maps}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   child: Text(
                    //     '${S.of(context).phone}: ${items[index].phone}',
                    //     style: const TextStyle(
                    //       fontSize: 16.0,
                    //       color: Colors.blue,
                    //       decoration: TextDecoration.underline,
                    //     ),
                    //   ),
                    // ),
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

void _launchURL(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

class ItemData {
  final String title;
  final String imageUrl;
  final String location;
  final String hours;
  final String maps;
  //final String phone;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    required this.maps,
    //required this.phone,
  });
}
