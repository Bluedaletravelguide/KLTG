import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//Use the test id code first to test the ADS then you can use the real ID
//Real id can be found in the admob account

class BanAdsense {
  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return Platform.isIOS
        ? BannerAd(
            adUnitId: 'ca-app-pub-7002644831588730/6754149455',
            //test id ('ca-app-pub-3940256099942544/2934735716')
            //actual ('ca-app-pub-7002644831588730/6754149455')
            size: AdSize.banner,
            request: AdRequest(),
            listener: AdListener(
              onAdLoaded: (Ad ad) {
                print('$BannerAd loaded.');
              },
            ))
        : BannerAd(
            adUnitId: 'ca-app-pub-7002644831588730/4427349537',
            //test id ('ca-app-pub-3940256099942544/6300978111')
            //actual ('ca-app-pub-7002644831588730/4427349537')
            size: AdSize.getSmartBanner(Orientation.portrait),
            request: AdRequest(),
            listener: AdListener(onAdLoaded: (Ad ad) {
              print('$BannerAd loaded.');
            }));
  }

  void loadAd() {
    _bannerAd ??= createBannerAd();
    _bannerAd..load();
  }

  void hideAd() async {
    await _bannerAd.dispose();
    _bannerAd = null;
  }

  void removeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
}
