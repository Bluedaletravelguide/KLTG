import 'dart:io';
import 'package:KlTheGuide/Data/SizeConfig.dart';
import 'package:KlTheGuide/Data/content_data.dart';
import 'package:KlTheGuide/models/banAds.dart';
import 'package:KlTheGuide/widgets/content/decrepitation_widget.dart';
import 'package:KlTheGuide/widgets/content/fees_widget.dart';
import 'package:KlTheGuide/widgets/content/location_widget.dart';
import 'package:KlTheGuide/widgets/content/tel_widget.dart';
import 'package:KlTheGuide/widgets/content/workHour_widget.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Medical extends StatefulWidget {
  static const routeName = '/medical_screen';
  final String appbartitle;
  final String id;
  final String image;

  Medical({Key key, this.appbartitle, this.id, this.image}) : super(key: key);

  @override
  _MedicalState createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
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
   @override
  void didUpdateWidget(covariant Medical oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }
 void removeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final contentTitle = widget.appbartitle;
    final contentId = widget.id;
    final selectcontent = MedicalData.where((selectcontent) {
      return selectcontent.categories.contains(contentId);
    }).toList();
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
                    anchorOffset: kBottomNavigationBarHeight);
            } else {
              _bannerAd ??= _banAdsense.createBannerAd();
              _bannerAd
                ..load()
                ..show();
            }
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: selectcontent.length,
                itemBuilder: (ctx, index) {
                  return ExpandableTheme(
                    data: ExpandableThemeData(
                      iconColor: Colors.redAccent,
                      iconSize: SizeConfig.safeBlockHorizontal * 5,
                      useInkWell: true,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        ExpandableNotifier(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 4,
                            color: Colors.blueGrey[300],
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.black38,
                                  width: double.infinity,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical * 24,
                                    child: Image.asset(
                                      selectcontent[index].image,
                                    ),
                                  ),
                                ),
                                ScrollOnExpand(
                                  scrollOnExpand: true,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                    ),
                                    header: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          selectcontent[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        )),
                                    collapsed: Text(
                                      selectcontent[index].decrepitation,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    expanded: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Decrepitation(
                                          text: selectcontent[index]
                                              .decrepitation,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            selectcontent[index].content,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                        Fees(
                                          text: selectcontent[index].fees,
                                        ),
                                        Tel(
                                            text: selectcontent[index].phoneNo,
                                            phone:
                                                selectcontent[index].phoneNo),
                                        WorkHour(
                                          text: selectcontent[index].workhour,
                                        ),
                                        Location(
                                          text:
                                              selectcontent[index].locationText,
                                          location:
                                              selectcontent[index].locationUrl,
                                        ),
                                      ],
                                    ),
                                    builder: (_, collapsed, expanded) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: const ExpandableThemeData(
                                              crossFadePoint: 0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(contentTitle),
      ),
      body: pageBody,
    );
  }
}
