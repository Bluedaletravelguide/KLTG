import 'dart:io';
import '../models/AdsBan.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import '../Data/content_data.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/content/decrepitation_widget.dart';
import '../widgets/content/fees_widget.dart';
import '../widgets/content/tel_widget.dart';
import '../widgets/content/workHour_widget.dart';
import '../widgets/content/location_widget.dart';
import '../widgets/content/website_widget.dart';

class ContentScreen extends StatefulWidget {
  static const routeName = '/content_screen';
  final String appbartitle;
  final String id;
  final String image;

  const ContentScreen({Key key, this.appbartitle, this.id, this.image})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
//Ads Code:

  BannerAd _bannerAd;
  BanAdsense _banAdsense;

  void initState() {
    super.initState();
    _bannerAd = BanAdsense().createBannerAd()..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _banAdsense.removeAd();
    super.dispose();
  }

  void removeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  Widget createAppBar(String title) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text(title),
      );
    } else {
      return AppBar(
        title: Text(title),
      );
    }
  }

  double getSmartBannerHeight(BuildContext context) {
    MediaQueryData mediaScreen = MediaQuery.of(context);
    double dpHeight = mediaScreen.orientation == Orientation.portrait
        ? mediaScreen.size.height
        : mediaScreen.size.width;
    print("Device height: $dpHeight");
    if (dpHeight <= 400.0) {
      return 32.0;
    }
    if (dpHeight > 720.0) {
      return 90.0;
    }
    return 50.0;
  }

  @override
  void didUpdateWidget(covariant ContentScreen oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }

//The main widget
  @override
  Widget build(BuildContext context) {
    final contentTitle = widget.appbartitle;
    final contentId = widget.id;
    final contentImage = widget.image;
    final selectcontent =
        ContentData.firstWhere((contents) => contents.id == contentId);

    final pageBody = SafeArea(
        child: Material(
      child: Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Image.asset(
                contentImage,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 0,
                child: Decrepitation(
                  text: selectcontent.decrepitation,
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text(
                selectcontent.content,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10),
            Fees(text: selectcontent.fees),
            Tel(text: selectcontent.phoneNo, phone: selectcontent.phoneNo),
            WorkHour(text: selectcontent.workhour),
            Location(
                text: selectcontent.locationText,
                location: selectcontent.locationUrl),
            Website(
              text: selectcontent.webText,
              webUrl: selectcontent.webUrl,
            ),
            SizedBox(height: 50),
          ]),
        ),
      ),
    ));

    final adPlace = _bannerAd == null
        ? Container(height: 50)
        : Container(
            height: getSmartBannerHeight(context),
            child: AdWidget(ad: _bannerAd),
          );

    return Scaffold(
      appBar: createAppBar(contentTitle),
      body: pageBody,
      bottomNavigationBar: adPlace,
    );
  }
}
