import 'package:flutter/material.dart';
import 'package:kltheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'generated/l10n.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(S.of(context).contactUs,
            style:
                const TextStyle(color: Colors.white)), // Localized "Contact Us"
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
              S.of(context).contactUs, // Localized "Contact Us"
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(S.of(context).email), // Localized email label
              onTap: () {
                _launchURL('mailto:enquiry@bluedale.com.my');
              },
            ),
            ListTile(
              leading: const Icon(MyFlutterApp.whatsapp),
              title: Text(S.of(context).whatsapp), // Localized WhatsApp label
              onTap: () {
                _launchURL('https://api.whatsapp.com/send?phone=60122200622');
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(S.of(context).phone), // Localized phone label
              onTap: () {
                _launchURL('tel:+60378869219');
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(S.of(context).address), // Localized address
              onTap: () {
                _launchURL('https://goo.gl/maps/p2Ew3gSvjttiQdGY9');
              },
            ),
            ListTile(
              leading: const Icon(Icons.watch_later),
              title:
                  Text(S.of(context).workingHours), // Localized working hours
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
