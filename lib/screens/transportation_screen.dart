// import 'dart:io';
// import 'package:KlTheGuide/models/banAds.dart';
// import 'package:firebase_admob/firebase_admob.dart';
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


//  BannerAd _bannerAd;
//   BanAdsense _banAdsense;

//   void initState() {
//     if (Platform.isIOS) {
//       FirebaseAdMob.instance
//           .initialize(appId: 'ca-app-pub-7002644831588730~7281355962');
//     } else {
//       FirebaseAdMob.instance
//           .initialize(appId: 'ca-app-pub-7002644831588730~3248809866');
//     }
//     super.initState();
//     _bannerAd = BanAdsense().createBannerAd()..load();
//   }

//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     _banAdsense.removeAd();
//     super.dispose();
//   }

//    void removeAd() {
//     _bannerAd?.dispose();
//     _bannerAd = null;
//   }
//  @override
//   void didUpdateWidget(covariant TransportationScreen oldWidget) {
//     removeAd();
//     super.didUpdateWidget(oldWidget);
//   }
  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          onVerticalDragCancel: () {
            // if (Platform.isIOS) {
            //   _bannerAd ??= _banAdsense.createBannerAd();
            //   _bannerAd
            //     ..load()
            //     ..show(
            //         anchorType: AnchorType.bottom,
            //         anchorOffset: kBottomNavigationBarHeight);
            // } else {
            //   _bannerAd ??= _banAdsense.createBannerAd();
            //   _bannerAd
            //     ..load()
            //     ..show();
            // }
          },
          child: 
          // Padding(
          //   padding: EdgeInsets.only(bottom: 50),
          //   child: 
            SingleChildScrollView(
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
     // ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(subCategoryTitle),
      ),
      body: pageBody,
    );
  }
}
