// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("About Us", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo_100x50.png',
            ),
            const SizedBox(height: 16),
            const Text(
              'Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "KL The Guide is a quarterly guidebook, first published In August 2007. We are a free travel guide book that helps travellers make their travel plans around Malaysia's capital city, Kuala Lumpur. Kl The Guide includes travel tips, places to explore, kid-friendly locations, hotels, and more. With KL The Guide, navigating the city becomes easier.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Find Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.facebook_sharp,
                    color: Colors.blue,
                    size: 64,
                  ),
                  onTap: () =>
                      _launchURL('https://www.facebook.com/kltheguide/'),
                ),
                GestureDetector(
                  child: const Icon(
                    MyFlutterApp.instagram_1,
                    color: Colors.pink,
                    size: 64,
                  ),
                  onTap: () =>
                      _launchURL('https://www.instagram.com/kltheguide/'),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.tiktok,
                    size: 64,
                  ),
                  onTap: () => _launchURL('https://www.tiktok.com/@kltheguide'),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.public,
                    color: Colors.grey,
                    size: 64,
                  ),
                  onTap: () => _launchURL('https://www.kltheguide.com.my/'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Center(
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the package info, show a loading indicator
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // If there's an error, show an error message
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If the package info is available, display the app version
                    String appVersion = snapshot.data!.version;
                    String buildNumber = snapshot.data!.buildNumber;

                    return Text('App Version: $appVersion+$buildNumber');
                  }
                },
              ),
            ),
          ],
        ),
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
