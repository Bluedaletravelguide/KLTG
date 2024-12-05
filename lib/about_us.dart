import 'package:flutter/material.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'generated/l10n.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(S.of(context).aboutUs,
            style:
                const TextStyle(color: Colors.white)), // Localized "About Us"
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
            Text(
              S.of(context).ourCompany, // Localized "Our Company"
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S
                  .of(context)
                  .ourCompanyDescription, // Localized company description
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).findUs, // Localized "Find Us"
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(S
                        .of(context)
                        .errorLoadingVersion); // Localized error message
                  } else {
                    String appVersion = snapshot.data!.version;
                    String buildNumber = snapshot.data!.buildNumber;

                    return Text(
                        '${S.of(context).appVersion} $appVersion+$buildNumber'); // Localized "App Version"
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
