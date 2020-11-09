import 'dart:io';

import 'package:KlTheGuide/models/banAds.dart';
import 'package:KlTheGuide/screens/catgeroies_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
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
  BannerAd _bannerAd;
  BanAdsense _banAdsense;

  void initState() {
    if (Platform.isIOS) {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-7002644831588730~7281355962');
    } else {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-7002644831588730~3248809866');
    }
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

//  if (Offstage().offstage) {
//       return removeAd();
//     }

  // @override
  // void didUpdateWidget(covariant TravelTipsScreen oldWidget) {
  //   removeAd();
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void setState(fn) {
  //   removeAd();
  //   super.setState(fn);
  // }
//  @override
//   void didChangeDependencies() {
//         removeAd();

//     super.didChangeDependencies();
//   }

  // @override
  // void deactivate() {
  //   removeAd();
  //   super.deactivate();
  // }

  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          onVerticalDragCancel: () {
            if (Platform.isIOS) {
              _bannerAd ??= _banAdsense.createBannerAd();
              _bannerAd
                ..load()
                ..show(
                  anchorType: AnchorType.bottom,
                );
            } else {
              _bannerAd ??= _banAdsense.createBannerAd();
              _bannerAd
                ..load()
                ..show();
            }
          },
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
      body: pageBody,
    );
  }
}
