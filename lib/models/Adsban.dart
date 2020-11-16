import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class BanAdsense {
  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return Platform.isIOS
        ? BannerAd(
            adUnitId: 'ca-app-pub-7002644831588730/6754149455',
            //test id ('ca-app-pub-3940256099942544/2934735716')
            size: AdSize.banner,

            //   targetingInfo: targetingInfo,
            listener: (MobileAdEvent event) {
              print("BannerAd event $event");
            },
          )
        : BannerAd(
            adUnitId: 'ca-app-pub-7002644831588730/4427349537',
            //test id ('ca-app-pub-3940256099942544/6300978111')
            size: AdSize.smartBanner,

            //   targetingInfo: targetingInfo,
            listener: (MobileAdEvent event) {
              print("BannerAd event $event");
            });
  }

  void loadAd() {
    _bannerAd ??= createBannerAd();
    _bannerAd
      ..load()
      ..show();
  }

  void hideAd() async {
    await _bannerAd.dispose();
    _bannerAd = null;
  }
  void removeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void initState() {
    if (Platform.isIOS) {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-7002644831588730~7281355962');
    } else {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-7002644831588730~3248809866');
    }
    _bannerAd = createBannerAd()..load();
  }

  // @override
  // void dispose() {
  //   _bannerAd?.dispose();
  //   removeAd();

  // }
}
