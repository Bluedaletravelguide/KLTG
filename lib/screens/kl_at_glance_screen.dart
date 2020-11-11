// import 'dart:io';
// import 'package:KlTheGuide/models/banAds.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Data/kl_at_glance_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class KlAtGlanceScreen extends StatefulWidget {
  static const routeName = '/kl_at_glance_screen';
  final String appbartitle;
  final String id;

  final String yearright;
  final String yearleft;
  final String descriptionright;
  final String descriptionleft;
  final Color colorR1;
  final Color colorR2;
  final Color colorL1;
  final Color colorL2;

  const KlAtGlanceScreen(
      {this.yearleft,
      this.yearright,
      this.descriptionright,
      this.descriptionleft,
      this.colorR1,
      this.colorR2,
      this.colorL1,
      this.colorL2,
      this.appbartitle,
      this.id});

  @override
  _KlAtGlanceScreenState createState() => _KlAtGlanceScreenState();
}

class _KlAtGlanceScreenState extends State<KlAtGlanceScreen> {
//   BannerAd _bannerAd;
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
//   void didUpdateWidget(covariant KlAtGlanceScreen oldWidget) {
//     removeAd();
//     super.didUpdateWidget(oldWidget);
//   }
  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: Container(
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown[100], Colors.yellow[50]],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
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
            child: Padding(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, /*bottom: 50*/),
              child: GridView.count(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 1,
                children: KlAtGlanceData.map(
                  (con) => Container(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TimelineTile(
                                  alignment: TimelineAlign.center,
                                  indicatorStyle: IndicatorStyle(
                                    indicatorXY: 0.5,
                                    height: constraints.maxHeight * 0.13,
                                    width: constraints.maxWidth * 0.13,
                                    padding: const EdgeInsets.all(8),
                                    indicator: Container(
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        color: Color(0xff423E37),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        con.yearleft,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  startChild: Container(
                                    constraints: BoxConstraints(
                                      minHeight: constraints.minHeight * 0.5,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          con.colorL1,
                                          con.colorL2,
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          con.descriptionleft,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          style: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  500
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TimelineTile(
                                  alignment: TimelineAlign.center,
                                  indicatorStyle: IndicatorStyle(
                                    indicatorXY: 0.5,
                                    height: constraints.maxHeight * 0.13,
                                    width: constraints.maxWidth * 0.13,
                                    padding: const EdgeInsets.all(8),
                                    indicator: Container(
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        color: Color(0xffE3B23C),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        con.yearright,
                                      ),
                                    ),
                                  ),
                                  endChild: Container(
                                    constraints: BoxConstraints(
                                      minHeight: constraints.minHeight * 0.5,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          con.colorR1,
                                          con.colorR2,
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          con.descriptionright,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          style: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  500
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text(subCategoryTitle)),
      body: pageBody,
    );
  }
}
