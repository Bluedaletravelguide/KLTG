import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

//Use the test id code first to test the ADS then you can use the real ID 
//Real id can be found in the admob account 

class InAdsense {
  InterstitialAd createInterstitialAd() {
    return Platform.isIOS
        ? InterstitialAd(
            adUnitId: 'ca-app-pub-7002644831588730/1306559268',
            //test id ('	ca-app-pub-3940256099942544/4411468910')
     
            listener: (MobileAdEvent event) {
              print("InterstitialAd event $event");
            },
          )
        : InterstitialAd(
            adUnitId: 'ca-app-pub-7002644831588730/9699857511',
            //test id ('ca-app-pub-3940256099942544/1033173712')
        
            listener: (MobileAdEvent event) {
              print("InterstitialAd event $event");
            },
          );
  }
}
