import '../models/Adsban.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import '../Data/travel_tips_data.dart';
import '../widgets/travelTips_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TravelTipsScreen extends StatefulWidget {
  static const routeName = '/travel_tips_screen';
  final String appbartitle;

  const TravelTipsScreen({Key key, this.appbartitle}) : super(key: key);

  @override
  _TravelTipsScreenState createState() => _TravelTipsScreenState();
}

class _TravelTipsScreenState extends State<TravelTipsScreen> {
//Ads Code

  BannerAd _bannerAd;
  BanAdsense _banAdsense;

  void initState() {
    super.initState();
    _bannerAd = BanAdsense().createBannerAd()..load();
    showAd();
  }

  Widget showAd() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: _bannerAd == null
            ? SizedBox(height: 50)
            : Container(
                height: 50,
                child: AdWidget(ad: _bannerAd),
              ));
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

  @override
  void didUpdateWidget(covariant TravelTipsScreen oldWidget) {
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
                children: TravelTipsData.map(
                  (con) => TravelTips(
                    con.id,
                    con.title,
                    con.description,
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
        body: pageBody);
  }
}
