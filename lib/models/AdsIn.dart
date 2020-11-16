import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class InAdsense {
  InterstitialAd createInterstitialAd() {
    return Platform.isIOS
        ? InterstitialAd(
            adUnitId: 'ca-app-pub-7002644831588730/1306559268',
            //test id ('	ca-app-pub-3940256099942544/4411468910')
            //  targetingInfo: targetingInfo,
            listener: (MobileAdEvent event) {
              print("InterstitialAd event $event");
            },
          )
        : InterstitialAd(
            adUnitId: 'ca-app-pub-7002644831588730/9699857511',
            //test id ('ca-app-pub-3940256099942544/1033173712')
            //  targetingInfo: targetingInfo,
            listener: (MobileAdEvent event) {
              print("InterstitialAd event $event");
            },
          );
  }
}
