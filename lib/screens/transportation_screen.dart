import 'dart:io';
import '../models/Adsban.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import '../Data/transportation_data.dart';
import '../widgets/transportation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TransportationScreen extends StatefulWidget {
  static const routeName = '/transportation_screen';
  final String appbartitle;
  final String id;

  const TransportationScreen({Key key, this.appbartitle, this.id})
      : super(key: key);

  @override
  _TransportationScreenState createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
//Ads Code

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

  void showAd() {
    if (Platform.isIOS) {
      _bannerAd ??= _banAdsense.createBannerAd();
      _bannerAd..load();
    } else {
      _bannerAd ??= _banAdsense.createBannerAd();
      _bannerAd..load();
    }
  }

  void removeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  @override
  void didUpdateWidget(covariant TransportationScreen oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                children: TransportationData.map(
                  (con) => Transportation(
                    con.id,
                    con.title,
                    con.description,
                    con.tel,
                    con.image,
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(subCategoryTitle),
      ),
      body: pageBody,
    );
  }
}
